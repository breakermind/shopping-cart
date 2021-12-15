<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\Pivot;
use App\Models\Addon;
use App\Models\Product;
use App\Models\CartAddon;

class CartVariant extends Pivot
{
	public $incrementing = true;
	
	protected $hidden = [
		'created_at',
		'updated_at',
		'deleted_at'
	];

	function product()
	{
		return $this->belongsTo(Product::class);
	}

	function addons()
	{
		return $this->belongsToMany(Addon::class)
			->withPivot('quantity','id')
			->using(CartAddon::class)
			->withTimestamps();
	}
}
