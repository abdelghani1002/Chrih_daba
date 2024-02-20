<?php

namespace App\View\Components;

use App\Product;
use Illuminate\View\Component;

class Card extends Component
{

    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct( public Product $product)
    {
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|\Closure|string
     */
    public function render()
    {
        return view('components.card', ['product' => $this->product]);
    }
}
