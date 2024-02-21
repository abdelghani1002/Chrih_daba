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
                    console.log(data);
                    showProduct(data.products, data.token);
                } else noResult();
            })
            .catch(error => {
                console.error('Fetch Error:', error);
            });
    }

    function noResult() {
        $("#place_result").html(`
        <div class="w-full flex justify-center " >
        <img src="https://cdn.dribbble.com/users/235730/screenshots/2936116/no-resultfound.jpg" alt="">
    </div>
        `)
    }

    function showProduct(products, token) {
        $("#place_result").html("")
        products.forEach(product => {
            var description = limitString(product.description, 80)
            $("#place_result").append(`
            <div class="bg-white m-2 rounded-lg overflow-hidden shadow-lg ring-4 ring-red-500 ring-opacity-40 max-w-sm ">
    <div class="relative w-full">
                <img class="w-full"  src="http://127.0.0.1:8000/storage/${product.image}" alt="Product Image">
                <div class="absolute top-0 right-0 bg-red-500 text-white px-2 py-1 m-2 rounded-md text-sm font-medium">SALE
                </div>
            </div>
            <div class="p-4">
                <h3 class="text-lg font-medium mb-2">${product.name}</h3>
                <p class="text-gray-600 text-sm mb-4">${description}</p>
                <span class="text-lg font-medium mb-2 bg-red-200 py-1 px-2 rounded-md ">${ product.category.name }</span>
                <div class="flex items-center mt-4 justify-between">
                    <span class="font-bold text-lg">$ ${  product.price }</span>
                    <a href="{{route("product.show", $product)}}" class="bg-red-100 px-2 py-1 rounded-sm " >show</a>
                    <form method="post" action="http://127.0.0.1:8000/product/addtocart">

                         <input name="product_id" value="${product.id}" type="hidden">
                         <input name="_token" value="${token}" type="hidden">
                        <button class="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded">
                            add to cart
                        </button>
                    </form>
                </div>
            </div>
        </div>

            `);
        });
    }

    function limitString(str, maxLength, suffix = '...') {
        if (str.length <= maxLength) {
            return str;
        }
        return str.substring(0, maxLength) + suffix;
    }

});
