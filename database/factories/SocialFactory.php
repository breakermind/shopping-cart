<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Social;


class SocialFactory extends Factory
{
	/**
	 * Model for factory
	 */
	protected $model = Social::class;

	/**
	 * Define the model's default state.
	 *
	 * @return array
	 */
	public function definition()
	{
		return [
			'restaurant_id' => 1,
			'name' => 'Social ' . uniqid(),
			'icon' => $this->faker->imageUrl(48, 48, 'animals', true),
			'link' => $this->faker->url(),
		];
	}
}
