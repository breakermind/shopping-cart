<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAddonGroupsTable extends Migration
{
	public function up()
	{
		Schema::create('addon_groups', function (Blueprint $table) {
			$table->id();
			$table->string('name');
			$table->enum('size', ['S','M','L',"XL","XXL","XXXL"])->default('S');
			$table->tinyInteger('multiple')->unsigned()->default(1);
			$table->tinyInteger('required')->unsigned()->default(0);
			$table->integer('sorting')->default(0);
			$table->string('about')->default('');
			$table->timestamps();
			$table->unique(['name','size']);
			$table->softDeletes();
		});

		Schema::create('addon_group_variant', function (Blueprint $table) {
			$table->id('id');

			$table->unsignedBigInteger('variant_id')->default(0)->index();
			$table->foreign('variant_id')->references('id')->on('variants')->onDelete('cascade');

			$table->unsignedBigInteger('addon_group_id')->default(0)->index();
			$table->foreign('addon_group_id')->references('id')->on('addon_groups')->onDelete('cascade');

			$table->timestamps();
			$table->softDeletes();
		});

		Schema::create('addon_addon_group', function (Blueprint $table) {
			$table->id('id');

			$table->unsignedBigInteger('addon_id')->default(0)->index();
			$table->foreign('addon_id')->references('id')->on('addons')->onDelete('cascade');

			$table->unsignedBigInteger('addon_group_id')->default(0)->index();
			$table->foreign('addon_group_id')->references('id')->on('addon_groups')->onDelete('cascade');

			$table->timestamps();
			$table->softDeletes();
		});
	}

	public function down()
	{
		Schema::dropIfExists('addon_addon_group');
		Schema::dropIfExists('addon_group_variant');
		Schema::dropIfExists('addon_groups');
	}
}
