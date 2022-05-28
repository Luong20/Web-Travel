<?php


namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Session;
use Cart;
use Carbon\Carbon;
use App\Http\Requests;
use Illuminate\Support\Facades\Redirect;
session_start();

class CheckoutController extends Controller
{
     public function AuthLogin(){
        $admin_id = Session::get('admin_id');
        if($admin_id){
            return Redirect::to('dashboard');
        }else{
            return Redirect::to('admin')->send();
        }
    }
    public function view_order($orderId){
        $this->AuthLogin();
        $order_by_id = DB::table('tbl_order')
        ->join('tbl_customers','tbl_order.customer_id','=','tbl_customers.customer_id')
        ->join('tbl_shipping','tbl_order.shipping_id','=','tbl_shipping.shipping_id')
        ->join('tbl_order_details','tbl_order.order_id','=','tbl_order_details.order_id')
        ->select('tbl_order.*','tbl_customers.*','tbl_shipping.*','tbl_order_details.*')->first();

        $manager_order_by_id  = view('admin.view_order')->with('order_by_id',$order_by_id);
        return view('admin_layout')->with('admin.view_order', $manager_order_by_id);
        
    }
    public function login_checkout(){

    	$cate_product = DB::table('tbl_category_product')->where('category_status','0')->orderby('category_id','desc')->get();
    	return view('pages.checkout.login_checkout')->with('category',$cate_product);
    }
      public function registration(){

        $cate_product = DB::table('tbl_category_product')->where('category_status','0')->orderby('category_id','desc')->get();
        return view('pages.checkout.registration')->with('category',$cate_product);
    }
        public function login_customer(Request $request){
        $email = $request->customer_email;
        $password = md5($request->customer_pass);
        $result = DB::table('tbl_customers')->where('customer_email',$email)->where('customer_password',$password)->first();

        if($result){
            Session::put('customer_id',$result->customer_id);
            $cart=Cart::content();
        if ($cart) {
                return Redirect::to('/show-cart');
            }
        else{
            return Redirect::to('/');
        }
        }
        else{
            return Redirect::to('/login-checkout');
        }

    }
    public function add_customer(Request $request){

    	$data = array();
    	$data['customer_name'] = $request->customer_name;
    	$data['customer_phone'] = $request->customer_phone;
    	$data['customer_email'] = $request->customer_email;
        $data['customer_birthday']=$request->customer_birthday;
    	$data['customer_password'] = md5($request->customer_password);

    	$customer_id = DB::table('tbl_customers')->insertGetId($data);

    	Session::put('customer_id',$customer_id);
    	Session::put('customer_name',$request->customer_name);
    	return Redirect::to('/login-checkout');

    }
       public function logout_checkout(){
        Session::flush();
        return Redirect::to('/login-checkout');
    }
    public function order_place(Request $request){
        //insert shipping
        $customer=Session::get('customer_id');
        if($customer!=NULL){

        $data = array();
        $data['shipping_name'] = $request->name;
        $data['shipping_phone'] = $request->phone;
        $data['shipping_email'] = $request->email;
        $data['shipping_address'] = $request->address;
        $shipping_id = DB::table('tbl_shipping')->insertGetId($data);
        Session::put('shipping_id',$shipping_id);
        
        $dt = Carbon::now('Asia/Ho_Chi_Minh');
        
        $order_data = array();
        $order_data['customer_id'] = Session::get('customer_id');
        $order_data['shipping_id'] = Session::get('shipping_id');
        $order_data['payment_id'] = $request->payment;
        $order_data['order_total'] = Session::get('total');
        $order_data['order_status'] = '0';
        $order_data['order_date']=$dt;
        $order_id = DB::table('tbl_order')->insertGetId($order_data);
        
        $content = Cart::content();
        foreach($content as $v_content){
        //insert order_details
            $order_d_data['order_id'] = $order_id;
            $order_d_data['product_id'] = $v_content->id;
            $order_d_data['product_name'] = $v_content->name;
            $order_d_data['product_price'] = $v_content->price;
            $order_d_data['product_sales_quantity'] = Session::get('adult')+Session::get('child');
            DB::table('tbl_order_details')->insert($order_d_data);
        }
        Cart::destroy();
        return Redirect::to('/handcash/'.$order_id);
    }
    else{
       return  Redirect::to('/login-checkout');
    }
}
    public function handcash( $order_id ){
        $cate_product = DB::table('tbl_category_product')->where('category_status','1')->orderby('category_id','desc')->get();
        $order_customer= DB::table('tbl_order')
        ->join('tbl_order_details','tbl_order_details.order_id','=','tbl_order.order_id')
        ->join('tbl_shipping','tbl_shipping.shipping_id','=','tbl_order.shipping_id')
        ->where('tbl_order.order_id',$order_id)->get();
    return view('pages.checkout.handcash')->with('order',$order_customer)->with('category',$cate_product);
}
  public function manage_order(){
        
        $this->AuthLogin();
        $all_order = DB::table('tbl_order')
        ->join('tbl_customers','tbl_order.customer_id','=','tbl_customers.customer_id')
        ->select('tbl_order.*','tbl_customers.customer_name')
        ->orderby('tbl_order.order_id','desc')->get();
        $total=0;
        foreach ($all_order as $key => $value) {
            $tong=$value->order_total;
            $total += $tong;
        }
        return view('admin.manage_order')->with('all_order',$all_order)->with('tong',$total);
    }
        public function delete_order($order){
        $this->AuthLogin();
        DB::table('tbl_order')->where('order_id',$order)->delete();
        DB::table('tbl_order_details')->where('order_id',$order)->delete();
        Session::put('message','Đã xóa hóa đơn');
        return Redirect::to('/manage-order');
    }

    public function unactive_order($order_id){
           $this->AuthLogin();
        $all_order = DB::table('tbl_order')
        ->join('tbl_customers','tbl_order.customer_id','=','tbl_customers.customer_id')
        ->select('tbl_order.*','tbl_customers.customer_name')
        ->orderby('tbl_order.order_id','desc')->get();
        $total=0;
        foreach ($all_order as $key => $value) {
            $tong=$value->order_total;
            $total += $tong;
        }
        return view('admin.manage_order')->with('all_order',$all_order)->with('tong',$total);
    }
      public function search_date(Request $rq){
        $date_start=$rq->date_start;
        $date_end=$rq->date_end;
        $this->AuthLogin();
        $all_order = DB::table('tbl_order')->whereBetween('order_date',[$date_start,$date_end])
        ->join('tbl_customers','tbl_order.customer_id','=','tbl_customers.customer_id')
        ->select('tbl_order.*','tbl_customers.customer_name')
        ->orderby('tbl_order.order_id','desc')->get();
        $total=0;
        foreach ($all_order as $key => $value) {
            $tong=$value->order_total;
            $total += $tong;
        }
        return view('admin.search_date')->with('all_order',$all_order)->with('tong',$total);
    }

}
