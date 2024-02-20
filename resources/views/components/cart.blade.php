<div class="max-w-xl mx-auto ">
    <div class="bg-white shadow-lg rounded-lg overflow-hidden">
        <div class="flex items-center justify-between px-4 py-3 bg-gray-200">
            <h1 class="text-lg font-bold">Shopping Cart</h1>
            <span class="text-gray-600">({{ $cart->count() }})</span>
        </div>
        <div class="p-4">

            @foreach ($cart as $item)
                <div class="flex items-center mb-2">
                    <img class="h-16 w-16 object-contain rounded-lg mr-4" src="{{asset("storage/" . $item->image)}}" alt="Product">
                    <div class="flex-1 mr-3">
                        <h2 class="text-lg font-bold">{{ $item->name }}</h2>
                        <span class="text-gray-600 font-bold">{{ $item->price }} $</span>
                    </div>
                    <form  method="post" action="{{url("/removeFromCart")}}">
                        @csrf
                        @method("DELETE")
                    <input name="product_id" value="{{$item->id}}" type="hidden">
                    <button class="text-gray-600 hover:text-red-500 px-2">
                        <svg class="h-6 w-6 fill-current" viewBox="0 0 24 24">
                            <path d="M19 13H5v-2h14v2z" />
                        </svg>
                    </button>
                </form>
                </div>
            @endforeach
        </div>
        <div class="px-4 py-3 bg-gray-200">
            <div class="flex justify-between items-center">
                <span class="font-bold text-lg">Total:</span>
                <span class="font-bold text-lg">{{$amount}} $</span>
            </div>
            <button class="block w-full mt-4 bg-red-500 hover:bg-red-600 text-white font-bold py-2 px-4 rounded">
                Checkout
            </button>
        </div>
    </div>
</div>
