<?php

namespace App\Http\Controllers;
use App\Models\orders;
use App\Models\products;
use App\Models\category;
use App\Models\neworder;
use App\Models\recentorders;
use App\Models\notification;
use App\Models\User;
use App\Models\customers;


use Illuminate\Http\Request;

class productcontroller extends Controller
{
    public function showproduct(){
        $product = products::all();
        // echo"<pre>";
        // print_r($product);
        // echo"</pre>"
        // return view('product');
        return view('product',["productes"=>$product]);//1st-blade file name 2.variable3.this page variable
    }

    public function categoryfetch(){
        $categories= category::all();

        return view("add",["category"=>$categories]);
    }
    public function insert(Request $req){
        $product= new products();
        $product->product_name=$req->input('productName');
        $product->product_status=$req->input('productStatus');
        $product->product_price=$req->input('productPrice');
        $product->Description=$req->input('productDescription');
        $product->category_id =$req->input('categoryName');
        $product->Images="img/cheesecake.jpg";
        $product->customized_cake=$req->input('Customizedcake');
        $product->save();
        $pd = products::all();
        return view('product',["productes"=>$pd]);
    }

    public function rorder()
    {
    
       $recent=recentorders::all();
       return view('index',["recents"=>$recent]);


    }


    

    
    // public function submit(){
    //     $submits = submit::all();
    //     return view("submit",["sub"=>$submits]);
    // }

    //for Index page
    public function norder(){
        $orders= orders::all();
        $totalorders=0;
        foreach ($orders as $o){
            $totalorders++;
        }
        $pd = products::all();
        $recent=recentorders::all();
        return view("index",["recents"=>$recent,"order"=>$orders,"totalorders"=>$totalorders,"product" => $pd]);
    }
    
    public function noti()
    {
        $notifications=notification::all();
        // print_r($notifications);
       return view('notification',["notifications"=>$notifications]); 
    }
   
    public function torder(){
        $orders= orders::all();
        $totalorders=0;
        foreach ($orders as $o){
            $totalorders++;
        }
        return view("analytics",["order"=>$orders,"totalorders"=>$totalorders]);
    }

    public function ncus(){
        $newsuctomer=customers::all();
        $totalcus=0;
        foreach ($newsuctomer as $o){
            $totalcus++;
        }
        return view("analytics",["totalcustomers"=>$newsuctomer,"totalcustomer"=>$totalcus]);

    }
    
}
