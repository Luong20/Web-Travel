<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Session;
use App\Http\Requests;
use Illuminate\Support\Facades\Redirect;
session_start();
class BrandProduct extends Controller
{
    public function AuthLogin(){
        $admin_id = Session::get('admin_id');
        if($admin_id){
            return Redirect::to('dashboard');
        }else{
            return Redirect::to('admin')->send();
        }
    }
    public function add_brand_product(){
        $this->AuthLogin();
        $category= DB::table('tbl_category_product')->get();
    	return view('admin.add_brand_product')->with('category',$category);
    }
    public function all_brand_product(){
        $this->AuthLogin(); 
    	$all_brand_product = DB::table('tbl_brand')
        ->join('tbl_category_product','tbl_category_product.category_id','=','tbl_brand.category_id')
        ->get();
    	return view('admin.all_brand_product')->with('all_brand_product',$all_brand_product);
    }
    public function save_brand_product(Request $request){
        $this->AuthLogin();
    	$data = array();
    	$data['brand_name'] = $request->brand_product_name;
    	$data['brand_status'] = $request->brand_product_status;
        $data['category_id']=$request->category_id;
    	DB::table('tbl_brand')->insert($data);
    	Session::put('message','Thêm thành công');
    	return Redirect::to('add-brand-product');
    }
    public function unactive_brand_product($brand_product_id){
        $this->AuthLogin();
        DB::table('tbl_brand')->where('brand_id',$brand_product_id)->update(['brand_status'=>1]);
        Session::put('message','hiển thị');
        return Redirect::to('all-brand-product');

    }
    public function active_brand_product($brand_product_id){
        $this->AuthLogin();
        DB::table('tbl_brand')->where('brand_id',$brand_product_id)->update(['brand_status'=>0]);
        Session::put('message','không hiển thị');
        return Redirect::to('all-brand-product');

    }
    public function edit_brand_product($brand_product_id){
        $this->AuthLogin();
        $category=DB::table('tbl_category_product')->get();
        $edit_brand_product = DB::table('tbl_brand')->where('brand_id',$brand_product_id)->get();
        return view('admin.edit_brand_product')->with('edit_brand_product',$edit_brand_product)->with('category',$category);
;
    }
    public function update_brand_product(Request $request,$brand_product_id){
        $this->AuthLogin();
        $data = array();
        $data['brand_name'] = $request->brand_product_name;

        $data['category_id'] = $request->category_id;
        DB::table('tbl_brand')->where('brand_id',$brand_product_id)->update($data);
        Session::put('message','Cập nhật thành công');
        return Redirect::to('all-brand-product');
    }
    public function delete_brand_product($brand_product_id){
        $this->AuthLogin();
        DB::table('tbl_brand')->where('brand_id',$brand_product_id)->delete();
        Session::put('message','Xóa thành công');
        return Redirect::to('all-brand-product');
    }

    //End Function Admin Page
     
}
