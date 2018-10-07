<?php

namespace App;

use Tymon\JWTAuth\Contracts\JWTSubject;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable implements JWTSubject
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password', 'type'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];


    public function courses(){
        return $this->hasMany('App\Course');
    }
    public function reviews(){
        return $this->hasMany('App\Review');
    }
    public function comments(){
        return $this->hasMany('App\Comment');
    }
    public function payments(){
        return $this->hasMany('App\Payment');
    }
    public function notifications(){
        return $this->hasMany('App\Notification');
    }
    public function certificates(){
        return $this->hasMany('App\Certificate');
    }
    public function education(){
        return $this->hasMany('App\Education');
    }
    public function jobs(){
        return $this->hasMany('App\Job');
    }



    public function jointCourses(){
        return $this->belongsToMany('App\Course', 'joint_courses')->withPivot('status');
    }
    public function favorites(){
        return $this->belongsToMany('App\Course', 'favorites');
    }
    public function cart(){
        return $this->belongsToMany('App\Course', 'carts');
    }

    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    public function getJWTCustomClaims()
    {
        return [];
    }
}
