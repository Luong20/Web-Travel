@extends('layout')
@section('content')
<div class="features_items"><!--features_items-->
<section class="page-cover" id="cover-tour-grid-list">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                    @foreach($category_name as $key => $name)   
                        <h2 class="title text-left">{{$name->category_name}}</h2>
                          <ul class="breadcrumb">
                            <li><a href="">Home</a></li>
                            <li class="active">{{$name->category_name}}</li>
                        </ul>
                        @endforeach
                      
                    </div><!-- end columns -->
                </div><!-- end row -->
            </div><!-- end container -->
        </section><!-- end page-cover -->
        
        
        <!--===== INNERPAGE-WRAPPER ====-->
        <section class="innerpage-wrapper">
            <div id="tour-grid" class="innerpage-section-padding">
                <div class="container">
                    <div class="row">           
                        
                        <div class="col-xs-12 col-sm-12 col-md-3 side-bar left-side-bar">
                                        
                            <div class="side-bar-block filter-block">
                                <h3>Sort By Filter</h3>
                                <p>Find your dream flights today</p>
                                
                                <div class="panels-group">
                                    
                                    <div class="panel panel-default">
                                        <div class="panel-heading">                 
                                            <a href="#panel-1" data-toggle="collapse" >Select Country <span><i class="fa fa-angle-down"></i></span></a>
                                        </div><!-- end panel-heading -->
                                        
                                        <div id="panel-1" class="panel-collapse collapse">
                                            <div class="panel-body text-left">
                                                <ul class="list-unstyled">
                                                    <li class="custom-check"><input type="checkbox" id="check01" name="checkbox"/>
                                                    <label for="check01"><span><i class="fa fa-check"></i></span>All</label></li>
                                                    <li class="custom-check"><input type="checkbox" id="check02" name="checkbox"/>
                                                    <label for="check02"><span><i class="fa fa-check"></i></span>Australia</label></li> 
                                                </ul>
                                            </div><!-- end panel-body -->
                                        </div><!-- end panel-collapse -->
                                    </div><!-- end panel-default -->
                                    
                                    <div class="panel panel-default">
                                        <div class="panel-heading">                 
                                            <a href="#panel-2" data-toggle="collapse" >Days <span><i class="fa fa-angle-down"></i></span></a>
                                        </div><!-- end panel-heading -->
                                        
                                        <div id="panel-2" class="panel-collapse collapse">
                                            <div class="panel-body text-left">
                                                <ul class="list-unstyled">
                                                    <li class="custom-check"><input type="checkbox" id="check11" name="checkbox"/>
                                                    <label for="check11"><span><i class="fa fa-check"></i></span>All</label></li>
                                                    <li class="custom-check"><input type="checkbox" id="check12" name="checkbox"/>
                                                    <label for="check12"><span><i class="fa fa-check"></i></span>2 Days</label></li>
                                                </ul>
                                            </div><!-- end panel-body -->
                                        </div><!-- end panel-collapse -->
                                    </div><!-- end panel-default -->
                                    
                                </div><!-- end panel-group -->
                                
                                <div class="price-slider">
                                    <p><input type="text" id="amount" readonly></p>
                                    <div id="slider-range"></div>
                                </div><!-- end price-slider -->
                            </div><!-- end side-bar-block -->
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 content-side">
                            <div class="row">
                            @foreach($category_by_id as $key => $product)
                                <div class="col-sm-6 col-md-4 ">
                                    <div class="grid-block main-block t-grid-block">
                                        <div class="main-img t-grid-img">
                                            <a href="{{URL::to('/chi-tiet-san-pham/'.$product->product_id ) }}">
                                                <img src="{{ URL::to('public/uploads/product/'.$product->product_image) }}"  style="max-width: 100%" alt="hotel-img" />
                                            </a>
                                            <div class="main-mask">
                                                <ul class="list-unstyled list-inline offer-price-1">
                                                    <li class="price"><span class="pkg">{!!$product->product_desc!!}</span></li>
                                                </ul>
                                            </div><!-- end main-mask -->
                                        </div><!-- end t-grid-img -->
                                        
                                         <div class="block-info t-grid-info">
                                            <div class="gia">
                                              <h3> {{ $product->product_price}} VNĐ</h3> 
                                            </div><!-- end rating -->
                                            
                                            <h3 class="block-title"><a href="tour-detail-left-sidebar.html">Du lịch-{{$product->place_end }}</a></h3>
                                            <p class="block-minor">Từ: {!! $product->place_start !!}</p>
                                            <p>Thời gian : {{ $product->date_start}} - {{ $product->date_end}} </p>
                                            <div class="grid-btn">
                                                <a href="tour-detail-left-sidebar.html" class="btn btn-orange btn-block btn-lg">View More</a>
                                            </div><!-- end grid-btn -->
                                         </div><!-- end t-grid-info -->
                                    </div><!-- end t-grid-block -->
                                </div><!-- end columns -->
                            @endforeach
                            </div><!-- end row -->
                            
                            <div class="pages">
                                <ol class="pagination">
                               
                                </ol>
                            </div><!-- end pages -->
                        </div><!-- end columns -->

                    </div><!-- end row -->
                </div><!-- end container -->
            </div><!-- end tour-grid -->
        </section><!-- end innerpage-wrapper -->

@endsection
