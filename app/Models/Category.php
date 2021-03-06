<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Category extends Model
{
    use SoftDeletes,Traits\Uuid;

    protected $fillable = array('name','description','is_active');
    protected $dates = array('deleted_at');
    protected $casts = array('id' => 'string');
    public $incrementing = false;
}
