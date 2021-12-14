<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\Pivot;
use App\Models\Addon;

class CartAddon extends Pivot
{
	public $incrementing = true;
	
	protected $hidden = [
		'created_at',
		'updated_at',
		'deleted_at'
	];

	function addon()
	{
		return $this->belongsTo(Addon::class);
	}
}
