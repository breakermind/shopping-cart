<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRestaurantsTable extends Migration
{
	public function up()
	{
		Schema::create('restaurants', function (Blueprint $table) {
			$table->id();
			$table->string('name')->unique();
			$table->string('city')->nullable()->default('');
			$table->string('address')->nullable()->default('');
			$table->string('country')->nullable()->default('');
			$table->string('mobile')->nullable()->default('');
			$table->string('email')->nullable()->default('');
			$table->string('website')->nullable()->default('');
			$table->text('about')->nullable()->default('');
			// Notification mobile number
			$table->string('notify_sms')->nullable()->default('');
			// Restaurant show/hide
			$table->tinyInteger('visible')->nullable()->default(1);
			// Delivery on/off
			$table->tinyInteger('on_delivery')->nullable()->default(1);
			// Temporary closed
			$table->tinyInteger('break')->nullable()->default(0);
			// Payment
			$table->tinyInteger('pay_money')->nullable()->default(1);
			$table->tinyInteger('pay_pickup')->nullable()->default(1);
			$table->tinyInteger('pay_card')->nullable()->default(0);
			$table->tinyInteger('pay_online')->nullable()->default(0);
			// Marker
			$table->decimal('lng',15,6)->nullable()->default('0.000000');
			$table->decimal('lat',15,6)->nullable()->default('0.000000');
			// Date
			$table->timestamps();
			$table->softDeletes();
		});
	}

	public function down()
	{
		Schema::dropIfExists('restaurants');
	}
}
