@extends('layout')
@section('content')
<section class="page-cover" id="cover-login">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                    	<h1 class="page-title">Login Page</h1>
                        <ul class="breadcrumb">
                            <li><a href="#">Home</a></li>
                            <li class="active">Login Page</li>
                        </ul>
                    </div><!-- end columns -->
                </div><!-- end row -->
            </div><!-- end container -->
        </section><!-- end page-cover -->
        
        
        <!--===== INNERPAGE-WRAPPER ====-->
        <section class="innerpage-wrapper">
        	<div id="login" class="innerpage-section-padding">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12">
                        
                        	<div class="flex-content">
                                <div class="custom-form custom-form-fields">
                                    <h3>Đăng nhập</h3>
                                    
                                    <form  action="{{URL::to('/login-customer')}}" method="POST">
                                            {{csrf_field()}}
                                        <div class="form-group">
                                             <input type="email" class="form-control" name="customer_email" placeholder="Tài khoản"  required/>
                                             <span><i class="fa fa-user"></i></span>
                                        </div>
                                        
                                        <div class="form-group">
                                             <input type="password" class="form-control" name="customer_pass"placeholder="Mật khẩu"  required/>
                                             <span><i class="fa fa-lock"></i></span>
                                        </div>
                                        
                                        <button class="btn btn-orange btn-block">Đăng nhập</button>
                                    </form>
                            </div><!-- end form-content -->
                            
                        </div><!-- end columns -->
                    </div><!-- end row -->
                </div><!-- end container -->         
            </div><!-- end login -->
        </section><!-- end innerpage-wrapper -->
        
@endsection