<form class="flex flex-col md:flex-row gap-3 dark:bg-slate-800">
    <div class="flex w-full dark:bg-slate-800">
        <input id="search_input" type="text" placeholder="Search for the product you like"
            class="w-full dark:text-gray-300 dark:bg-slate-800 px-3 h-10 rounded-l border-2 border-red-500 focus:outline-none focus:border-red-500">
        <button type="submit" class="bg-red-500 text-white rounded-r px-2 md:px-3 py-0 md:py-1">Search</button>
    </div>
    <select id="category" name="pricingType"
        class=" dark:bg-slate-800 w-40 h-10 border-2 border-red-500 focus:outline-none focus:border-red-500 text-red-500 rounded px-2 md:px-3 py-0 md:py-1 tracking-wider">
        <option value="0" selected="">All</option>
        @foreach ($categories as $category)
            <option value="{{ $category->id }}">{{ $category->name }}</option>
        @endforeach
    </select>
</form>
