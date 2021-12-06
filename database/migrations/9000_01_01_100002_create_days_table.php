<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDaysTable extends Migration
{
	public function up()
	{
		Schema::create('days', function (Blueprint $table) {
			$table->id();
			$table->unsignedBigInteger('restaurant_id')->nullable(true);
			$table->enum('number', ['1','2','3','4','5','6','7','break'])->default('1');
			$table->time('open')->default('00:00:00');
			$table->time('close')->default('23:00:00');
			$table->tinyInteger('closed')->nullable()->default(0);
			$table->timestamps();
			$table->softDeletes();

			$table->unique(['number','restaurant_id']);
			$table->foreign('restaurant_id')->references('id')->on('restaurants')->onDelete('cascade');
		});
	}

	public function down()
	{
		Schema::dropIfExists('days');
	}
}