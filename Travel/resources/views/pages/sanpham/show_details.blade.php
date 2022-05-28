@extends('layout')
@section('content')
<!--================ PAGE-COVER ================-->
        <section class="page-cover" id="tour-detail">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">	
                        <ul class="breadcrumb">
                            <li><a href="#">Home</a></li>
                            <li class="active">Trang chi tiết sản phẩm</li>
                        </ul>
                    </div><!-- end columns -->
                </div><!-- end row -->
            </div><!-- end container -->
        </section><!-- end page-cover -->
        
        
        <!--===== INNERPAGE-WRAPPER ====-->
        <section class="innerpage-wrapper">
        	<div id="tour-details" class="innerpage-section-padding">
                <div class="container">
                    <div class="row">        	
                        @foreach($product_details as $key => $value)
                        <div class="col-xs-12 col-sm-12 col-md-8  content-side">
      
                            <div class="detail-slider">
                                <div class="feature-slider">
                                    <div><img src="{{ URL::to('public/uploads/product/'.$value->product_image)}}" class="img-responsive" alt="feature-img"/></div>
                                </div><!-- end feature-slider -->  
                               
                                <ul class="list-unstyled features tour-features">
                                	<li><div class="f-icon"><i class="fa fa-map-marker"></i></div><div class="f-text"><p class="f-heading">khời hành:</p><p class="f-data">{{ $value->place_start }}</p></div></li>
                                    <li><div class="f-icon"><i class="fa fa-calendar"></i></div><div class="f-text"><p class="f-heading">Lịch trình</p><p class="f-data">{!! $value->product_desc !!}</p></div></li>
                                    <li><div class="f-icon"><i class="fa fa-clock-o"></i></div><div class="f-text"><p class="f-heading">Discount</p><p class="f-data">10% OFF</p></div></li>
                                </ul>
                            </div><!-- end detail-slider -->  
                            <div class="detail-tabs">
                            	<ul class="nav nav-tabs nav-justified">
                                    <li class="active"><a href="#tour-information" data-toggle="tab">Thông tin chi tiết</a></li>
                                    <li><a href="#map-overview" data-toggle="tab">Bình luận</a></li>

                                </ul>
                            	
                                <div class="tab-content">

                                    <div id="tour-information" class="tab-pane in active">
                                    	<div class="row">
                                        	
                                            <div class="col-sm-12 col-md-12 tab-text">
                                        		
                        		<h3 style="background-color:#faa61a; color:white; font-size: 26px;font-weight:bold;font-family: "><center>Tour: {{ $value->product_name}}</center> </
                        	</h3>

                                                <p>{!! $value->product_content !!}</p>
                                            </div><!-- end columns -->
                                        </div><!-- end row -->
                                    </div><!-- end hotel-overview -->
                                    
                                    <div id="map-overview" class="tab-pane">
                                    	<div class="row">
                                    		
                                        	
                                            <div class="col-sm-12 col-md-12 tab-text">
                                        		<h3>Bình luận</h3>
                                                <form action="{{URL::to('/comment/'.$value->product_id)}}" method="post">
                                                    {{ csrf_field()}}
                                                 <div class="row">
                                                 <div class="col-xs-12 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <input type="text" name="comment_name" class="form-control input input-lg" placeholder="Tên của bạn"  required/>
                                                 </div>
                                                    </div><!-- end columns -->
                                        
                                            <div class="col-xs-12 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <input type="email" name="comment_email" class="form-control input input-lg" placeholder="Địa chỉ email"  required/>
                                                </div>
                                            </div><!-- end columns -->
                                            <div class="col-xs-12 col-sm-12 col-md-12">
                                                <div class="form-group">
                                                    <textarea style="resize: none" rows="5" class="form-control" name="comment_content" id="text" placeholder="bình luận"></textarea>
                                              <script src={{ URL::to('public/ckeditor/ckeditor.js') }}></script>
                                            <script >
                                            CKEDITOR.replace( 'text', { filebrowserBrowseUrl:'{{ route('ckfinder_browser') }}', } );
                                             </script>
                                            @include('ckfinder::setup')</div>
                                            </div>  
                                            <div class="col-md-3">
                                                <div class="form-group">
                                            <button class="btn btn-block btn-orange">Bình luận</button>
                                        </div>
                                        </div>
                                    </div>
                                            </form>
                                <div id="comments">
                                    @foreach($comment as $comm)
                                    <div class="comment-block">
                                        <div class="user-img">
                                            <img src="{{ URL::to('public/uploads/user.png') }}" style="max-width: 100px;" class="img-responsive" alt="user-img" />
                                        </div><!-- end user-img -->
                                        
                                        <div class="user-text">
                                            <ul class="list-inline list-unstyled">
                                                <li class="user-name">{{ $comm->comment_name}}</li>
                                                <li class="date">{{ $comm->comment_date}}</li>
                                            </ul>
                                            <p> {!! $comm->comment_content!!}</p>
                                        </div><!-- end user-text -->       
                                    
                                        </div><!-- end comments -->
                                    @endforeach
                                            </div><!-- end columns -->
                                        </div><!-- end row -->
                                    </div><!-- end pick-up -->
                                    </div>
                                </div><!-- end tab-content -->
                            </div><!-- end detail-tabs -->
                            
                            <div class="available-blocks" id="available-tours">
                            	<h2>Sản phẩm liên quan</h2>
                            	@foreach($relate as $key => $lienquan)
                            	<div class="list-block main-block t-list-block">
                                    <div class="list-content">
                                        <div class="main-img list-img t-list-img">
                                            <a href="tour-detail-right-sidebar.html">
                                                <img src="{{ URL::to('public/uploads/product/'.$lienquan->product_image) }}" class="img-responsive" alt="tour-img" />
                                            </a>
                                            <div class="main-mask">
                                                <ul class="list-unstyled list-inline offer-price-1">
                                                    <li class="price">{{ $lienquan->product_price }} VNĐ<span class="divider">|</span><span class="pkg">{!! $lienquan->product_desc !!}</span></li>
                                                </ul>
                                            </div><!-- end main-mask -->
                                        </div><!-- end t-list-img -->
                                        
                                        <div class="list-info t-list-info">
                                            <h3 class="block-title"><a href="tour-detail-right-sidebar.html">{{ $lienquan->product_name }}</a></h3>
                                            <p class="block-minor">khởi hành: {{ $lienquan->place_start }}</p>
                                            <p>Thời gian: {{ $lienquan->date_start }}</p>
                                            <a href="tour-detail-right-sidebar.html" class="btn btn-orange btn-lg">View More</a>
                                         </div><!-- end t-list-info -->
                                    </div><!-- end list-content -->
                                </div><!-- end t-list-block -->
                                @endforeach
                            </div><!-- end available-tours -->
                                                       
                            <div class="pages">                               
                                    {!! $relate->links() !!}
                            </div><!-- end pages -->
                        </div><!-- end columns -->
                                                
                        <div class="col-xs-12 col-sm-12 col-md-4 side-bar right-side-bar">
                            
                            <div class="side-bar-block booking-form-block">
                            	<h2 class="selected-price">{{ $value->product_price }} VNĐ<span>1 người</span></h2>
                            
                            	<div class="booking-form">
                                	<center><h3>Đặt tour</h3></center>
                                    <form action='{{ URL::to('/save-cart')}}' method="post">
                                    	{{ csrf_field()}}
                                    	<input type="hidden" name="productid_hidden" value="{{ $value->product_id}}">
                                    	<div class="form-group">
                                    		<input type="text" name="shipping_name"class="form-control" placeholder="Họ tên" required/>
                                        </div>
                                        <div class="form-group">
                                    		<input type="email" name="shipping_email"class="form-control" placeholder="Email" required/>
                                        </div>
                                        
                                        <div class="form-group">
                                    		<input type="text" name="shipping_phone"class="form-control" placeholder="Số điện thoại" required/>
                                        </div>
                                             <div class="form-group">
                                    		<input type="text" name="shipping_address" class="form-control" placeholder="Địa chỉ" required/>
                                        </div>
      
                                        <div class="row">
                                        	<div class="col-sm-6 col-md-12 col-lg-6 no-sp-r">
                                                <div class="form-group right-icon">
                                                    <select class="form-control" name="quantity_adult">
                                                        <option selected>Người lớn</option>
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4">4</option>
                                                    </select>
                                                    <i class="fa fa-angle-down"></i>
                                                </div>
                                            </div>
                                            
                                            <div class="col-sm-6 col-md-12 col-lg-6 no-sp-l">    
                                                <div class="form-group right-icon">
                                                    <select class="form-control" name="quantity_child">
                                                        <option selected>Trẻ nhỏ</option>
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4">4</option>
                                                    </select>
                                                    <i class="fa fa-angle-down"></i>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group right-icon">
                                            <select class="form-control" name="payment_method">
                                                <option value="" selected>phương thức thanh toán</option>
                                                <option value="1">COD</option>
                                                <option value="2">ATM</option>
                                                <option value="3">QRcode</option>
                                            </select>
                                            <i class="fa fa-angle-down"></i>
                                        </div>
         
                                        <button class="btn btn-block btn-orange">Đặt ngay</button>
                                    </form>
                         
                                </div><!-- end booking-form -->
                            </div><!-- end side-bar-block -->
                            
                        </div><!-- end columns -->  
                        @endforeach
                    </div><!-- end row -->
            	</div><!-- end container -->
            </div><!-- end tour-details -->
        </section><!-- end innerpage-wrapper -->
        			
@endsection
