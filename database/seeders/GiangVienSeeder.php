<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

use Hash;
class GiangVienSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('giang_viens')->insert([
            [
                'ma_gv' => '046123000',
                'ten_giang_vien' => 'Pham Anh Tiến',
                'email' => 'phamanhtien@edu.vn',
                'so_dien_thoai' => '0906913419',
                'so_cmt' => '123456789',
                'ngay_sinh' => '2002-04-04',
                'noi_sinh' => 'HCM',
                'gioi_tinh' => true,
                'dan_toc' => 'Kinh',
                'ton_giao' => 'Không',
                'dia_chi_thuong_tru' => 'HCM',
                'dia_chi_tam_tru' => 'HCM',
                'tai_khoan' => 'admin',
                'mat_khau' => Hash::make('123'),
                'hinh_anh_dai_dien' => null,
                'id_chuc_vu' => 1,
                'id_bo_mon' => null,
                'tinh_trang_lam_viec' => 1,
                'trang_thai' => 1,
            ],
            [
                'ma_gv' => '046123001',
                'ten_giang_vien' => 'Giáo Viên 1',
                'email' => 'gv1@edu.vn',
                'so_dien_thoai' => '0906913419',
                'so_cmt' => '123456789',
                'ngay_sinh' => '2002-04-04',
                'noi_sinh' => 'HCM',
                'gioi_tinh' => true,
                'dan_toc' => 'Kinh',
                'ton_giao' => 'Không',
                'dia_chi_thuong_tru' => 'HCM',
                'dia_chi_tam_tru' => 'HCM',
                'tai_khoan' => 'gv1',
                'mat_khau' => Hash::make('123'),
                'hinh_anh_dai_dien' => null,
                'id_chuc_vu' => 2,
                'id_bo_mon' => 2,
                'tinh_trang_lam_viec' => 1,
                'trang_thai' => 1,
            ],
            [
                'ma_gv' => '046123002',
                'ten_giang_vien' => 'Giáo Viên 2',
                'email' => 'gv2@edu.vn',
                'so_dien_thoai' => '0906913419',
                'so_cmt' => '123456789',
                'ngay_sinh' => '2002-04-04',
                'noi_sinh' => 'HCM',
                'gioi_tinh' => true,
                'dan_toc' => 'Kinh',
                'ton_giao' => 'Không',
                'dia_chi_thuong_tru' => 'HCM',
                'dia_chi_tam_tru' => 'HCM',
                'tai_khoan' => 'gv2',
                'mat_khau' => Hash::make('123'),
                'hinh_anh_dai_dien' => null,
                'id_chuc_vu' => 3,
                'id_bo_mon' => 3,
                'tinh_trang_lam_viec' => 1,
                'trang_thai' => 1,
            ],
        ]);
    }
}