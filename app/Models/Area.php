<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\DB;
use Database\Factories\AreaFactory;
use App\Models\Restaurant;

class Area extends Model
{
	use HasFactory, SoftDeletes;

	protected $table = 'areas';

	protected $guarded = [];

	protected $hidden = [
		'updated_at',
		'deleted_at',
	];

	protected $casts = [
		'created_at' => 'datetime:Y-m-d H:i:s',
	];

	protected static function newFactory()
	{
		return AreaFactory::new();
	}

	function restaurant() {
		return $this->belongsTo(Restaurant::class);
	}

	function setPolygonAttribute($geo_json)
	{
		$this->attributes['polygon'] = DB::raw("ST_GeomFromGeoJSON('".$geo_json."')");
	}

	function getPolygonAttribute()
	{
		return $this->selectRaw('ST_AsGeoJSON(polygon) as poly')->where('id',$this->id)->first()->poly;
	}

	// Delete below
	function polygonUpdate($geo_json) {
		$this->polygon = DB::raw("ST_GeomFromGeoJSON('".$geo_json."')");
	}

	function geoJsonPolySample()
	{
		return '{"type": "Polygon", "coordinates": [[[21.01752050781249, 52.16553065086626], [21.018035491943348, 52.12265533376558], [21.079490264892566, 52.12697633873785], [21.06421240234374, 52.143413406069634], [21.052024444580066, 52.154473402050264], [21.043269714355457, 52.15647444111914], [21.032626708984363, 52.16711003359743], [21.01752050781249, 52.16553065086626]]]}';
	}
}