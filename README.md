# Restaurant Shopping Cart
How to create a basket of products with addons for a restaurant in Laravel.

### Database tables
Add records to the database first
- Area
- Restaurant
- Products
- Variants
- Addons

### Cart
Add records to the database first
```php
<?php
use Illuminate\Support\Facades\Route;
use App\Models\Cart;

Route::get('/cart', function () {

	$c = [];
	
	// Create with: uniqid()
	$c = Cart::create([
		'id' => '777',
		'area_id' => null,
		'user_id' => null,
		'ip' => '';
	]);

	// Get
	$c = Cart::where('id', $c->id)->first();

	// Add variant id
	$c->variants()->sync([
		1 => ['quantity' => 3],
		2 => ['quantity' => 2]
	]);

	$v = $c->variants;

	$p1 = $c->variants()->first()->pivot;
	
	$p1->addons()->sync([
		1 => ['quantity' => 3],
		2 => ['quantity' => 1]
	]);

	$p2 = $c->variants()->find(2)->pivot;
	
	$p2->addons()->sync([
		2 => ['quantity' => 5]
	]);

	$a1 = $p1->addons;
	$a2 = $p2->addons;

	return [
		// 'variants' => $v,
		'variant 1' => $p1,
		'variant 2' => $p2,
	];
	
});
```
