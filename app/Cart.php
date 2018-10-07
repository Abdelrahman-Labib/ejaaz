<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{
    protected $with= ['course'];
    //

    public function course(){
        return $this->belongsTo("App\Course");
    }

    public function user(){
        return $this->belongsTo("App\User");
    }
}
