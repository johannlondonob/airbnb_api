<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Property extends Model
{
    use HasFactory;

    protected $table = 'property';
    protected $primaryKey = 'id_property';
    protected $fillable = [
        'property_title', 'id_property_type', 'property_address', 'property_rooms', 'property_price', 'property_area', 'property_description', 'property_is_active',
    ];

    public function type(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(PropertyType::class, 'id_property_type');
    }

    public function owner(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(PropertyUser::class, 'id_user');
    }
}
