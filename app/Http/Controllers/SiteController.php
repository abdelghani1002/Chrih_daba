<?php

namespace App\Http\Controllers;


use App\Order;
use Illuminate\Http\Request;
use App\Product;
use App\Models\User;

class SiteController extends Controller
{
    function index()
    {
        $products = Product::all();
        if (auth()->check()) {
            $user = User::find(auth()->user()->id);
            //    dd($user->orders[0]->products);
            $cart = $user->orders[0]->products;
            return view("welcome", compact('products', 'cart'));
        }

        return view("welcome", compact('products'));
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
    function addtocart()
    {

    }
}
