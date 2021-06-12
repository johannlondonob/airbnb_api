<?php

namespace App\Http\Controllers;

use App\Http\Resources\UserResource;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rules;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function index(): \Illuminate\Http\Resources\Json\AnonymousResourceCollection
    {
        return UserResource::collection(User::all());
    }

    public function register(Request $request): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'identification' => 'required|unique:users,identification',
            'name' => 'required|string|max:255',
            'lastname' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => ['required', Rules\Password::min(8)],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => 'error',
                'data' => $validator->errors()
            ]);
        }

        $user = User::create([
            'identification' => $request->identification,
            'name' => $request->name,
            'lastname' => $request->lastname,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);

        return response()->json([
            'message' => 'successful',
            'data' => $user
        ], 201);
    }

    public function login(Request $request): \Illuminate\Http\JsonResponse
    {
        $credentials = [
            'email' => $request->email,
            'password' => $request->password
        ];

        if (! Auth::attempt($credentials, false)) {
            return response()->json([
                'data' => [
                    'code' => 0,
                    'message' => 'Authentication failed',
                ]
            ]);
        }

        return response()->json([
            'data' => [
                'code' => 1,
                'message' => 'Authentication successful',
                'user' => Auth::user()
            ]
        ]);
    }

    public function delete(Request $request, int $userId)
    {
        $user = User::find($userId);
        $isDeletePermanent = $user->delete();

        return response()->json([
            'data' => [
                'delete_permanent' => $isDeletePermanent
            ]
        ]);
    }

    public function update(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'id' => 'required|exists:users,id',
            'identification' => 'required|unique:users,identification',
            'name' => 'required|string|max:255',
            'lastname' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => ['required', Rules\Password::min(8)],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => 'error',
                'data' => $validator->errors()
            ]);
        }

        $user = User::find($request->id);
        $user->name = $request->name;
        $user->lastname = $request->lastname;
        $user->identification = $request->identification;
        $user->email = $request->email;
        $user->password = Hash::make($request->password);
        $user = $user->save();

        return response()->json([
            'message' => 'successful',
            'data' => $user
        ], 201);
    }
}
