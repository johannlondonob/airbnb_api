<?php

namespace App\Http\Controllers;

use App\Http\Resources\PropertyResource;
use App\Models\Property;
use App\Models\PropertyUser;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class PropertyController extends Controller
{
    public function index(): \Illuminate\Http\Resources\Json\AnonymousResourceCollection
    {
        return PropertyResource::collection(Property::all());
    }

    public function create(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'idUser' => 'required|int|exists:users,id',
            'title' => 'required|string',
            'idType' => 'required|exists:property_type,id_property_type',
            'address' => 'required|string',
            'rooms' => 'required|int',
            'price' => 'required|int',
            'area' => 'required|int',
            'description' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => 'error',
                'data' => $validator->errors()
            ]);
        }

        $property = Property::create([
            'property_title' => $request->title,
            'id_property_type' => $request->idType,
            'property_address' => $request->address,
            'property_rooms' => $request->rooms,
            'property_price' => $request->price,
            'property_area' => $request->area,
            'property_description' => $request->description,
        ]);

        $idUser = $request->get('idUser');

        PropertyUser::create([
            'id_user' => $idUser,
            'id_property' => $property->id_property
        ]);

        return response()->json([
            'message' => 'successful',
            'data' => $property
        ], 201);
    }

    public function delete(int $propertyId)
    {
        $property = Property::find($propertyId);
        $isDeletePermanent = $property->delete();

        return response()->json([
            'data' => [
                'delete_permanent' => $isDeletePermanent
            ]
        ]);
    }
}
