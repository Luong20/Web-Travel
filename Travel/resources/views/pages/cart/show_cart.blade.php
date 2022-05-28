@extends('layout')
@section('content')
<section class="page-cover dashboard">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                    	<h1 class="page-title">Trang Thanh Toán</h1>
                        <ul class="breadcrumb">
                            <li><a href="#">Home</a></li>
                            <li class="active">Thanh toán</li>
                        </ul>
                    </div><!-- end columns -->
                </div><!-- end row -->
            </div><!-- end container -->
        </section><!-- end page-cover -->
        
        
        <!--===== INNERPAGE-WRAPPER ====-->
        <section class="innerpage-wrapper">
        	<div id="dashboard" class="innerpage-section-padding">
                <div class="container">
                    <div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        
                            <div class="dashboard-wrapper">
                            	<div class="row">
                          <?php
				$content = Cart::content();
				
				?>
                                    
                                    <div class="col-xs-12 col-sm-12 col-md-12 dashboard-content booking-trips">
                                		<h2 class="dash-content-title">Xác nhận thông tin và thanh toán</h2>
                                        <div class="dashboard-listing booking-listing">       
                                            <div class="table-responsive">
                                                <table class="table table-hover">
                                                    <tbody>
                                                      <form action="{{ URL::to('/order-place')}}" method="post">
                                                        {{ csrf_field() }}
                                                    	@foreach($content as $cart)
                                                        <tr>
                                                           <td>Họ và tên: </td>
                                                           <td><input type="text" name="name" value="<?php echo Session::get('name');?>"></td>
                                                           <td>Tên sản phẩm:</td>
                                                           <td>{{ $cart->name }}</td>
                                                        </tr>
                                                        <tr>
                                                           <td>Địa chỉ:</td>
                                                           <td><input type="text" name="address" value="<?php echo Session::get('address');?>"></td>
                                                           <td>Hình ảnh:</td>
                                                           <td><img src="{{ URL::to('public/uploads/product/'.$cart->options->image)}}" style="max-width: 100px" alt=""></td>
                                                         </tr>
                                                         <tr>

                                                           <td>Số điện thoại:</td>
                                                           <td><input type="text" name="phone" value="<?php echo Session::get('phone');?>"> </td>
                                                           <td>Giá:</td>
                                                           <td>{{ $cart->price }} VNĐ</td>
                                                         </tr>
                                                         <tr>
                                                           <td>Email:</td>
                                                           <td> <input type="text" name="email" value="<?php echo Session::get('email');?>"></td>
                                                           <td>Số người đi:</td>
                                                           <td> Người lớn-<?php echo Session::get('adult');?> | 
                                                           	Trẻ nhỏ-<?php echo Session::get('child');?>
                                                           </td>
                                                          </tr>
                                                          <tr>
                                                           <td>phương thức thanh toán:</td>
                                                           <td>
                                                           	<select name="payment">
                                                           		
                                                           @if(Session::get('payment_method')=='1')
                                                           	<option selected value="1">COD</option>
                                                           	@elseif(Session::get('payment_method')=='2')
                                                           	<option selected value="2">ATM</option>
                                                           	@else
                                                           	<option selected value="3">QRcode</option>
                                                           
                                                           	@endif
                                                           	<option value="1">COD</option>
                                                			<option value="2">ATM</option>
                                                			<option value="3">QRcode</option>
                                                           	</select>
                                                          	
                                                           	</td>
                                                           	<td>Tổng tiền</td>
                                                           	<td><?php 
                                                           	$tong=(Session::get('child')+Session::get('adult'))*($cart->price);
                                                           	echo $tong;
                                                           	Session::put('total',$tong);
                                                           	?> VNĐ</td>
                                                           
                                                        </tr>
                                                        <tr>
                                                        	<td>
                                                             <button class="btn btn-block btn-orange">Thanh toán</button>
                                                        	</td>	
                                                        </tr>
                                                        @endforeach
                                                      </form>
                                                    </tbody>
                                                </table>
                                            </div><!-- end table-responsive -->
                                        </div><!-- end booking-listings -->
                                        
                                    </div><!-- end columns -->
                                    
                                </div><!-- end row -->
                            </div><!-- end dashboard-wrapper -->
                        </div><!-- end columns -->
                    </div><!-- end row -->
                </div><!-- end container -->          
            </div><!-- end dashboard -->
        </section><!-- end innerpage-wrapper -->

@endsection
