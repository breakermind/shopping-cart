<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAreasTable extends Migration
{
	/*
		1. SELECT ST_AsGeoJSON(ST_GeomFromText('POINT(11.11111 12.22222)'),6);
		2. SET @json = '{"type": "Point", "coordinates": [11.11, 12.22]}';'
		3. SELECT ST_GeomFromGeoJSON(@json);
		{"type":"Polygon","coordinates":[[[20.834158077340533,52.11296920104141],[21.034658565621783,52.385376972929855],[21.397207393746783,52.15848668447624],[20.834158077340533,52.11296920104141]]]}

		CREATE TABLE cities(name VARCHAR(200), geo GEOMETRY(4326));
		INSERT INTO cities VALUES('Berlin', PointFromText('POINT(13.36963 52.52493)'));
		INSERT INTO cities VALUES('London', PointFromText('POINT(-0.1233 51.5309)'));
		-- this shows the distance in degrees:
		SELECT a.name, b.name, st_distance(a.geo, b.geo) FROM cities a, cities b;
		-- this shows the distance in meters:
		SELECT a.name, b.name, ST_DISTANCE_SPHERE(a.geo, b.geo) FROM cities a, cities b;
		-- this shows the distance in km:
		SELECT a.name, b.name, ST_DISTANCE_SPHERE(a.geo, b.geo) * .001 FROM cities a, cities b;
	*/
	public function up()
	{
		Schema::create('areas', function (Blueprint $table) {
			$table->id();
			$table->unsignedBigInteger('restaurant_id');
			$table->string('name')->default('');
			$table->string('about')->default('');
			$table->unsignedDecimal('min_order_cost',15,2)->default(0.00); // Delivery min order cost
			$table->unsignedDecimal('cost',15,2)->default(0.00); // Delivery cost
			$table->unsignedDecimal('free_from',15,2)->nullable()->default(0.00); // Delivery free from price
			$table->tinyInteger('on_free_from')->nullable()->default(0); // Enable free from delivery
			$table->integer('time')->nullable()->default(60); // Delivery time
			$table->polygon('polygon')->nullable(true); // $table->json('polygon')->default('{}');
			$table->integer('sorting')->nullable()->default(0);
			$table->tinyInteger('visible')->nullable()->default(1);
			$table->timestamps();
			$table->softDeletes();

			$table->unique(['name','restaurant_id']);
			$table->foreign('restaurant_id')->references('id')->on('restaurants')->onDelete('cascade');
		});
	}

	public function down()
	{
		Schema::dropIfExists('areas');
	}
}