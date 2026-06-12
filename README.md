# Student Score Management System

A full-featured academic management web application for colleges and universities — covering the entire chain from faculties, curricula and course sections down to spreadsheet-style grade entry, semester GPA calculation and a self-service student grade portal.

![PHP](https://img.shields.io/badge/PHP-%E2%89%A58.0-777BB4?logo=php&logoColor=white)
![Laravel](https://img.shields.io/badge/Laravel-9.x-FF2D20?logo=laravel&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL%20%2F%20MariaDB-10.4-4479A1?logo=mysql&logoColor=white)
![AdminLTE](https://img.shields.io/badge/AdminLTE-3.2-0073B7)
![Bootstrap](https://img.shields.io/badge/Bootstrap-4-7952B3?logo=bootstrap&logoColor=white)
![Vite](https://img.shields.io/badge/Vite-4-646CFF?logo=vite&logoColor=white)

> The application UI and domain model are in Vietnamese (sinh viên = student, giảng viên = lecturer, lớp học phần = course section, nhập điểm = grade entry).

## Features

### Two separate portals, two auth guards
- **Staff portal** (`/admin`) — session guard backed by the `GiangVien` (lecturer) model.
- **Student portal** (`/student`) — a second session guard backed by the `SinhVien` model, so students and staff authenticate against completely separate tables.
- **Role-based access control** via a custom `checkchucvu` route middleware with three staff roles: Super Admin, Admin and Lecturer. Whole route groups are gated per role; unauthorized users land on a dedicated 403 page.
- **Email-based password reset** for staff accounts using Laravel's password broker over SMTP.

### Academic catalog management (admin)
Full CRUD with server-side DataTables for the entire academic structure:
- Faculties (khoa), majors (chuyên ngành), departments (bộ môn)
- Subjects (môn học) and subject types
- Classes (lớp học), course sections (lớp học phần) and section enrollment
- Training programs (chương trình đào tạo) with per-semester curriculum details
- Rooms and room types, lecturer/student position assignments
- **Soft-delete with a recycle bin**: every module flags records inactive instead of deleting, lists them via a `getInactiveData` endpoint and restores them with one click.
- **One-click cloning** of section enrollments between course sections and of curriculum details between training programs.

### Grade management
- **Spreadsheet-style grade entry** (`/admin/nhapdiem`): lecturers only see sections they are assigned to teach (each section supports up to three lecturers). Grade cells are `contenteditable` and each edit is persisted instantly via AJAX — no save button, no page reload.
- **Grade components per student per section**: attendance score, coursework average, exam 1 / exam 2, and final grade with a retake column (`tổng kết 1/2`).
- **Semester GPA endpoints**: SQL aggregation computes per-student averages across six semesters, always taking the better of the first attempt and the retake.
- **Graduation check**: a per-class endpoint evaluates every student as *Đạt / Không đạt* (pass/fail) based on failed-course count and overall average.
- **Student grade portal** (`/student/xemdiem`): students see grades only for the sections they are actually enrolled in, plus a personal-profile page.

### Bulk student import from Excel
- Upload an `.xlsx` file (downloadable template ships at [`public/file/mau_excel.xlsx`](public/file/mau_excel.xlsx)) to enroll an entire class at once via `maatwebsite/excel`.
- The importer normalizes gender values, generates each student's institutional email from their student ID, and creates a login account (username = student ID, initial password = national ID number, bcrypt-hashed).

### Dashboard
- Admin landing page with live counts (students, lecturers, faculties, majors) loaded over AJAX endpoints.

## Tech stack

| Layer | Technology |
|---|---|
| Backend | PHP ≥ 8.0.2, Laravel Framework 9.x |
| Database | MySQL / MariaDB (dump exported from MariaDB 10.4) |
| Auth | Laravel session guards ×2, Laravel Sanctum 3.x (API tokens), custom role middleware |
| Tables | Yajra Laravel DataTables 10.x (server-side processing) |
| Excel | Maatwebsite Excel 3.1 (student import) |
| UI | Blade templates, AdminLTE 3.2, Bootstrap 4, jQuery DataTables + bundled AdminLTE plugin pack |
| Assets | Vite 4 + laravel-vite-plugin, Axios, Lodash |
| Dev tooling | PHPUnit 9.5, Laravel Pint, Laravel Sail, Faker, kitloong/laravel-migrations-generator |

## Getting started

### Prerequisites
- PHP ≥ 8.0.2 with common extensions (pdo_mysql, mbstring, openssl, gd/zip for Excel import)
- Composer
- MySQL or MariaDB
- Node.js + npm (optional — only needed for the Vite asset entrypoints; the AdminLTE theme is pre-built in `public/dist`)

### Setup

```bash
git clone https://github.com/DucMinhNe/StudentScoreManagementSystem.git
cd StudentScoreManagementSystem

# 1. Install PHP dependencies
composer install

# 2. Configure environment
#    A working .env is included; adjust DB_* (and MAIL_* for password reset) to your machine,
#    then generate a fresh app key:
php artisan key:generate

# 3. Create the database (default name: student_score_mngt), then either…

# 3a. Migrate + seed demo data (catalog + demo accounts)
php artisan migrate --seed

# 3b. …or import the full sample database dump
mysql -u root student_score_mngt < student_score_mngt.sql

# 4. Run the app
php artisan serve
```

Optional asset dev server:

```bash
npm install
npm run dev    # or: npm run build
```

### Sign in

| Portal | URL | Seeded account | Password |
|---|---|---|---|
| Staff — Super Admin | `http://127.0.0.1:8000/admin/dangnhap` | `admin` | `123` |
| Staff — Lecturer | `http://127.0.0.1:8000/admin/dangnhap` | `gv1` / `gv2` | `123` |
| Student | `http://127.0.0.1:8000/student/dangnhap` | `sv1` | `123` |

Students imported from Excel log in with their student ID as username and their national ID number as the initial password.

## Project structure

```
.
├── app/
│   ├── Http/Controllers/    # 25 controllers: catalog CRUD, grade entry, GPA, both portals
│   ├── Http/Middleware/     # CheckChucVu (role gate), AuthenticateStudent, ...
│   ├── Imports/             # SinhViensImport — Excel rows → student records + accounts
│   └── Models/              # 19 Eloquent models (SinhVien, GiangVien, LopHocPhan, ...)
├── config/                  # auth.php defines the dual web/sinhvien guards
├── database/
│   ├── migrations/          # 34 migrations: tables first, FK constraints in a second pass
│   └── seeders/             # full demo catalog + demo logins
├── public/
│   ├── dist/, plugins/      # AdminLTE 3.2 theme + jQuery plugin bundle (DataTables, ...)
│   └── file/mau_excel.xlsx  # Excel template for bulk student import
├── resources/views/
│   ├── admin/               # staff portal Blade views, one folder per module
│   └── student/             # student portal Blade views (grades, profile, login)
├── routes/web.php           # all routes: /admin group (role-gated) + /student group
├── student_score_mngt.sql   # ready-to-import sample database (schema + data)
└── vite.config.js           # Vite entrypoints (resources/css, resources/js)
```

## How it works

**Data model.** The catalog forms a hierarchy: a faculty (`Khoa`) owns majors (`ChuyenNganh`) and departments (`BoMon`); classes (`LopHoc`) belong to majors and hold students (`SinhVien`). Training programs (`ChuongTrinhDaoTao`) map subjects (`MonHoc`) to semesters through `CTChuongTrinhDaoTao`, and each delivered course section (`LopHocPhan`) links a curriculum entry to up to three lecturers. The enrollment/score table (`CTLopHocPhan`) is the heart of the system — one row per student per section carrying all grade components.

**Request pattern.** Every listing screen is a server-side DataTable: the Blade view boots a jQuery DataTable that calls back into the same controller `index` action, which detects AJAX requests and streams JSON through Yajra. Grade entry reuses this pattern with `contenteditable` cells that fire a single-column `updateOrCreate` on blur, making grade input feel like a spreadsheet.

**Safe deletes.** Records are never hard-deleted from the UI — a `trang_thai` status flag hides them, and every module exposes inactive listings plus per-record restore routes.
