<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Database\Factories\RestaurantFactory;
use App\Models\Area;
use App\Models\Day;
use App\Models\Social;

class Restaurant extends Model
{
	use HasFactory, SoftDeletes;

	protected $guarded = [];

	protected $hidden = [
		'updated_at',
		'deleted_at',
		// 'notify_sms',
	];

	protected $casts = [
		'created_at' => 'datetime:Y-m-d',
	];

	protected static function newFactory()
	{
		return RestaurantFactory::new();
	}

	function areas() {
		return $this->hasMany(Area::class);
	}

	function days() {
		return $this->hasMany(Day::class);
	}

	function socials() {
		return $this->hasMany(Social::class);
	}

	function getNotifySmsAttribute()
	{
		return preg_replace('/[^\+0-9)(]/', '', $this->attributes['notify_sms']);
	}

	function setNotifySmsAttribute($nr)
	{
		$this->attributes['notify_sms'] = preg_replace('/[^\+0-9)(]/', '',$nr);
	}
}
