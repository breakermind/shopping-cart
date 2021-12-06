<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\Pivot;
use App\Models\Addon;
use App\Models\CartAddon;

class CartVariant extends Pivot
{
	protected $hidden = [
		'created_at',
		'updated_at',
		'deleted_at'
	];

	function addons()
	{
		return $this->belongsToMany(Addon::class)
			->withPivot('id','quantity')
			->using(CartAddon::class)
			->withTimestamps();
	}
}
