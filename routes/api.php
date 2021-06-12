<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::prefix('user')->group(function () {
    Route::get('/', [\App\Http\Controllers\UserController::class, 'index']);
    Route::post('/register', [\App\Http\Controllers\UserController::class, 'register']);
    Route::post('/login', [\App\Http\Controllers\UserController::class, 'login']);
    Route::put('/update', [\App\Http\Controllers\UserController::class, 'update']);
    Route::delete('/delete', [\App\Http\Controllers\UserController::class, 'delete']);
});

Route::prefix('property')->group(function () {
    Route::get('/', [\App\Http\Controllers\PropertyController::class, 'index']);
    Route::post('/create', [\App\Http\Controllers\PropertyController::class, 'create']);
    Route::delete('/delete', [\App\Http\Controllers\PropertyController::class, 'delete']);
});

Route::prefix('property-types')->group(function () {
    Route::get('/', [\App\Http\Controllers\PropertyTypeController::class, 'index']);
});

Route::prefix('properties')->group(function () {
    Route::get('/', [\App\Http\Controllers\PropertyUserController::class, 'index']);
    Route::get('/owner/{idUser}', [\App\Http\Controllers\PropertyUserController::class, 'byUser']);
});

Route::prefix('bookings')->group(function () {
    Route::get('/', [\App\Http\Controllers\BookingController::class, 'index']);
    Route::get('/user/{idUser}', [\App\Http\Controllers\BookingController::class, 'byUser']);
    Route::post('/create', [\App\Http\Controllers\BookingController::class, 'create']);
    Route::put('/delete/{idBooking}', [\App\Http\Controllers\BookingController::class, 'delete']);
    Route::put('/update/{idBookin}', [\App\Http\Controllers\BookingController::class, 'update']);
    Route::delete('/delete-permanent/{idBooking}', [\App\Http\Controllers\BookingController::class, 'destroy']);
});
