<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Day;


class DayFactory extends Factory
{
	/**
	 * Model for factory
	 */
	protected $model = Day::class;

	/**
	 * Define the model's default state.
	 *
	 * @return array
	 */
	public function definition()
	{
		return [
			'restaurant_id' => 1,
			'number' => 1,
			'open' => rand(10,12).':00:00',
			'close' => rand(20,23).':00:00',
			'closed' => 0
		];
	}

	/**
	 * Indicate that the user is suspended.
	 *
	 * @return \Illuminate\Database\Eloquent\Factories\Factory
	 */
	public function closed()
	{
		return $this->state(function (array $attributes) {
			return [
				'closed' => 1,
			];
		});
	}
}
