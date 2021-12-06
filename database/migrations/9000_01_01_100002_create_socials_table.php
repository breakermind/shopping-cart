<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSocialsTable extends Migration
{
	public function up()
	{
		Schema::create('socials', function (Blueprint $table) {
			$table->id();
			$table->unsignedBigInteger('restaurant_id')->nullable(true);
			$table->string('name')->default('');
			$table->string('icon')->default('');
			$table->string('link')->default('');
			$table->timestamps();
			$table->softDeletes();

			$table->unique(['name','restaurant_id']);
			$table->foreign('restaurant_id')->references('id')->on('restaurants')->onDelete('cascade');
		});
	}

	public function down()
	{
		Schema::dropIfExists('socials');
	}
}