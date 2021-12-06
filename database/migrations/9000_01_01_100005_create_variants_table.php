<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateVariantsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('variants', function (Blueprint $table) {
			$table->id();
			$table->unsignedBigInteger('product_id')->index();
			$table->string('size',191)->nullable(true);
			$table->unsignedDecimal('price',15,2)->default(0.00);
			$table->unsignedDecimal('price_sale',15,2)->default(0.00);
			$table->unsignedDecimal('packaging',15,2)->default(0.00);
			$table->tinyInteger('on_sale')->unsigned()->default(0);
			$table->integer('sorting')->default(0);
			$table->timestamps();
			$table->softDeletes();

			$table->unique(['product_id', 'size']);
			$table->foreign('product_id')->references('id')->on('products')->onDelete('cascade');
		});
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('variants');
    }
}
