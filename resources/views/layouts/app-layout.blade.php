<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>{{ $title }}</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <script src="https://code.jquery.com/jquery-3.7.1.slim.min.js"
        integrity="sha256-kmHvs0B+OpCW5GVHUNjv9rOmY0IvSIRcf7zGUDTDQM8=" crossorigin="anonymous"></script>

</head>

<body>
    @if (session('success'))
        <div id="alert_success" class="w-full p-2 text-center bg-green-200 text-green-700">{{ session('success') }}</div>
    @endif
    <main class="dark:bg-gray-800 bg-white relative  h-screen">
        <x-header-user-pages />


        @auth
            <div id="cart" class="hidden z-50 top-24 right-0 lg:pr-24 pr-2 ">
                <x-cart />
            </div>
        @endauth

        <div>
            <x-hero-section />
            <div class="my-2 lg:mx-24 mx-2">
                <x-search :categories="$categories" />
            </div>
            {{ $slot }}
        </div>
        <x-footer />
    </main>

    <script src="{{ asset('assets/js/app.js') }}"></script>

</body>

</html>
