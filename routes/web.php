<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\SiteController;
use TCG\Voyager\Facades\Voyager;
use App\Http\Controllers\Auth\RegisteredUserController;
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
Route::get('/login', [SiteController::class,"login"] );
Route::get('/register', [SiteController::class,"register"] );

Route::post('/register', [RegisteredUserController::class,"store"] );


Route::middleware("auth")->group(function(){
    Route::post('/logout', [RegisteredUserController::class,"logOut"] );
    Route::post("product/addtocart/{id}",[SiteController::class,"addtocart"]);
});


 




Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
