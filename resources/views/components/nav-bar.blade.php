<div class="flex items-center">
    <nav class="font-sen text-gray-800 dark:text-white uppercase text-lg lg:flex items-center hidden">
        <a href="{{url("/")}}" class="py-2 px-6 flex">
            Home
        </a>
        @auth
        @if(auth()->user()->hasRole('admin'))
            <a href="{{url("/admin")}}" class="py-2 px-6 flex">
                DASHBOARD
            </a>
        @endif
    
        @if(auth()->user()->hasRole('user'))
            <a href="#" class="py-2 px-6 flex">
                PROFILE
            </a>
        @endif
    
        <a href="#" class="py-2 px-6 flex">
            <form method="post" action="{{url("/logout")}}"> 
                @csrf 
                <button type="submit" >LOUGOUT</button></form>
           
        </a>
    @else
        <a href="{{ url('/login') }}" class="py-2 px-6 flex">
            LOGIN
        </a>
        <a href="{{ url('/register') }}" class="py-2 px-6 flex">
            REGISTER
        </a>  
    @endauth
    
        <span id="cartbtn" class="w-8 h-8  cursor-pointer " ><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5} stroke="currentColor" className="w-10 h-10">
            <path strokeLinecap="round" strokeLinejoin="round" d="M2.25 3h1.386c.51 0 .955.343 1.087.835l.383 1.437M7.5 14.25a3 3 0 0 0-3 3h15.75m-12.75-3h11.218c1.121-2.3 2.1-4.684 2.924-7.138a60.114 60.114 0 0 0-16.536-1.84M7.5 14.25 5.106 5.272M6 20.25a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0Zm12.75 0a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0Z" />
          </svg></span>
       
          
    </nav>
    <button class="lg:hidden flex flex-col ml-4">
        <span class="w-6 h-1 bg-gray-800 dark:bg-white mb-1">
        </span>
        <span class="w-6 h-1 bg-gray-800 dark:bg-white mb-1">
        </span>
        <span class="w-6 h-1 bg-gray-800 dark:bg-white mb-1">
        </span>
    </button>
</div>