<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class PropertyResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param \Illuminate\Http\Request $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id_property,
            'type' => PropertyTypeResource::make($this->type),
            'title' => $this->property_title,
            'address' => $this->property_address,
            'rooms' => $this->property_rooms,
            'price' => $this->property_price,
            'area' => $this->property_area,
            'description' => $this->property_description,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at
        ];
    }
}
