<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Certificate extends Model
{
    protected $fillable= ["name", "from", "received_date", "description"];
    //
    public function user(){
        return $this->belongsTo('App\User');
    }

}
