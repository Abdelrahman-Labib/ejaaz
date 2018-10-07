<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use PayPal\Api\Amount;
use PayPal\Api\Details;
use PayPal\Api\Item;

/** All Paypal Details class **/
use PayPal\Api\ItemList;
use PayPal\Api\Payer;
use PayPal\Api\Payment;
use PayPal\Api\PaymentExecution;
use PayPal\Api\RedirectUrls;
use PayPal\Api\Transaction;
use PayPal\Auth\OAuthTokenCredential;
use PayPal\Rest\ApiContext;
use Redirect;
use Session;
use URL;
use App\User;
use App\PaypalCode;
class PaymentController extends Controller
{
    private $_api_context;
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        /** PayPal api context **/
        $paypal_code= PaypalCode::findOrFail(1);
        $paypal_conf = \Config::get('paypal');
        $this->_api_context = new ApiContext(new OAuthTokenCredential(
                $paypal_code->PAYPAL_CLIENT_ID,
                $paypal_code->PAYPAL_SECRET
            )
        );
        $this->_api_context->setConfig($paypal_conf['settings']);
    }

    public function index(Request $req)
    {
        // return view('paywithpaypal');
        // return auth()->user()->cart;
        $products= auth()->user()->cart;
        $payer = new Payer();
        $payer->setPaymentMethod('paypal');
        $items= [];
        $i= 0;
        $total= 0;
        foreach($products as $product){
        $items[$i] = new Item();
        $items[$i]->setName($product->title) /** item name **/
            ->setCurrency('USD')
            ->setQuantity(1)
            ->setPrice($product->price); /** unit price **/
        $i++;
        $total+= $product->price;
        }

        $item_list = new ItemList();
        $item_list->setItems($items);
        $amount = new Amount();
        $amount->setCurrency('USD')
            ->setTotal($total);
        $transaction = new Transaction();
        $transaction->setAmount($amount)
            ->setItemList($item_list)
            ->setDescription('Your transaction description');
        $redirect_urls = new RedirectUrls();
        $redirect_urls->setReturnUrl(URL::to('api/status?user_id='.auth()->user()->id)) /** Specify return URL **/
            ->setCancelUrl(URL::to('api/cancel?user_id='.auth()->user()->id));
        $payment = new Payment();
        $payment->setIntent('Sale')
            ->setPayer($payer)
            ->setRedirectUrls($redirect_urls)
            ->setTransactions(array($transaction));
        /** dd($payment->create($this->_api_context));exit; **/
        try {
            $payment->create($this->_api_context);
        } catch (\PayPal\Exception\PPConnectionException $ex) {
            if (\Config::get('app.debug')) {
                \Session::put('error', 'Connection timeout');
                return Redirect::to('/');
            } else {
                \Session::put('error', 'Some error occur, sorry for inconvenient');
                return Redirect::to('/');
            }
        }
        foreach ($payment->getLinks() as $link) {
            if ($link->getRel() == 'approval_url') {
                $redirect_url = $link->getHref();
                break;
            }
        }
        /** add payment ID to session **/
        Session::put('paypal_payment_id', $payment->getId());
        if (isset($redirect_url)) {
            /** redirect to paypal **/
            return Redirect::away($redirect_url);
        }
        \Session::put('error', 'Unknown error occurred');
        return Redirect::to('/');
        }
    
    public function payWithPaypal(Request $request){

    }

    public function getPaymentStatus(Request $req){
        $id= $req->query('user_id');
        $payment_id= $req->query('paymentId');
        $token= $req->query('token');
        $buyer_id= $req->query('PayerID');

        if (empty($buyer_id) || empty($token)) {
            return "failed";
        }
        $payment = Payment::get($payment_id, $this->_api_context);
        $execution = new PaymentExecution();
        $execution->setPayerId($buyer_id);
        /**Execute the payment **/
        $result = $payment->execute($execution, $this->_api_context);
        if ($result->getState() == 'approved') {
            $user= User::findOrFail($id);
            $courses= $user->cart;
        foreach ($courses as $course){
            $user->jointcourses()->attach($course);
            $user->cart()->detach($course);
        }
            return "done";
        }
    }
    public function cancel(Request $req){
        return "cancelled";
    }
    
    public function paymentIos(Request $req){
    return auth()->user()->cart;
        
    }
}
