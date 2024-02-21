<?php

namespace App;

use App\Models\User;
use Illuminate\Database\Eloquent\Model;


class Product extends Model
{
    protected $table = "products";

    public function category()
    {
        return $this->belongsTo(Category::class,"category_id");
    }

    public function orders()
    {
        return $this->belongsToMany(Order::class, "order_product");
    }
    public function users()
    {
        return $this->belongsToMany(User::class,"carts");
    }
     
}
