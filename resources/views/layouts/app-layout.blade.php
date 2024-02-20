<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{ $title }}</title>
    <script src="https://cdn.tailwindcss.com"></script>

    <script src="https://code.jquery.com/jquery-3.7.1.slim.min.js"
        integrity="sha256-kmHvs0B+OpCW5GVHUNjv9rOmY0IvSIRcf7zGUDTDQM8=" crossorigin="anonymous"></script>
</head>

<body>
    <main class="dark:bg-gray-800 bg-white relative  h-screen">
        <x-header-user-pages />


        @auth
            <div id="cart" class="hidden z-50 top-24 right-0 lg:pr-24 pr-2 ">
                <x-cart :cart="$cart" />
            </div>
        @endauth

        <div>
            {{ $slot }}
        </div>
        <x-footer />
    </main>
    <script>
        $(document).ready(function() {
            var itsOpen = false;
            $("#cartbtn").click(function(e) {

                if (itsOpen) {
                    var itsOpen = false;

                    $("#cart").toggleClass("absolute").toggleClass("hidden");
                } else {
                    itsOpen = true;
                    $("#cart").toggleClass("hidden").toggleClass("absolute");
                }
            });
        });
    </script>

</body>

</html>
