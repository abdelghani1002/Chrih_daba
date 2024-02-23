$(document).ready(function () {
    // alert
    setTimeout(() => {
        $("#alert_success").hide();
    }, 3000);

    var itsOpen = false;
    $("#cartbtn").click(function (e) {

        if (itsOpen) {
            var itsOpen = false;

            $("#cart").toggleClass("absolute").toggleClass("hidden");
        } else {
            itsOpen = true;
            $("#cart").toggleClass("hidden").toggleClass("absolute");
        }
    });

    document.getElementById('search_input').addEventListener('input', fetchData);
    document.getElementById('category').addEventListener('change', fetchData);

    function fetchData() {
        var search_string = document.getElementById('search_input').value;
        var category = document.getElementById('category').value;
        var token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

        var params = new URLSearchParams({
            search_string: search_string,
            category: category
        }).toString();
        searchLoading()
        fetch('/search?' + params, {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': token
                }
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                if (data.status) {
                    showProduct(data.products, data.token);
                } else noResult();
            })
            .catch(error => {
                console.error('Fetch Error:', error);
            });
    }

    function noResult() {
        $("#place_result").html(`
            <div class="w-full flex justify-center" >
                <img src="http://127.0.0.1:8000/storage/no-resultfound-removebg-preview.png" alt="">
            </div>
        `)
    }

    function showProduct(products, token) {
        $("#place_result").html("")
        products.forEach(product => {
            var description = limitString(product.description, 80)
            $("#place_result").append(`
             <a href="http://127.0.0.1:8000/product/${product.id}"
                class="hover:scale-[101%] bg-white dark:bg-slate-700 m-2 rounded-lg overflow-hidden shadow-lg ring-4 ring-red-500 ring-opacity-40 max-w-sm w-full md:w-[30%] flex flex-col justify-between">
                <div class="relative w-full  dark:text-gray-300">
                    <img class="w-full object-cover max-h-56" src="http://127.0.0.1:8000/storage/${product.image}" alt="Product Image">
                    <div class="p-2">
                        <div class="absolute top-0 right-0 bg-red-500 text-white px-2 py-1 m-2 rounded-md text-sm font-medium">SALE
                        </div>
                        <h3 class="text-lg dark:text-gray-200 font-medium mb-2">${product.name}</h3>
                        <p class="text-gray-600 text-sm mb-4 dark:text-gray-300">${description}</p>
                        <span class="font-medium mb-2 bg-gray-200 dark:bg-gray-600 p-1 rounded-md">${ product.category.name }</span>
                    </div>
                </div>
                <div class="p-4">
                    <div class="flex items-center mt-4 justify-between">
                        <span class="font-bold text-lg dark:text-gray-200">$ ${  product.price }</span>

                                <form method="post" action="http://127.0.0.1:8000/product/addtocart">

                                    <input name="product_id" value="${product.id}" type="hidden">
                                    <input name="_token" value="${token}" type="hidden">
                                    <button class="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded">
                                        add to cart
                                    </button>
                                </form>
                    </div>
                </div>
                </a>

            `);
        });
    }

    function limitString(str, maxLength, suffix = '...') {
        if (str.length <= maxLength) {
            return str;
        }
        return str.substring(0, maxLength) + suffix;
    }

    function searchLoading() {
        $("#place_result").html(`
            <div aria-label="Loading..." role="status" class="flex items-center space-x-2">
            <svg class="h-20 w-20 animate-spin stroke-gray-500" viewBox="0 0 256 256">
                <line x1="128" y1="32" x2="128" y2="64" stroke-linecap="round" stroke-linejoin="round" stroke-width="24"></line>
                <line x1="195.9" y1="60.1" x2="173.3" y2="82.7" stroke-linecap="round" stroke-linejoin="round"
                    stroke-width="24"></line>
                <line x1="224" y1="128" x2="192" y2="128" stroke-linecap="round" stroke-linejoin="round" stroke-width="24">
                </line>
                <line x1="195.9" y1="195.9" x2="173.3" y2="173.3" stroke-linecap="round" stroke-linejoin="round"
                    stroke-width="24"></line>
                <line x1="128" y1="224" x2="128" y2="192" stroke-linecap="round" stroke-linejoin="round" stroke-width="24">
                </line>
                <line x1="60.1" y1="195.9" x2="82.7" y2="173.3" stroke-linecap="round" stroke-linejoin="round"
                    stroke-width="24"></line>
                <line x1="32" y1="128" x2="64" y2="128" stroke-linecap="round" stroke-linejoin="round" stroke-width="24"></line>
                <line x1="60.1" y1="60.1" x2="82.7" y2="82.7" stroke-linecap="round" stroke-linejoin="round" stroke-width="24">
                </line>
            </svg>
            <span class="text-4xl font-medium text-gray-500">Loading...</span>
        </div>
            `)
    }
});
