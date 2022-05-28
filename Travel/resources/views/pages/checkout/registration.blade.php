@extends('layout')
@section('content')
<!--================ PAGE-COVER =================-->
        <section class="page-cover" id="cover-registration">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <h1 class="page-title">Registration Page</h1>
                        <ul class="breadcrumb">
                            <li><a href="#">Home</a></li>
                            <li class="active">Registration Page</li>
                        </ul>
                    </div><!-- end columns -->
                </div><!-- end row -->
            </div><!-- end container -->
        </section><!-- end page-cover -->
        
        
        <!--===== INNERPAGE-WRAPPER ====-->
        <section class="innerpage-wrapper">
            <div id="registration" class="innerpage-section-padding">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12">
                        
                            <div class="flex-content">
                                <div class="custom-form custom-form-fields">
                                    <h3>Đăng Ký</h3>
                                    
                                    <form action="{{ URL::to('/dang-ki')}}" method="post">
                                           {{csrf_field()}}
                                        <div class="form-group">
                                             <input type="text" name="customer_name" class="form-control" placeholder="Username"  required/>
                                             <span><i class="fa fa-user"></i></span>
                                        </div>
            
                                        <div class="form-group">
                                             <input type="email" name="customer_email" class="form-control" placeholder="Email"  required/>
                                             <span><i class="fa fa-envelope"></i></span>
                                        </div>
                                        
                                        <div class="form-group">
                                             <input type="password" name="customer_password" class="form-control" placeholder="Password"  required/>
                                             <span><i class="fa fa-lock"></i></span>
                                        </div>
                                         <div class="form-group">
                                             <input type="text" name="customer_phone" class="form-control" placeholder="Số điện thoại"  required/>
                                             <span><i class="fa fa-user"></i></span>
                                        </div>
                                        <div class="form-group">
                                             <input type="date" name="customer_birthday" class="form-control" placeholder="Ngày sinh"  required/>
                                             <span><i class="fa fa-lock"></i></span>
                                        </div>
                                        
                                        <button class="btn btn-orange btn-block">Đăng Ký</button>
                                    </form>
                                    
                                    <div class="other-links">
                                        <p class="link-line">Bạn đã có tài khoản? <a href="#">Đăng nhập tại đây</a></p>
                                    </div><!-- end other-links -->
                                </div><!-- end custom-form -->
                                
                                <div class="flex-content-img custom-form-img">
                                    <img src="images/registration.jpg" class="img-responsive" alt="registration-img" />
                                </div><!-- end custom-form-img -->
                            </div><!-- end form-content -->
                            
                        </div><!-- end columns -->
                    </div><!-- end row -->
                </div><!-- end container -->         
            </div><!-- end registration -->
        </section><!-- end innerpage-wrapper -->
@endsection