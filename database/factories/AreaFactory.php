<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Area;

class AreaFactory extends Factory
{
	/**
	 * Model for factory
	 */
	protected $model = Area::class;

	/**
	 * Define the model's default state.
	 *
	 * @return array
	 */
	public function definition()
	{
		return [
			'restaurant_id' => 1,
			'name' => 'Area '. uniqid(),
			'min_order_cost' => $this->faker->randomFloat(),
			'cost' => $this->faker->randomFloat(),
			'about' => $this->faker->sentence(),
			'polygon' => '{"type": "Polygon", "coordinates": [[[21.01752050781249, 52.16553065086626], [21.018035491943348, 52.12265533376558], [21.079490264892566, 52.12697633873785], [21.06421240234374, 52.143413406069634], [21.052024444580066, 52.154473402050264], [21.043269714355457, 52.15647444111914], [21.032626708984363, 52.16711003359743], [21.01752050781249, 52.16553065086626]]]}',
		];
	}
}
