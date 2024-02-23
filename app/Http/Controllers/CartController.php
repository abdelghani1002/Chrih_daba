<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;

class CartController extends Controller
{
    public function addProducttoCart(Request $request) {
        $user = Auth::user();
        $productId = $request->input('product_id');
        if (!$user->products->contains($productId)) {
            $user->products()->syncWithoutDetaching([$productId]);
            return Redirect::back()->with('success', "Product added to cart successfully");
        }
        return Redirect::back()->with('success', "Product already in the Cart!");

    }
    function removeFromCart(Request $request){
        $user = Auth::user();
        $productId = $request->input('product_id');
        $user->products()->detach([$productId]);
        return Redirect::back()->with('success', "product removed from cart successfully");
    }

}
