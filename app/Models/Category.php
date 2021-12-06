<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\Product;

class Category extends Model
{
	use HasFactory, SoftDeletes;

	protected $guarded = [];

	public function products() {
		return $this->belongsToMany(Product::class)->withTimestamps();
	}

	public function visible_products() {
		return $this->belongsToMany(Product::class)->where('visible', 1)->orderBy('sorting', 'asc')->orderBy('id', 'asc')->withTimestamps();
	}
}
