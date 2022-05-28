@extends('admin_layout')
@section('admin_content')
<div class="row">
            <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                           Thêm sản phẩm
                        </header>
                         <?php
                            $message = Session::get('message');
                            if($message){
                                echo '<span class="text-alert">'.$message.'</span>';
                                Session::put('message',null);
                            }
                            ?>
                        <div class="panel-body">

                            <div class="position-center">
                                <form role="form" action="{{URL::to('/save-product')}}" method="post" enctype="multipart/form-data">
                                    {{ csrf_field() }}
                            
                                <div class="col-md-6 form-group">
                                    <label for="exampleInputEmail1">Tên sản phẩm</label>
                                    <input type="text" name="product_name" class="form-control" id="exampleInputEmail1" placeholder="Tên danh mục" required="required">
                                </div>
                                  <div class="col-md-4 form-group">
                                    <label for="exampleInputEmail1">Giá sản phẩm</label>
                                    <input type="text" name="product_price" class="form-control" id="exampleInputEmail1" placeholder="Giá" required="required">
                                </div>
                        
                            
                                <div class="col-md-6 form-group">
                                    <label for="exampleInputPassword1">Loại tour</label>
                                      <select name="product_cate" class="form-control ">
                                        @foreach($cate_product as $key => $cate)
                                            <option value="{{$cate->category_id}}">{{$cate->category_name}}</option>
                                        @endforeach
                                            
                                    </select>
                                </div>
                                  <div class="col-md-6 form-group">
                                    <label for="exampleInputPassword1">Hiển thị</label>
                                      <select name="product_status" class="form-control ">
                                            <option value="0">Ẩn</option>
                                            <option value="1">Hiển thị</option>
                                            
                                    </select>
                                </div>
                     
                                <div class="col-md-6 form-group">
                                    <label for="exampleInputPassword1">Điạ điểm khởi hành</label>
                                      <select name="place_start" class="form-control ">
                                        @foreach($brand_product as $key => $brand)
                                            <option value="{{$brand->brand_name}}">{{$brand->brand_name}}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class=" col-md-6 form-group">
                                     <label for="exampleInputPassword1">Điạ điểm du lịch</label>
                                      <select name="place_end" class="form-control ">
                                        @foreach($brand_product as $key => $brand)
                                            <option value="{{$brand->brand_name}}">{{$brand->brand_name}}</option>
                                        @endforeach
                                    </select>
                                </div>
                                  <div class="col-md-6 form-group">
                                    <label for="exampleInputEmail1">ngày khởi hành</label>
                                    <input type="date" name="date_start" class="form-control" id="exampleInputEmail1" required="required">
                                </div>
                                <div class="col-md-6 form-group">
                                    <label for="exampleInputEmail1">ngày kết thúc</label>
                                    <input type="date" name="date_end" class="form-control" id="exampleInputEmail1" required="required">
                                </div>
                                <div class="col-md-12 form-group">
                                    <label for="exampleInputEmail1">Hình ảnh </label>
                                    <input type="file" name="product_image" class="form-control" id="exampleInputEmail1"> 
                                </div>
                                <div class="col-md-12">
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Mô tả </label>
                                    <textarea style="resize: none" rows="5" class="form-control" name="product_desc" id="text" placeholder="Mô tả sản phẩm"></textarea>
                                      <script src={{ URL::to('public/ckeditor/ckeditor.js') }}></script>
                                    <script >
                                    CKEDITOR.replace( 'text', { filebrowserBrowseUrl:'{{ route('ckfinder_browser') }}', } );
                                     </script>
                                    @include('ckfinder::setup')
                                </div>
                                 <div class="form-group">
                                    <label for="exampleInputPassword1">Nội dung </label>
                                    <textarea style="resize: none" rows="5" class="form-control" name="product_content" id="content" placeholder="Nội dung sản phẩm"></textarea>
                                      <script src={{ URL::to('public/ckeditor/ckeditor.js') }}></script>
                                    <script >
                                    CKEDITOR.replace( 'content', { filebrowserBrowseUrl:'{{ route('ckfinder_browser') }}', } );
                                     </script>
                                    @include('ckfinder::setup')
                                </div>
                            </div>  
                                <button type="submit" name="add_product" class="btn btn-info">Thêm sản phẩm</button>
                                </form>
                            </div>

                        </div>
                    </section>

            </div>
@endsection