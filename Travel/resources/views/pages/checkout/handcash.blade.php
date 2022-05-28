@extends('layout')
@section('content')
   <section class="innerpage-wrapper">
        	<div id="dashboard" class="innerpage-section-padding">
                <div class="container">
                    <div class="row">
					       <div class="col-xs-12 col-sm-12 col-md-12 dashboard-content booking-trips">
                                			<h2 class="dash-content-title">Hóa Đơn</h2>
                                        <div class="dashboard-listing booking-listing">       
                                            <div class="table-responsive">
                                                <table class="table table-hover">
                                                	@foreach($order as $hd)
                                                    <tbody>
                                                    	<tr>
                                                    	<td><b> Họ và tên </b></td>
                                            			<td>{{ $hd->shipping_name }}</td>
                                            		</tr><tr>
                                            			<td><b> Số điện thoại </b></td>
                                            			<td> {{ $hd->shipping_phone}} </td>
                                            		</tr><tr>
                                            			<td><b> Tour du lịch </b></td>
                                            			<td>{{ $hd->product_name }}</td>
                                            		</tr><tr>
                                            			<td><b> Ngày đặt  </b></td>
                                            			<td> {{$hd->order_date }} </td>
                                            		</tr><tr>
                                            			<td><b> Giá </b></td>
                                            			<td> {{ $hd->product_price }} </td>
                                            		</tr><tr>
                                            			<td><b> Số người đi </b></td>
                                            			<td>
                                            				{{ $hd->product_sales_quantity}}
                                            			</td>
                                            		</tr><tr>
                                            			<td><b> Thành tiền </b></td>
                                            			<td> {{$hd->order_total}} </td>
                                            			</tr>
                                                    </tbody>
                                                    @endforeach
                                                    <tr>
                                                    	<td><h3>Cảm ơn bạn đã tin tưởng và đặt tour du lịch ở chổ chúng tối. Chúng tôi sẽ liên hệ với bạn sớm nhất</h3></td>
                                                    </tr>
                                                </table>
                                            </div><!-- end table-responsive -->
                                        </div><!-- end booking-listings -->
                                        
                                    </div><!-- end columns -->
                                    
                                </div><!-- end row -->
                          
                </div><!-- end container -->          
            </div><!-- end dashboard -->
        </section><!-- end innerpage-wrapper -->
@endsection