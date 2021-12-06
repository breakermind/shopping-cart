<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Restaurant;


class RestaurantFactory extends Factory
{
	/**
	 * Model for factory
	 */
	protected $model = Restaurant::class;

	/**
	 * Define the model's default state.
	 *
	 * @return array
	 */
	public function definition()
	{
		return [
			'name' => $this->faker->unique()->company(),
			'city' => $this->faker->city(),
			'address' => $this->faker->streetAddress(),
			'country' => $this->faker->country(),
			'mobile' => $this->faker->e164PhoneNumber(),
			'email' => $this->faker->userName().'@app.xx',
			'website' => 'http://app.xx',
			'about' => 'Description ...',
			'pay_card' => $this->faker->numberBetween(0,1),
			'pay_money' => $this->faker->numberBetween(0,1),
			'pay_online' => $this->faker->numberBetween(0,1),
			'pay_pickup' => $this->faker->numberBetween(0,1),
			'on_delivery' => $this->faker->numberBetween(0,1),
			'visible' => $this->faker->numberBetween(0,1),
			'break' => $this->faker->numberBetween(0,1),
			'notify_sms' => $this->faker->e164PhoneNumber(),
			'lat' => $this->faker->latitude($min = -90, $max = 90),
			'lng' => $this->faker->longitude($min = -180, $max = 180),
		];
	}
}
