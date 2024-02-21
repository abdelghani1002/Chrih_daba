<a href="{{ route('product.show', $product) }}"
    class="hover:scale-[101%] bg-white dark:bg-slate-700 m-2 rounded-lg overflow-hidden shadow-lg ring-4 ring-red-500 ring-opacity-40 max-w-sm w-full md:w-[30%] flex flex-col justify-between">
    <div class="relative w-full  dark:text-gray-300">
        <img class="w-full object-cover max-h-56" src="{{ asset('storage/' . $product->image) }}" alt="Product Image">
        <div class="p-2">
            <div class="absolute top-0 right-0 bg-red-500 text-white px-2 py-1 m-2 rounded-md text-sm font-medium">SALE
            </div>
            <h3 class="text-lg dark:text-gray-200 font-medium mb-2">{{ $product->name }}</h3>
            <p class="text-gray-600 text-sm mb-4 dark:text-gray-300">{{ Str::limit($product->description, 80, '...') }}</p>
            <span class="font-medium mb-2 bg-gray-200 dark:bg-gray-600 p-1 rounded-md">{{ $product->category->name }}</span>
        </div>
    </div>
    <div class="p-4">
        <div class="flex items-center mt-4 justify-between">
            <span class="font-bold text-lg dark:text-gray-200">${{ $product->price }}</span>

            <form method="post" action=" {{ url('product/addtocart') }}">
                @csrf
                <input name="product_id" value="{{ $product->id }}" type="hidden">
                <button class="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded">
                    add to cart
                </button>
            </form>


        </div>
    </div>
    @if (!request()->routeIs('home'))
        <form method="post" action=" {{ url('product/removeFromCart') }}">
            @csrf
            <input name="product_id" value="{{ $product->id }}" type="hidden">
            <button class="bg-red-400 hover:bg-red-600 text-white font-bold py-2 px-4 rounded w-full">
                remove from favourites
            </button>
        </form>
    @endif
</a>
