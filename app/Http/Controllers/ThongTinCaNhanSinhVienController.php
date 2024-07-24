<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Hash;
use App\Models\SinhVien;
class ThongTinCaNhanSinhVienController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('student.thongtincanhans.index');  
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        # Validation
        $request->validate([
            'mat_khau_cu' => 'required',
            'mat_khau_moi' => 'required',
            'nhap_lai_mat_khau' => 'required|same:mat_khau_moi',
        ], [
            'mat_khau_cu.required' => 'Vui lòng nhập Mật khẩu cũ.',
            'mat_khau_moi.required' => 'Vui lòng nhập Mật khẩu mới.',
            'nhap_lai_mat_khau.required' => 'Vui lòng nhập lại Mật khẩu.',
            'nhap_lai_mat_khau.same' => 'Mật khẩu nhập lại không khớp với Mật khẩu mới.',
        ]);
        
      
        if(!Hash::check($request->mat_khau_cu, auth()->user()->mat_khau)){
            return response()->json(['success' => false, 'message' => 'Mật khẩu cũ không khớp'], 422);
        }

        SinhVien::where('ma_sv', auth()->user()->ma_sv)->update([
            'mat_khau' => Hash::make($request->mat_khau_moi)
        ]);

        return response()->json(['success' => true, 'message' => 'Cập Nhật Thành Công']);

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}