@extends('admin_layout')
@section('admin_content')
<div class="table-agile-info">
  <div class="panel panel-default">
    <div class="panel-heading">
      Liệt kê đơn hàng
    </div>
    <div class="row w3-res-tb">
      <div class="col-md-4">
        <h4>Tổng doanh thu:
          {{$tong}} VNĐ
        </h4>
      </div>
    </div>

    <div class="table-responsive">
                      <?php
                            $message = Session::get('message');
                            if($message){
                                echo '<span class="text-alert">'.$message.'</span>';
                                Session::put('message',null);
                            }
                            ?>
      <table class="table table-striped b-t b-light">
        <thead>
          <tr>
            <th>Tên người đặt</th>
            <th>Tổng tiền</th>
            <th>Tình trạng</th>
            <th>Ngày đặt</th>
            <th>Hiển thị</th>
            
            <th style="width:30px;"></th>
          </tr>
        </thead>
        <tbody>
          @foreach($all_order as $key => $order)
          <tr>  
            <td>{{ $order->customer_name }}</td>
            <td>{{ $order->order_total }}</td>
            <td>
                 <?php
               if($order->order_status==0){
                ?>
                <a href="{{URL::to('/unactive-order/'.$order->order_id)}}">Đang chờ xử lý</a>
                <?php
                 }else{
                ?>  
                 <a href="#">Đã xác nhận</a>
                <?php
               }
              ?>
            </td>
            <td>{{ $order->order_date}}</td>
            <td>
              <a href="{{URL::to('/view-order/'.$order->order_id)}}" class="active styling-edit" ui-toggle-class="">
                <i class="fa fa-pencil-square-o text-success text-active"></i></a>
              <a onclick="return confirm('Bạn có chắc là muốn xóa đơn hàng không?')" href="{{URL::to('/delete-order/'.$order->order_id)}}" class="active styling-edit" ui-toggle-class="">
                <i class="fa fa-times text-danger text"></i>
              </a>
            </td>
          </tr>
          @endforeach
        </tbody>
      </table>
    </div>
  </div>
</div>
@endsection