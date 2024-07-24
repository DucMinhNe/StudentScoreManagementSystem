<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use Hash;
use App\Models\GiangVien;
use App\Models\SinhVien;
use Illuminate\Support\Facades\Password;
class DangNhapController extends Controller
{
    public function dangNhap(){
        if (Auth::guard('web')->check()) {
            return redirect('/admin');
        }
        return view('admin.dangnhaps.dangnhap');
    }

    public function kiemTraDangNhap(Request $request){
        $credentials = [
            'tai_khoan' => $request->input('tai_khoan'),
            'password' => $request->input('mat_khau')
        ];

        if (Auth::guard('web')->attempt($credentials, true)) {
            $user = Auth::guard('web')->user();
            if ($user->trang_thai == 0 || $user->tinh_trang_lam_viec == 0) {
                Auth::guard('web')->logout();
                return redirect('/admin/dangnhap')->with('error', 'Tài khoản của bạn đã bị vô hiệu hóa.');
            }
            return redirect('/admin');
        } else {
            return redirect()->back()->with('error', 'Tài khoản hoặc mật khẩu không đúng');
        }
    }

    public function dangXuat(){
        Auth::guard('web')->logout();
        return redirect(url('/admin/dangnhap'));
    }

    public function dangNhapSinhVien(){
        if (Auth::guard('sinhvien')->check()) {
            return redirect('/student');
        }
        return view('student.dangnhaps.dangnhap');
    }

    public function kiemTraDangNhapSinhVien(Request $request){
        $credentials = [
            'tai_khoan' => $request->input('tai_khoan'),
            'password' => $request->input('mat_khau')
        ];

        if (Auth::guard('sinhvien')->attempt($credentials, true)) {
            $user = Auth::guard('sinhvien')->user();
            if ($user->trang_thai == 0) {
                Auth::guard('sinhvien')->logout();
                return redirect()->route('studentlogin')->with('error', 'Tài khoản của bạn đã bị vô hiệu hóa.');
            }
            return redirect('/student');
        } else {
            return redirect()->back()->with('error', 'Tài khoản hoặc mật khẩu không đúng');
        }
    }

    public function dangXuatSinhVien(){
        Auth::guard('sinhvien')->logout();
        return redirect()->route('studentlogin');
    }


    public function hienFormGuiEmail()
    {
        if(!empty(Auth::check()))
        {
            return redirect('/admin');
        }
        return view('admin.dangnhaps.quenmatkhau');
    }
    public function guiEmailReset(Request $request)
    {
        $request->validate(['email' => 'required|email']);
        $status = Password::sendResetLink(
            $request->only('email')
        );
        return $status === Password::RESET_LINK_SENT
        ? back()->with(['status' => 'success', 'message' => __('Đường link đặt lại mật khẩu đã được gửi qua email của bạn.')])
            : back()->withErrors(['email' => __($status)]);
    }
    public function hienFormDatLai(Request $request, $token = null)
    {
        return view('admin.dangnhaps.datlaimatkhau', ['token' => $token, 'email' => $request->email]);
    }
    public function reset(Request $request)
    {
        $request->validate([
            'token' => 'required',
            'email' => 'required|email',
            'password' => 'required|min:8|confirmed',
        ]);

        $status = Password::reset(
            $request->only('email', 'password', 'password_confirmation', 'token'),
            function ($user, $password) {
                $user->forceFill([
                    'password' => $password,
                ]);

                $user->save();
            }
        );

        return $status === Password::PASSWORD_RESET
            ? redirect()->route('login')->with('status', __($status))
            : back()->withErrors(['email' => __($status)]);
    }
}