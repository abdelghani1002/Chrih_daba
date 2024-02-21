<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use App\Product;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;

class SiteController extends Controller
{
    function index()
    {
        if (Auth::check()) {
            $id = auth()->id();
            $res = DB::select("SELECT categories.id as id, COUNT(products.id) as count_products
                            FROM users
                            INNER JOIN orders ON users.id = orders.user_id
                            INNER JOIN order_product ON orders.id = order_product.order_id
                            INNER JOIN products ON order_product.product_id = products.id
                            INNER JOIN categories ON products.category_id = categories.id
                            WHERE users.id = $id
                            GROUP BY categories.id
                            ORDER BY count_products DESC");
            $Favorites_Categories_Ids_from_orders = array_column($res, 'id');
            $res = DB::select("
                    SELECT products.category_id as id , COUNT(products.id) as count_products FROM
                    users INNER JOIN favorites INNER JOIN products ON
                    users.id = favorites.user_id and favorites.product_id = products.id
                    WHERE users.id = $id
                    GROUP BY products.category_id
                    ORDER BY count_products DESC
            ");
            $Favorites_Categories_Ids_from_favorites = array_column($res, 'id');
            $fin_res = array_unique(array_merge($Favorites_Categories_Ids_from_orders, $Favorites_Categories_Ids_from_favorites));
            if (count($fin_res) == 0)
                $products = Product::paginate(5);
            else
                $products = Product::whereIn("category_id", $fin_res)->paginate(5);
        } else {
            $products = Product::paginate(5);
        }
        // dd($products);
        return view("welcome", compact('products'));
    }

    function singlePage(Product $product)
    {
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
        $user = auth()->user();
        $favProduct = $user->favouriteProducts;
        return view("profile", compact("favProduct", "user"));
    }

    function addProducttoCart(Request $request)
    {
        $user = Auth::user();
        $productId = $request->input('product_id');
        if (!$user->favouriteProducts->contains($productId)) {
            $user->favouriteProducts()->syncWithoutDetaching([$productId]);
        }
        return Redirect::back();
    }

    function removeFromCart(Request $request)
    {
        $user = Auth::user();
        $productId = $request->input('product_id');
        $user->favouriteProducts()->detach([$productId]);
        return Redirect::back();
    }
}
