<form class="flex flex-col md:flex-row gap-3">
    <div class="flex w-full ">
        <input type="text" placeholder="Search for the tool you like"
			class="w-full   px-3 h-10 rounded-l border-2 border-red-500 focus:outline-none focus:border-red-500"
			>
        <button type="submit" class="bg-red-500 text-white rounded-r px-2 md:px-3 py-0 md:py-1">Search</button>
    </div>
    <select  id="pricingType" name="pricingType"
		class=" w-40 h-10 border-2 border-red-500 focus:outline-none focus:border-red-500 text-red-500 rounded px-2 md:px-3 py-0 md:py-1 tracking-wider">
		<option value="All" selected="">All</option>
		<option value="category">category</option>
		 
	</select>
</form>