<?php

namespace App\View\Components;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\View\Component;

class Cart extends Component
{

    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct( public Collection $cart)
    {
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|\Closure|string
     */
    public function render()
    {
        $amount = 0;
        foreach ($this->cart as $pro) {
            $amount += $pro->price;
        }
        return view('components.cart', ['cart' => $this->cart, "amount" => $amount]);
    }
}
