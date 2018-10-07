<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Course;
use App\User;
use Illuminate\Support\Facades\Input;

class SearchController extends Controller
{
    public function search(Request $request)
    {
        $search = $request->input('search');
        if (empty($search))
            return response()->json(['success' => false, 'error' => 'Enter somtheing to search'], 401);;

        $courses = Course::where('title', 'like', '%'.$search.'%')->orderBy('id', 'DESC')->get();

        $users = User::where('name', 'like', '%'.$search.'%')->orderBy('name', 'ASC')->get();
        
        // $courses = Course::where(function($query){
        //     $min_price = Input::has('min_price') ?  Input::get('min_price') : null;
        //     $max_price = Input::has('max_price') ? Input::get('max_price') : $max_price = null;
        //     if(isset($min_price) && isset($max_price)){
        //         $query-> where('price','>=',$min_price);
        //         $query-> where('price','<=',$max_price);
        //     }
        // })->get();

        $result = ["courses" => $courses , "users" => $users];

        return $result;
    }
}
