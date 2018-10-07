<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Education extends Model
{
    protected $fillable= ["name", "institution", "start_date", "end_date", "description"];

    //
    public function user(){
        return $this->belongsTo('App\User');
    }

}
