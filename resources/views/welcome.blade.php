<x-app-layout title="CHRIH.DABA">
    <x-hero-section />
    <div class="my-2 lg:mx-24 mx-2">
        <x-search />
    </div>
    <div class="flex flex-wrap lg:mx-32 mx-8 lg:justify-start md:justify-center pb-10 pt-2 justify-center w-full">
        @foreach ($products as $product)
            <x-card :product="$product" />
        @endforeach
    </div>
</x-app-layout>
