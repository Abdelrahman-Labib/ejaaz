<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{
    protected $with= ['user'];
    //
    public function course(){
        return $this->belongsTo('App\Course');
    }
    public function user(){
        return $this->belongsTo('App\User');
    }
    
    public function reviews(){
        return $this->belongsTo('App\Review');
    }
}
