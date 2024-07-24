<!-- student/layouts/sidebar.blade.php -->
  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
      <!-- Brand Logo -->
      <a href="/" class="brand-link">
          <img src="{{ asset('dist/img/logo_ml.jpg') }}" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
              style="opacity: .8">
          <span class="brand-text font-weight-light">Sinh Viên</span>
      </a>

      <!-- Sidebar -->
      <div class="sidebar">
          <!-- Sidebar user panel (optional) -->
          <div class="user-panel mt-3 pb-3 mb-3 d-flex">
              <div class="image">
                  @php
                  $hinhAnhDaiDien = auth()->user()->hinh_anh_dai_dien ? asset('sinhvien_img/' .
                  auth()->user()->hinh_anh_dai_dien) : asset('dist/img/user2-160x160.jpg');
                  @endphp
                  <img src="{{ $hinhAnhDaiDien }}" class="img-circle elevation-2" alt="User Image">
                  <!-- <img src="{{ asset('sinhvien_img/' . auth()->user()->hinh_anh_dai_dien) }}"
                      class="img-circle elevation-2" alt="User Image"> -->
                  <!-- <img src="{{ asset('dist/img/user2-160x160.jpg') }}" class="img-circle elevation-2" alt="User Image"> -->
              </div>
              <div class="info">
                  <a href="/student/thongtincanhan" class="d-block"> {{auth()->user()->ten_sinh_vien}}</a>
              </div>
          </div>
          <!-- SidebarSearch Form -->
          <div class="form-inline">
              <div class="input-group" data-widget="sidebar-search">
                  <input class="form-control form-control-sidebar" type="search" placeholder="Tìm Kiếm"
                      aria-label="Search">
                  <div class="input-group-append">
                      <button class="btn btn-sidebar">
                          <i class="fas fa-search fa-fw"></i>
                      </button>
                  </div>
              </div>
          </div>

          <!-- Sidebar Menu -->
          <nav class="mt-2">
              <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                  data-accordion="false">
                  <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
                  <li class="nav-item">
                      <a href="/student" class="nav-link {{ Request::is('student') ? 'active' :''}}">
                          <i class="nav-icon fas fa-duotone fa-house"></i>
                          <p>Trang Chủ</p>
                      </a>
                  </li>
                  <li class="nav-item">
                      <a href="{{ url('/student/xemdiem') }}"
                          class="nav-link {{ Request::url() == url('/student/xemdiem') ? 'active' : '' }}">
                          <i class="nav-icon fas fa-award"></i>
                          <p>Xem Điểm</p>
                      </a>
                  </li>
                  <li class="nav-item">
                      <a href="/student/dangxuat" class="nav-link">
                          <i class="nav-icon fas fa-right-from-bracket"></i>
                          <p>Đăng Xuất</p>
                      </a>
                  </li>

              </ul>
          </nav>
          <!-- /.sidebar-menu -->
      </div>
      <!-- /.sidebar -->
  </aside>