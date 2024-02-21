<x-app-layout title="Login">
<div class="flex h-screen items-center justify-center">
    <div class="xl:w-1/2 -mt-24 rounded-2xl border border-blue-800 md:shadow-xl">
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
