<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\CartVariant;

class Cart extends Model
{
	use HasFactory, SoftDeletes;

	public $incrementing = false;

	protected $primaryKey = 'id';

	protected $keyType = 'string';

	protected $guarded = [];

	protected $hidden = [
		'updated_at',
		'deleted_at'
	];

	protected $casts = [
        'created_at' => 'datetime:Y-m-d h:i:s',
    ];

	function variants()
	{
		return $this->belongsToMany(Variant::class)
			->wherePivot('cart_id', $this->id)
			->withPivot('id','quantity')
			->using(CartVariant::class)
			->withTimestamps();
	}

	public function newPivot(Model $parent, array $attributes, $table, $exists, $using = null)
	{
		if($parent instanceof Cart) {
			return new CartVariant($attributes);
		}
		return parent::pivot($parent, $attributes, $table, $exists);
	}
}
