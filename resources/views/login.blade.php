<x-app-layout title="Login">
<div class="flex h-screen items-center justify-center">
    <div class="xl:w-1/2 -mt-24 rounded-2xl border border-blue-800 md:shadow-xl">
        @if ($errors->any())

        <div id="alert-2" class="lg:m-10   flex items-center p-4 mb-4 text-red-800 rounded-lg bg-red-50 dark:bg-gray-800 dark:text-red-400" role="alert">
            <svg class="flex-shrink-0 w-4 h-4" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
              <path d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z"/>
            </svg>
            <span class="sr-only">Info</span>
            <div class="ms-3 text-sm font-medium">
             @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </div>
            <button type="button" class="ms-auto -mx-1.5 -my-1.5 bg-red-50 text-red-500 rounded-lg focus:ring-2 focus:ring-red-400 p-1.5 hover:bg-red-200 inline-flex items-center justify-center h-8 w-8 dark:bg-gray-800 dark:text-red-400 dark:hover:bg-gray-700" data-dismiss-target="#alert-2" aria-label="Close">
              <span class="sr-only">Close</span>
              <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>
              </svg>
            </button>
          </div>
        @endif   
      <div class="grid md:grid-cols-2 p-5">
        <div class="">
          <img src="https://cdni.iconscout.com/illustration/premium/thumb/login-10299071-8333958.png?f=webp" alt="" />
        </div>
        <div class="flex items-center justify-center">
          <form method="POST" action="{{ url('/admin/login') }}">
            @csrf
            <h1 class="text-center font-extrabold uppercase text-rose-500">User login</h1>
            <br />
            <input name="email" type="email" class="mb-3 w-full rounded-2xl bg-zinc-100 outline-rose-400 px-5 py-3" placeholder="email" />
             <input  name="password" type="password" class="mb-3 w-full rounded-2xl bg-zinc-100 outline-rose-400 px-5 py-3" placeholder="password" />

             <button type="submit" class="mb-3 w-full rounded-2xl bg-rose-500 px-5 py-3 font-semibold text-white">Login</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</x-app-layout>
