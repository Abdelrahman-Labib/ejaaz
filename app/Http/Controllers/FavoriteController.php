<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Favorite;
use App\Course;

class FavoriteController extends Controller
{
    public function favorites(){
        return auth()->user()->favorites;
//        return Favorite::select('favorites.*', 'courses.title as courses_title', 'courses.price as courses_price',
//        'users.name as user_name')
//        ->join('courses', 'favorites.course_id', 'courses.id')
//        ->join('users', 'courses.user_id', 'users.id')
//        ->where('favorites.user_id', $req->id)->get();
    }
}
