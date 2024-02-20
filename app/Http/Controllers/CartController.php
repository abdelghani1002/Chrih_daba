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
        }

        return Redirect::back();
    }
    function removeFromCart(Request $request){
        $user = Auth::user();
        $productId = $request->input('product_id');
        $user->products()->detach([$productId]);
        return Redirect::back();

    }

}
