<?php

use Illuminate\Http\Request;

Route::group([

    'prefix' => 'auth'

], function () {

    //Authentication
    Route::post('register', 'AuthController@register');
    Route::post('login', 'AuthController@login');
    Route::post('logout', 'AuthController@logout');
    Route::post('refresh', 'AuthController@refresh');
    Route::post('me', 'AuthController@me');
    Route::post('/password/reset', 'AuthController@recover')->name('password.reset');
    Route::post('updatePassword', 'AuthController@updatePassword');
    Route::post('updateUser', 'AuthController@updateUser');
    Route::get('profile/{id}', 'AuthController@profile');

});
Route::group([
    'middleware' => 'jwt.auth',

], function () {

    //Categories
    Route::get('categories', 'CategoriesController@category');

    //Education
//        Route::get('education/{id}', 'SettingsController@Education');
    Route::get('user/education', 'SettingsController@Education');
    Route::post('addEducation', 'SettingsController@addEducation');
    Route::post('editEducation/{education}', 'SettingsController@editEducation');
    Route::delete('education/{education}', function (\App\Education $education){
        $education->delete();
        return auth()->user();
    });
    Route::post('user/img', function(Request $request){
        $user= \App\User::findOrFail(auth()->user()->id);
        $path = $request->file('img')->store('public/images');
        $path= str_replace("public/","",$path);
        $user->img= $path;
        $user->save();
        return response()->json(["user" => auth()->user()->load(['courses', 'favorites', 'jointcourses', 'cart']), "categories" => \App\Category::all()]);
    });
    Route::post('buy', function (){
        $courses= auth()->user()->cart;
        foreach ($courses as $course){
            auth()->user()->jointcourses()->attach($course);
            auth()->user()->cart()->detach($course);
        }
        return response()->json(["user" => auth()->user()->load(['courses', 'favorites', 'jointcourses', 'cart']), "categories" => \App\Category::all()]);
    });
    
    Route::get('buy', function (){
        $courses= auth()->user()->cart;
        return $courses;
    });
    
    
    Route::post('apply/{apply}', function ($apply, Request $req){
        $joint= new \App\JointCourse;
        $joint->course_id = $apply;
        $joint->status = $req->status;
        auth()->user()->courses()->save($joint);
        return auth()->user()->jointcourses;
    });
    
    Route::get('apply/{apply}', function ($apply){
        $joint = \App\JointCourse::select('joint_courses.*','users.name as user_name', 'users.img as user_img')
        ->join('users', 'joint_courses.user_id', '=', 'users.id')
        ->join('courses', 'joint_courses.course_id', '=', 'courses.id') 
        ->where(['courses.id'=>$apply])->get();
        return $joint;
    });
    
    Route::post('apply/{apply}/approve', function ($apply, Request $req){
        $joint= \App\JointCourse::findOrFail($apply);
        $joint->status = $req->status;

        $user = \App\User::where('email', $req->email)->first();
        if (!$user) {
            $error_message = "Your email address was not found.";
            return response()->json(['success' => false, 'error' => ['email'=> [$error_message]]], 401);
        }
        try {
            Illuminate\Support\Facades\Password::sendResetLink($req->only('email'), function (Message $message) {
                $message->subject('check your mail');
            });
        } catch (\Exception $e) {
            $error_message = $e->getMessage();
            return response()->json(['success' => false, 'error' => $error_message], 401);
        }
        $joint->save();

        return $joint;
       
    });
    

    //Job
    Route::get('user/jobs', 'SettingsController@Jobs');
    Route::post('addJobs', 'SettingsController@addJobs');
    Route::post('editJobs/{job}', 'SettingsController@editJobs');
    Route::delete('job/{job}', function (\App\Job $job){
        $job->delete();
        return auth()->user();
    });

    //Certificates
    Route::get('user/certificates', 'SettingsController@Certificates');
    Route::post('addCertificates', 'SettingsController@addCertificates');
    Route::post('editCertificates/{certificates}', 'SettingsController@editCertificates');
    Route::delete('certificates/{certificates}', function (\App\Certificate $certificates){
        $certificates->delete();
        return auth()->user();
    });


    //interface
    Route::post('addcourses', 'InterfaceController@addCourses');
    Route::get('courses', 'InterfaceController@interface');
    Route::get('course', 'InterfaceController@course');
    Route::post('editCourse/{course}', 'InterfaceController@editCourse');
    Route::delete('course/{course}', 'InterfaceController@deleteCourse');
    Route::delete('video/{video}', function (\App\Video $video){
        $video->delete();
        return response()->json(["user" => auth()->user()->load(['courses', 'favorites', 'jointcourses', 'cart']), "categories" => \App\Category::all()]);
    });
    Route::post('course/{course}/addVideo', function (\App\Course $course, Request $req){
        if($req->id){
            $video= \App\Video::findOrFail($req->id);
            $video->title = $req->title;
            $video->description = $req->description;
            if($req->video){
                $path2 = $req->file('video')->store('public/images');
                $path2= str_replace("public/","",$path2);
                $video->video= $path2;
            }
            $video->save();
        }else{
            $video= new \App\Video;
            $video->title = $req->title;
            $video->description = $req->description;
            if($req->video){
                $path2 = $req->file('video')->store('public/images');
                $path2= str_replace("public/","",$path2);
                $video->video= $path2;
            }
            $course->videos()->save($video);
        }
        return response()->json($video);
    });
    Route::post('course/{course}/addReview', function (\App\Course $course, Request $req){
        $review= new \App\Review;
        $review->rate= $req->rate;
        $review->review= $req->review;
        $review->course()->associate($course);
        return auth()->user()->reviews()->save($review);

    });
    Route::post('course/{course}/{review}/addComment', function (\App\Course $course,
    \App\Review $review,Request $req){
        $comment= new \App\Comment;
        $review->rate= $req->rate;
        $comment->comment= $req->comment;
        $comment->course()->associate($course);
        $comment->reviews()->associate($review);
        return auth()->user()->comments()->save($comment);

    });
    // Route::get('course/{course}/comments', 'InterfaceController@showComment');
    // Route::post('course/{course}/comment', 'InterfaceController@comment');
    Route::get('usercourses', 'InterfaceController@userCourses');

    //favourites
    Route::get('user/favorites', 'FavoriteController@favorites');

    //add to favorites
    Route::post('favorites/{course}', function (\App\Course $course){
        auth()->user()->favorites()->attach($course);
        return auth()->user()->favorites;
    });
    //remove from favorites
    Route::delete('favorites/{course}', function (\App\Course $course){
        auth()->user()->favorites()->detach($course);
        return auth()->user()->favorites;
    });

    //add to cart
    Route::post('cart/{course}', function (\App\Course $course){
        auth()->user()->cart()->attach($course);
        return auth()->user()->cart;
    });
    //remove from cart
    Route::delete('cart/{course}', function (\App\Course $course){
        auth()->user()->cart()->detach($course);
        return auth()->user()->cart;
    });

    // Search
    Route::post('search', 'SearchController@search');
Route::get('/payment', 'PaymentController@index');
});
Route::get("category/{category}/courses", function (\App\Category $category){
    return $category->courses;
});
Route::get("course/{course}/videos", function (\App\Course $course){
    return $course->videos;
});
Route::get('course/{course}/reviews', function (\App\Course $course) {
    return $course->reviews;
});
Route::get('course/{course}/comments', function (\App\Course $course) {
    return $course->comments;
});
Route::get('terms', function(){
   return \App\Terms::all();
});
Route::get('callus', function(){
   return \App\Callus::all();
});
Route::post('password', 'SettingsController@security');

Route::get('status', 'PaymentController@getPaymentStatus');
Route::get('cancel', 'PaymentController@cancel');

Route::post('paypal', 'PaymentController@payWithPaypal');
Route::post('paymentIos', 'PaymentController@paymentIos');
