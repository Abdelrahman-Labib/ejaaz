<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Review extends Model
{
    protected $with= ['user', 'comments'];
    //
    public function course(){
        return $this->belongsTo('App\Course');
    }
    public function user(){
        return $this->belongsTo('App\User');
    }
    
    public function comments(){
        return $this->hasMany('App\Comment','reviews_id');
    }
}
