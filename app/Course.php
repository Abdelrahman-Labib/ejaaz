<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Course extends Model
{
    protected $with= ['user'];

    //
    public function user(){
        return $this->belongsTo('App\User');
    }
    public function category(){
        return $this->belongsTo('App\Category');
    }


    public function reviews(){
        return $this->hasMany('App\Review');
    }
    public function videos(){
        return $this->hasMany('App\Video');
    }
    public function comments(){
        return $this->hasMany('App\Comment');
    }


    public function payments(){
        return $this->hasMany('App\Payment');
    }


    public function jointUsers(){
        return $this->belongsToMany('App\User', 'joint_courses')->withPivot('status');
    }
    public function tags(){
        return $this->belongsToMany('App\Tag', 'course_tags');
    }
    public function favorites(){
        return $this->belongsToMany('App\User', 'favorites');
    }
    public function cart(){
        return $this->belongsToMany('App\User', 'carts');
    }

}
