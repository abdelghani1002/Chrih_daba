<?php

namespace App;

use App\Models\User;
use Illuminate\Database\Eloquent\Model;


class Order extends Model
{
    protected $fillable = [
        'status',
        'user_id'
    ];

    public function products()
    {
        return $this->belongsToMany(Product::class, "order_product");
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }


}
