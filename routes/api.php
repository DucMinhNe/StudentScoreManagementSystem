<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\api\APISinhVienController;
use App\Http\Controllers\api\APIGiangVienController;
use App\Http\Controllers\APIAuthController;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
Route::get('/hash',[APIAuthController::class,'getPasswordHash']);


Route::post('/login-sinh-vien',[APIAuthController::class,'loginSinhVien']);

Route::group(['middleware'=>'auth:sanctum'],function(){
    Route::post('/logout',[APIAuthController::class,'logoutSinhVien']);
    Route::get('/check-login',[APIAuthController::class,'checkLogin']);
}); 

Route::post('/login-giang-vien',[APIAuthController::class,'DangNhapGiangVien']);
Route::group(['middleware'=>'auth:sanctum'],function(){
     Route::post('/dang-xuat-giang-vien',[APIAuthController::class,'dangXuatGiangVien'])->name('dang-xuat-gv');
     Route::get('/kiem-tra-dang-nhap-gv',[APIAuthController::class,'kiemtraDangNhap_GiangVien']);
 });
 