<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\Pivot;

class CartAddon extends Pivot
{
	protected $hidden = [
		'created_at',
		'updated_at',
		'deleted_at'
	];
}
