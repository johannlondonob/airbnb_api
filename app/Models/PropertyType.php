<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PropertyType extends Model
{
    use HasFactory;

    protected $table = 'property_type';
    protected $primaryKey = 'id_property_type';
    protected $fillable = [
        'property_type', 'property_type_is_active',
    ];

    public function property(): \Illuminate\Database\Eloquent\Relations\HasOne
    {
        return $this->hasOne(Property::class, 'id_property_type');
    }
}
