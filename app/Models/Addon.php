<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\AddonGroup;

class Addon extends Model
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

	public function groups() {
		return $this->belongsToMany(AddonGroup::class);
	}
}
