<?php

namespace App\Http\Controllers;

use App\Models\Payment;
use App\Order;
use Illuminate\Http\Client\Request as ClientRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use Mollie\Laravel\Facades\Mollie;

class OrderController extends Controller
{
    function checkout(Request $request)
    {
        $back_url = $request->header('referer');
        $user = auth()->user();
        $products_ids = json_decode($request->products_ids[0]);
        if($request->has("order_id")){
            $order = Order::find($request->order_id);
        }else{
            $order = Order::create([
                'status' => "unpaid",
                'user_id' => auth()->id()
            ]);
            $order->products()->attach($products_ids);
        }
        $total = $order->products->sum('price');
        $payment = Mollie::api()->payments->create([
            "amount" => [
                "currency" => "USD",
                "value" => number_format($total, 2, '.', '')
            ],
            "description" => "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Atque quae autem quis quidem odit\n provident nesciunt eum, fuga iste, rem itaque ad deleniti\n quam ratione quisquam tempore non totam qui. Aspernatur\n praesentium labore modi distinctio recusandae cumque \naccusamus ducim\nus eos excepturi, tempore, provident dolores? \nTenetur illo atque quo unde quibusdam!",
            "redirectUrl" => route('success'),
        ]);
        session()->put('paymentId', $payment->id);
        session()->put('orderId', $order->id);
        session()->put('back_url', $back_url);
        $user->products()->detach($products_ids);
        // redirect customer to Mollie checkout page
        return redirect($payment->getCheckoutUrl(), 303);
    }

    public function success(Request $request)
    {
        $paymentId = session()->get('paymentId');
        $back_url = session()->get('back_url');
        $payment = Mollie::api()->payments->get($paymentId);
        if($payment->isPaid())
        {
            $orderId = session()->get('orderId');
            $order = Order::find($orderId);

            $obj = new Payment();
            $obj->payment_id = $paymentId;
            $obj->description = $payment->description;
            $obj->amount = $payment->amount->value;
            $obj->currency = $payment->amount->currency;
            $obj->payment_status = "Completed";
            $obj->payment_method = "Mollie";
            $obj->order_id = $orderId;

            $obj->save();
            $order->update(["status" => "paid"]);
            session()->forget('paymentId');
            session()->forget('orderId');
            return redirect($back_url)->with("success", "Your payment is done with success");
        } else {
            return redirect()->route('cancel');
        }
    }

    public function cancel()
    {
        echo "Payment is cancelled. !!!!!";
    }
}
