<?php

namespace Database\Factories;

use App\Category;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Product>
 */
class ProductFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        // $min = Category::min("id");
        // $max = Category::max("id");
        return [
            'name' => fake()->name(),
            'description' => fake()->paragraph(5),
            'image' => "product_default.jpg",
            'price' => number_format(fake()->numberBetween(20, 1000), 2),
            'category_id' => fake()->numberBetween(1, 2)
        ];
    }
}
