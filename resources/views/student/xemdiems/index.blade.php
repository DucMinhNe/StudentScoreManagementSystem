@extends('student.layouts.layout')
@section('content')
<style>
.select2-selection__rendered {
    line-height: 29px !important;
}

.select2-container .select2-selection--single {
    height: 38px !important;
}

.select2-selection__arrow {
    height: 35px !important;
}
</style>
<div class="form-group row">
    <label for="id_lop_hoc_phan" class="col-sm-2 col-form-label">Lớp Học Phần</label>
    <div class="col-sm-5">
        <select name="id_lop_hoc_phan" id="id_lop_hoc_phan" class="form-control select2" style="width: 100%;">
            @foreach ($lophocphans as $lophocphan)
            @if ($lophocphan->trang_thai == 1 && $lophocphan->trang_thai_hoan_thanh == 0)
            <option value="{{ $lophocphan->id }}">{{ $lophocphan->ten_lop_hoc_phan }}</option>
            @endif
            @endforeach
        </select>
    </div>
    <div class="col-sm-2">
        <a class="btn btn-info" href="javascript:void(0)" id="xemBtn">Xem</a>
    </div>
</div>
<div class="row">
    <div class="col-md-6">
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Lớp: </label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="lop" value="" placeholder="" readonly>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Môn: </label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="mon" value="" placeholder="" readonly>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Giáo Viên</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="gv1" value="" placeholder="" readonly>
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Học Kỳ</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="hocky" value="" placeholder="" readonly>
            </div>
        </div>
        <div class="form-group row">
            <div class="col-sm-6">
                <div class="row">
                    <div class="col-sm-4">
                        <label class="col-form-label">Số Tín Chỉ</label>
                    </div>
                    <div class="col-sm-4">
                    </div>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="sotinchi" value="" placeholder="" readonly>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="row">
                    <div class="col-sm-4 text-lg-right">
                        <label class="col-form-label">Số Tiết</label>
                    </div>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="sotiet" value="" placeholder="" readonly>
                    </div>
                </div>
            </div>


        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Loại</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" value="" id="loaimonhoc" placeholder="" readonly>
            </div>
        </div>
    </div>
</div>
<section>
    <div class="container">
        <div class="card-body">
            <table id="example1" class="table table-bordered table-striped data-table">
                <thead>
                    <tr>
                        <th width="30px">STT</th>
                        <th>Tên Lớp Học Phần</th>
                        <th>Tên Sinh Viên</th>
                        <th>Chuyên Cần</th>
                        <th>TBKT</th>
                        <th>Thi 1</th>
                        <th>Thi 2</th>
                        <th>Tổng Kết 1</th>
                        <th>Tổng Kết 2</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
</section>
</body>
<script src="{{ asset('plugins/jquery/jquery.js') }}"></script>
<script type="text/javascript">
$(function() {
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    var editingCell = null;

    $("#xemBtn").click(function() {
        var selectedLopHocPhanId = $("#id_lop_hoc_phan").val();

        $.ajax({
            url: 'xemdiem/get-thong-tin-lop-hoc-phan',
            type: 'GET',
            dataType: 'json',
            data: {
                id_lop_hoc_phan: selectedLopHocPhanId
            },
            success: function(response) {
                $('#lop').val(response.ten_lop_hoc);
                $('#mon').val(response.ten_mon_hoc);
                $('#gv1').val(response.ten_gv_1 + ' - ' + response.ten_gv_2 + ' - ' +
                    response.ten_gv_3);
                $('#hocky').val(response.hoc_ky);
                $('#sotinchi').val(response.so_tin_chi);
                $('#sotiet').val(response.so_tiet);


                $('#loaimonhoc').val(response.ten_loai_mon_hoc);
            },
            error: function(xhr, status, error) {
                // Xử lý lỗi nếu có
                console.log(xhr.responseText);
            }
        });


        var table = $(".data-table").DataTable();
        table.destroy();

        var table = $('.data-table').DataTable({
            processing: true,
            serverSide: true,
            ajax: "{{ route('xemdiem.index') }}?id_lop_hoc_phan=" + selectedLopHocPhanId,
            columnDefs: [{
                "visible": false,
                "targets": 1
            }],
            columns: [{
                    data: 'id',
                    name: 'id'
                },
                {
                    data: 'ten_lop_hoc_phan',
                    name: 'ten_lop_hoc_phan'
                },
                {
                    data: 'ten_sinh_vien',
                    name: 'ten_sinh_vien'
                },
                {
                    data: 'chuyen_can',
                    name: 'chuyen_can'
                },
                {
                    data: 'tbkt',
                    name: 'tbkt'
                },
                {
                    data: 'thi_1',
                    name: 'thi_1'
                },
                {
                    data: 'thi_2',
                    name: 'thi_2'
                },
                {
                    data: 'tong_ket_1',
                    name: 'tong_ket_1'
                },
                {
                    data: 'tong_ket_2',
                    name: 'tong_ket_2'
                  
                }
            ],
            language: {
                "sEmptyTable": "Không có dữ liệu",
                "sInfo": "Hiển thị _START_ đến _END_ của _TOTAL_ bản ghi",
                "sInfoEmpty": "Hiển thị 0 đến 0 của 0 bản ghi",
                "sInfoFiltered": "(được lọc từ _MAX_ tổng số bản ghi)",
                "sInfoPostFix": "",
                "sInfoThousands": ",",
                "sLengthMenu": "Hiển thị _MENU_ bản ghi",
                "sLoadingRecords": "Đang tải...",
                "sProcessing": "Đang xử lý...",
                "sSearch": "Tìm kiếm:",
                "sZeroRecords": "Không tìm thấy kết quả nào phù hợp",
                "oPaginate": {
                    "sFirst": "Đầu",
                    "sLast": "Cuối",
                    "sNext": "Tiếp",
                    "sPrevious": "Trước"
                },
                "oAria": {
                    "sSortAscending": ": Sắp xếp tăng dần",
                    "sSortDescending": ": Sắp xếp giảm dần"
                }
            },
            dom: 'Bfrtip',
            buttons: [{
                    extend: 'copy',
                    text: 'Sao chép'
                },
                {
                    extend: 'excel',
                    text: 'Xuất Excel'
                },
                {
                    extend: 'pdf',
                    text: 'Xuất PDF'
                },
                {
                    extend: 'print',
                    text: 'In'
                },
                {
                    extend: 'colvis',
                    text: 'Hiển thị cột'
                },
                {
                    extend: 'pageLength',
                    text: 'Số bản ghi trên trang'
                }
            ],
        });
    });


 
 

});
</script>
@endsection