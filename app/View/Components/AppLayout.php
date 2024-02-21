<?php

namespace App\View\Components;

use App\Category;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\View\Component;

class AppLayout extends Component
{
    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct( public string $title , public Collection $categories)
    {
        //

    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|\Closure|string
     */
    public function render()
    {
         $this->categories = Category::all();
        return view('layouts.app-layout',["categories"=>$this->categories]);
    }
}
