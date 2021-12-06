<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\Variant;
use App\Models\Category;

class Product extends Model
{
	use HasFactory, SoftDeletes;

	protected $guarded = [];

    protected $hidden = [
		'updated_at',
		'deleted_at'
	];

	protected $casts = [
        'created_at' => 'datetime:Y-m-d h:i:s',
    ];

	public function variants() {
		return $this->hasMany(Variant::class);
	}

	public function categories() {
		return $this->belongsToMany(Category::class)->orderBy('sorting', 'desc')->withTimestamps();
	}
}
