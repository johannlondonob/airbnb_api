<?php

namespace App\Http\Controllers;

use App\Http\Resources\PropertyUserResource;
use App\Models\PropertyUser;
use Illuminate\Http\Request;

class PropertyUserController extends Controller
{
    public function index(): \Illuminate\Http\Resources\Json\AnonymousResourceCollection
    {
        return PropertyUserResource::collection(PropertyUser::all());
    }


    public function byUser(Request $request, int $idUser)
    {
        return PropertyUserResource::collection(PropertyUser::all()->where('id_user', $idUser));
    }
}
