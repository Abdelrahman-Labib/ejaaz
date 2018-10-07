<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Course;
use App\Comment;
use App\Category;
use Image;

class InterfaceController extends Controller
{
    public function addCourses(Request $req)
    {
        $course = new Course;
        $category= Category::findOrFail($req->category);
        $course->title = $req->title;
        $course->description = $req->description;
        $course->price = $req->price;

        $course->category()->associate($category);

        $path = $req->file('img')->store('public/images');
        $img = Image::make($path)->resize(300,250);
        $img= str_replace("public/","",$path);
        $course->img= $img;
        if($req->video){
        $path2 = $req->file('video')->store('public/images');
        $path2= str_replace("public/","",$path2);
        $course->video= $path2;
            
        }
        $course->type=$req->type; 
        if($req->type == 1){
        $course->center = $req->center;
        $course->address = $req->address;
        $course->date_start = $req->date_start;
        }

//        $course->img = $req->img;
//        $course->video = $req->video;
        $result= auth()->user()->courses()->save($course);
        return response()->json($result);
    }

    public function interface(){
        return Category::all()->load('courses');
//        return Course::select('courses.*', 'users.name as user_name')->join('users','courses.user_id','users.id')->get();
    }
    public function course(){
        return auth()->user()->load('courses');
    }

    public function showComment(Course $course){
        return $course->comments;
    }

    public function comment(Course $course, Request $request){
        $comment = new Comment;
        $comment->comment = $request->comment;

        $comment->course()->associate($course);
        auth()->user()->comments()->save($comment);

        return $comment;
    }

    public function userCourses(){
        return auth()->user()->joint_courses;
    }

    public function editCourse(Course $course, Request $req){
        $course->title = $req->title;
        $course->img = $req->img;
        $course->description = $req->description;
        $course->price = $req->price;
        auth()->user()->courses()->save($course);
        return response()->json($course);
    }

    public function deleteCourse(Course $course){
        $course->delete();
        return response()->json(["user" => auth()->user()->load(['courses', 'favorites', 'jointcourses', 'cart']), "categories" => Category::all()]);
    }

}
