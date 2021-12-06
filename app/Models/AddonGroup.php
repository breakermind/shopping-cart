<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\Addon;
use App\Models\Variant;

class AddonGroup extends Model
{
	use HasFactory, SoftDeletes;

    protected $guarded = [];

    protected $hidden = [
        'updated_at',
        'deleted_at'
    ];

    protected $casts = [
        'created_at' => 'datetime:Y-m-d',
    ];

	public function addons() {
		return $this->belongsToMany(Addon::class);
	}

	public function variants() {
		return $this->belongsToMany(Variant::class);
	}

	/**
	 * Get group addons id group_addons
	 *
	 * @return void
	 */
	public function getAddonsIdAttribute() {
		return $this->addons->pluck('id')->toArray();
	}
}
