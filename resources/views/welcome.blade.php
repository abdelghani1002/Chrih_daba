<x-app-layout  title="CHRIH.DABA">

    <div id="place_result" class="flex flex-wrap lg:px-32 px-8 gap-2 lg:justify-start md:justify-center pb-10 pt-2 justify-center w-full">
        @foreach ($products as $product)
            <x-card :product="$product" />
        @endforeach
    </div>
</x-app-layout>
