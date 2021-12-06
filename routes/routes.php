<?php

use Illuminate\Support\Facades\Route;
use App\Models\Cart;

Route::get('/', function () {
	$c = [];

	// $c = Cart::create(['id' => '555','area_id' => null,'user_id' => null,'ip' => '']);

	$c = Cart::where('id', '555')->first();

	// Add variants
	$c->variants()->sync([
		1 => ['quantity' => 2],
		2 => ['quantity' => 3]
	]);

	// Variants
	$list = $c->variants;

	// Variant
	$variant = $c->variants()->first();

	// Add addons
	$variant->pivot->addons()->sync([
		1 => ['quantity' => 3],
		2 => ['quantity' => 1]
	]);

	// Get addons
	$addons = $variant->pivot->addons;

	return [
		'variants' => $list,
		'variant' => $variant,
		'addons' => $addons,
	];

	// return view('welcome');
});
