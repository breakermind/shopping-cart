<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CategoriesTable extends Migration
{
	public function up()
	{
		Schema::create('categories', function (Blueprint $table) {
			$table->id();
			$table->string('name');
			$table->string('slug');
			$table->string('image',255)->nullable()->default('');
			$table->integer('sorting')->default(0);
			$table->tinyInteger('visible')->default(1);
			$table->timestamps();
			$table->softDeletes();
		});

		Schema::create('category_product', function (Blueprint $table) {
			$table->id('id');

			$table->unsignedBigInteger('category_id')->default(0)->index();
			$table->foreign('category_id')->references('id')->on('categories')->onDelete('cascade');

			$table->unsignedBigInteger('product_id')->default(0)->index();
			$table->foreign('product_id')->references('id')->on('products')->onDelete('cascade');

			$table->timestamps();
			$table->softDeletes();
		});
	}

	public function down()
	{
		Schema::dropIfExists('category_product');
		Schema::dropIfExists('categories');
	}
}