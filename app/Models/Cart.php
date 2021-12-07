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

	function addProduct($id,$qty = 1)
	{
		if($id > 0 && $qty > 1) {
			$this->variants()->attach([$id => ['quantity' => $qty]]);
		}
	}

	function delProduct($id)
	{
		if($id > 0) {
			$this->variants()->wherePivot('id', $id)->detach();
		}
	}

	function plusProduct($id)
	{
		$p = $this->variants()->find((int) $id);
		if($p) {
			$p->pivot->increment('quantity', 1);

		}
	}

	function minusProduct($id)
	{
		$p = $this->variants()->find((int) $id);
		if($p) {
			if($p->pivot->quantity >= 2) {
				$p->pivot->decrement('quantity', 1);
			}
		}
	}

	function addAddon($cart_id,$addon_id,$qty = 1)
	{
		if($cart_id > 0 && $addon_id > 0 && $qty >= 1) {
			$this->variants()->wherePivot('id', $cart_id)->first()->pivot
			->addons()->sync([$addon_id => ['quantity' => $qty]], false);
		}
	}

	function delAddon($cart_id, $id)
	{
		if($cart_id > 0 && $id > 0) {
			$this->variants()->wherePivot('id', $cart_id)->first()->pivot
			->addons()->wherePivot('id', $id)->detach();
		}
	}

	function plusAddon($cart_id, $id)
	{
		if($cart_id > 0 && $id > 0) {
			$p = $this->variants()->wherePivot('id', $cart_id)->first()->pivot
			->addons()->wherePivot('id', $id)->first()->pivot;
			$p->increment('quantity', 1);
		}
	}

	function minusAddon($cart_id, $id)
	{
		if($cart_id > 0 && $id > 0) {
			$p = $this->variants()->wherePivot('id', $cart_id)->first()->pivot
			->addons()->wherePivot('id', $id)->first()->pivot;
			if($p->quantity > 1) {
				$p->decrement('quantity', 1);
			}
		}
	}
}
