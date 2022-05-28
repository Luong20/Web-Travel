@extends('layout')
@section('content')
        <!--========================= FLEX SLIDER =====================-->
        <section class="flexslider-container" id="flexslider-container-1">

            <div class="flexslider slider" id="slider-1">
                <ul class="slides">
                    
                    <li class="item-1" style="background:url(public/uploads/product/banner1.jpg) 50% 0%;background-size:cover;max-width:100%;background-repeat: no-repeat;">
                        
                    </li><!-- end item-1 -->
                    
                    <li class="item-2" style="background:url(public/uploads/product/banner2.jpg) 50% 0%;    background-size:cover;max-width:100%">
                   
                    </li><!-- end item-2 -->
                    <li class="item-3" style="background:url(public/uploads/product/Banner3.png) 50% 0%;background-size:cover;max-width:100%">

                    </li><!-- end item-2 -->
                   
                </ul>
            </div><!-- end slider -->
            
            <div class="search-tabs" id="search-tabs-1">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12">
                        
                            <ul class="nav nav-tabs center-tabs">
                               
                                <li class="active"><a href="#tours" data-toggle="tab"><span><i class="fa fa-suitcase"></i></span><span class="st-text">Tours</span></a></li>
                            </ul>
        
                            <div class="tab-content">

                                <div id="tours" class="tab-pane in active">
                                    <form action="{{ URL::to('/tim-kiem')}}" method="post">
                                        {{ csrf_field()}}
                                        <div class="row">
                                            
                                            <div class="col-xs-8 col-sm-8 col-md-8">
                                                <div class="form-group left-icon">
                                                <input type="text" class="form-control" name="keywords_submit" placeholder="Tìm kiếm" >
                                                <i class="fa fa-search"></i>
                                                </div>
                                            </div><!-- end columns -->

                                            <div class="col-xs-4 col-sm-4 col-md-4 search-btn">
                                                <button class="btn btn-orange">Search</button>
                                            </div><!-- end columns -->
                                            
                                        </div><!-- end row -->
                                    </form>
                                </div><!-- end tours -->
                                
                            </div><!-- end tab-content -->
                            
                        </div><!-- end columns -->
                    </div><!-- end row -->
                </div><!-- end container -->
            </div><!-- end search-tabs -->
            
        </section><!-- end flexslider-container -->
 <!--======================= BEST FEATURES =====================-->
        <section id="best-features" class="banner-padding black-features">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-md-3">
                        <div class="b-feature-block">
                            <span><i class="fa fa-dollar"></i></span>
                            <h3>Best Price Guarantee</h3>
                            
                        </div><!-- end b-feature-block -->
                   </div><!-- end columns -->
                   
                   <div class="col-sm-6 col-md-3">
                        <div class="b-feature-block">
                            <span><i class="fa fa-lock"></i></span>
                            <h3>Safe and Secure</h3>
                            
                        </div><!-- end b-feature-block -->
                   </div><!-- end columns -->
                   
                   <div class="col-sm-6 col-md-3">
                        <div class="b-feature-block">
                            <span><i class="fa fa-thumbs-up"></i></span>
                            <h3>Best Travel Agents</h3>
                            
                        </div><!-- end b-feature-block -->
                   </div><!-- end columns -->
                   
                   <div class="col-sm-6 col-md-3">
                        <div class="b-feature-block">
                            <span><i class="fa fa-bars"></i></span>
                            <h3>Travel Guidelines</h3>
                        </div><!-- end b-feature-block -->
                   </div><!-- end columns -->
                </div><!-- end row -->
            </div><!-- end container -->
        </section><!-- end best-features -->
        
       <!--=============== TOUR OFFERS ===============-->
        <section id="tour" class="section-padding">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="page-heading">
                            <h2>Kết quả tìm kiếm</h2>
                            <hr class="heading-line" />
                        </div><!-- end page-heading -->
                        
                         <div class="owl-carousel owl-theme owl-custom-arrow" id="owl-tour-offers">
                            @foreach($search_product as $key => $product)
                            <div class="item">
                                <div class="main-block tour-block">
                                    <div class="main-img">
                                        <a href="{{ URL::to('/chi-tiet-san-pham/'.$product->product_id)}}">
                                            <img src="{{ URL::to('public/uploads/product/'.$product->product_image)}}" class="img-responsive" alt="tour-img" />
                                        </a>
                                    </div><!-- end offer-img -->
                                    
                                    <div class="offer-price-2">
                                        <ul class="list-unstyled">
                                            <li class="price">{{ $product->product_price }} VNĐ<a href="#" ><span class="arrow">{!! $product->product_desc !!}</span></a></li>
                                        </ul>
                                    </div><!-- end offer-price-2 -->
                                        
                                    <div class="main-info tour-info">
                                        <div class="main-title tour-title">
                                            <a href="#">{{ $product->product_name}}</a>
                                            <p >Từ: {{ $product->place_start}}</p>
                                            <p>Thời gian: {{ $product->date_start}}</p>
                                        </div><!-- end tour-title -->
                                    </div><!-- end tour-info -->
                                </div><!-- end tour-block -->
                            </div><!-- end item --> 
                            @endforeach  
                        </div><!-- end owl-tour-offers -->
                        
                        <div class="view-all text-center">
                            <a href="#" class="btn btn-orange">View All</a>
                        </div><!-- end view-all -->
                    </div><!-- end columns -->
                </div><!-- end row -->
            </div><!-- end container -->
        </section><!-- end tour-offers -->

@endsection