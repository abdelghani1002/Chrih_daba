<div class="bg-white m-2 rounded-lg overflow-hidden shadow-lg ring-4 ring-red-500 ring-opacity-40 max-w-sm ">
    <div class="relative w-full">
        <img class="w-full"  src="{{asset("storage/" . $product->image)}}" alt="Product Image">
        <div class="absolute top-0 right-0 bg-red-500 text-white px-2 py-1 m-2 rounded-md text-sm font-medium">SALE
        </div>
    </div>
    <div class="p-4">
        <h3 class="text-lg font-medium mb-2">{{ $product->name }}</h3>
        <p class="text-gray-600 text-sm mb-4">{{ Str::limit($product->description, 80, '...')  }}</p>
        <span class="text-lg font-medium mb-2 bg-red-200 py-1 px-2 rounded-md ">{{ $product->category->name }}</span>
        <div class="flex items-center mt-4 justify-between">
            <span class="font-bold text-lg">${{  $product->price }}</span>
            <a href="{{ route("product.show", $product) }}" class="bg-red-100 px-2 py-1 rounded-sm " >show</a>
            @if (request()->routeIs("home"))
                 <form method="post" action=" {{ url('product/addtocart') }}">
                    @csrf
                    <input name="product_id" value="{{$product->id}}" type="hidden">
                    <button class="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded">
                        add to cart
                    </button>
                </form>
            @else
                    <form method="post" action=" {{ url('product/removeFromCart') }}">
                        @csrf
                        <input name="product_id" value="{{$product->id}}" type="hidden">
                        <button class="bg-red-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded">
                             remove from favourite
                        </button>
                    </form>
            @endif


        </div>
    </div>
</div>
