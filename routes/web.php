<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\SiteController;
use TCG\Voyager\Facades\Voyager;
use App\Http\Controllers\Auth\RegisteredUserController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\SearchController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', [SiteController::class,"index"] );
Route::get('/login', [SiteController::class,"login"] )->name("login");
Route::get('/register', [SiteController::class,"register"] );
Route::get('/product/{product}', [SiteController::class,"singlePage"] )->name('product.show');

Route::post('/register', [RegisteredUserController::class,"store"] );

Route::get('/search', [SearchController::class,"search"] );


Route::middleware("auth")->group(function(){
    Route::post('/logout', [RegisteredUserController::class,"logOut"] );
    Route::post("product/addtocart",[CartController::class,"addProducttoCart"]);
    Route::delete("/removeFromCart",[CartController::class,"removeFromCart"]);

});








Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
