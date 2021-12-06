# Restaurant Shopping Cart
How to create a basket of products with addons for a restaurant in Laravel. Laravel relations pivot table with additional extra parameters and custom pivot models.

### Copy files and set .env
```sh
composer create-project laravel/laravel demo
```

### Create database tables
```sh
php artisan migrate
```

### Import or create tables data
Add rows to the database first (or import db: demo.sql)
- Restaurant
- Products
- Variants
- Addons

### Cart example
```php
<?php
use Illuminate\Support\Facades\Route;
use App\Models\Cart;

Route::get('/', function () {

	$cart = [];

	// New
	$cart = Cart::create([
		'id' => uniqid(),
		'area_id' => null,
		'user_id' => null,
		'ip' => ''
	]);

	// Get
	$cart = Cart::where('id', $cart->id)->first();

	// Add product variant/s
	$cart->variants()->sync([
		1 => ['quantity' => 2],
		2 => ['quantity' => 3]
	]);

	// Get variants
	$list = $cart->variants;

	// Get variant
	$variant = $cart->variants()->first();

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

});
```
