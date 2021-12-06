<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCartsTable extends Migration
{
	/*
		alter table `carts` add constraint `carts_area_id_foreign` foreign key (`area_id`) references `areas` (`id`) on delete cascade;
		alter table `carts` add constraint `carts_user_id_foreign` foreign key (`user_id`) references `users` (`id`) on delete cascade;

		INSERT INTO `products` (`id`, `name`, `about`, `created_at`, `updated_at`, `deleted_at`) VALUES (NULL, 'Pizza', 'Pizza', NULL, NULL, NULL);
		INSERT INTO `variants` (`id`, `product_id`, `size`, `price`, `price_sale`, `packaging`, `on_sale`, `sorting`, `created_at`, `updated_at`, `deleted_at`) VALUES (NULL, '1', 'Mała', '10.00', '0.00', '0.00', '0', '0', NULL, NULL, NULL), (NULL, '1', 'Średnia', '20.00', '0.00', '0.00', '0', '0', NULL, NULL, NULL);
		INSERT INTO `addons` (`id`, `name`, `price`, `created_at`, `updated_at`, `deleted_at`) VALUES (NULL, 'Sos łagodny', '1.00', NULL, NULL, NULL), (NULL, 'Sos pikantny', '0.00', NULL, NULL, NULL);
	*/
	public function up()
	{
		Schema::create('carts', function (Blueprint $table) {
			$table->uuid('id')->primary();
			$table->unsignedBigInteger('area_id')->nullable(true);
			$table->unsignedBigInteger('user_id')->nullable(true);
			$table->string('ip');
			$table->timestamps();
			$table->softDeletes();

			$table->foreign('area_id')->references('id')->on('areas')->onDelete('cascade');
			$table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
		});

		Schema::create('cart_variant', function (Blueprint $table) {
			$table->id();
			$table->uuid('cart_id');
			$table->unsignedBigInteger('variant_id');
			$table->unsignedInteger('quantity')->nullable()->default(1);
			$table->timestamps();
			$table->softDeletes();

			$table->foreign('cart_id')->references('id')->on('carts')->onDelete('cascade');
			$table->foreign('variant_id')->references('id')->on('variants')->onDelete('cascade');
		});

		Schema::create('addon_cart_variant', function (Blueprint $table) {
			$table->id();
			$table->unsignedBigInteger('cart_id');
			$table->unsignedBigInteger('addon_id');
			$table->unsignedInteger('quantity')->nullable()->default(1);
			$table->timestamps();
			$table->softDeletes();

			$table->foreign('cart_id')->references('id')->on('cart_variants')->onDelete('cascade');
			$table->foreign('addon_id')->references('id')->on('addons')->onDelete('cascade');
		});
	}

	public function down()
	{
		Schema::dropIfExists('cart_variant_addons');
		Schema::dropIfExists('cart_variant');
		Schema::dropIfExists('carts');
	}
}
