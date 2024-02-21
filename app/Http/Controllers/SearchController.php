<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Product;
use Illuminate\Http\Request;

class SearchController extends Controller
{
    //
    function search(Request $request){
        if ($request->category) {
            $products = Product::with("category")->where("name", "like", "%".$request->search_string."%")
            ->where("category_id", $request->category)
            ->get();
        } else {
            $products = Product::with("category")->where("name", "like", "%".$request->search_string."%")->get();
        }

        if($products->count()){
            return response()->json([
                "status" => true
                ,
                "products" => $products
                ,
                "token"  => $request->header("X-CSRF-TOKEN")
            ]);
        } else  return response()->json([
            "status" => false

        ]);
    }
}
