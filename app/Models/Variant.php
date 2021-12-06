<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\Product;

class Variant extends Model
{
    use HasFactory, SoftDeletes;

	protected $guarded = [];

    protected $hidden = [
		'created_at',
		'updated_at',
		'deleted_at'
	];

	protected $casts = [
        'created_at' => 'datetime:Y-m-d h:i:s',
    ];

    function product()
    {
    	return $this->belongsTo(Product::class);
    }
}
