<?php

namespace App\Http\Controllers;


use App\Order;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;
use App\Product;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;

class SiteController extends Controller
{
    function index()
    {
        $products = Product::all();
        // $cart = new Collection;
        // if (auth()->check()) {
        //     $user = User::find(auth()->user()->id);
        //     if ($user->products) {
        //         $cart = $user->products;
        //     }
        // }

        return view("welcome", compact('products'));
    }
    function singlePage(Product $product){
            return view("single-page-product", compact('product'));
    }
    function productSinglePage(int $id)
    {

        return view("single-page-product");

    }
    function login()
    {
        return view("login");
    }
    function register()
    {
        return view("register");
    }

    function myProfil()
    {
        return view("profile");
    }

    function addProducttoCart(Request $request){
        $user = Auth::user();
        $productId = $request->input('product_id');


        if (!$user->products->contains($productId)) {
            $user->favouriteProducts()->syncWithoutDetaching([$productId]);
        }

        return Redirect::back();
    }

}
