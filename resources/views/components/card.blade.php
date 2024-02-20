<div class="bg-white m-2 rounded-lg overflow-hidden shadow-lg ring-4 ring-red-500 ring-opacity-40 max-w-sm w-3/4 md:w-1/4">
    <div class="relative w-full">
        <img class="w-full"  src="{{asset("storage/" . $product->image)}}" alt="Product Image">
        <div class="absolute top-0 right-0 bg-red-500 text-white px-2 py-1 m-2 rounded-md text-sm font-medium">SALE
        </div>
    </div>
    <div class="p-4">
        <h3 class="text-lg font-medium mb-2">{{ $product->name }}</h3>
        <p class="text-gray-600 text-sm mb-4">{{ $product->description }}</p>
        <span class="text-lg font-medium mb-2 bg-red-200 py-1 px-2 rounded-md ">{{ $product->category->name }}</span>
        <div class="flex items-center mt-4 justify-between">
            <span class="font-bold text-lg">${{ $product->price }}</span>

            <form method="post" action="{{ url('product/addtocart/' . $product->id) }}">
                @csrf
                <button class="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded">
                    add to cart
                </button>

            </form>


        </div>
    </div>
</div>
