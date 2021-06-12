<?php

namespace App\Http\Controllers;

use App\Http\Resources\BookingResource;
use App\Models\Booking;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class BookingController extends Controller
{
    public function index()
    {
        return BookingResource::collection(Booking::all());
    }

    public function byUser(Request $request, int $idUser)
    {
        return BookingResource::collection(Booking::where('id_user', $idUser)->where('active', 'S')->orderBy('id_user')->get());
    }

    public function create(Request $request): \Illuminate\Http\JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'userId' => 'required|int|exists:users,id',
            'propertyId' => 'required|int|exists:property,id_property',
            'checkIn' => 'required|date_format:Y-m-d',
            'checkOut' => 'required|date_format:Y-m-d',
            'guests' => 'required|int',
            'vehicle' => 'required|int',
            'children' => 'required|int',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => 'error',
                'data' => $validator->errors()
            ]);
        }

        $booking = Booking::create([
            'id_user' => $request->userId,
            'id_property' => $request->propertyId,
            'check_in' => $request->checkIn,
            'check_out' => $request->checkOut,
            'guests' => $request->guests,
            'vehicle' => $request->vehicle,
            'children' => $request->children,
        ]);

        return response()->json([
            'message' => 'successful',
            'data' => $booking
        ], 201);
    }

    public function delete(Request $request, int $idBooking)
    {
        $booking = Booking::find($idBooking);
        $booking->booked = 'N';
        $isDelete = $booking->save();

        return response()->json([
            'data' => [
                'delete' => $isDelete
            ]
        ]);
    }

    public function update(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'userId' => 'required|int|exists:users,id',
            'propertyId' => 'required|int|exists:property,id_property',
            'checkIn' => 'required|date_format:Y-m-d',
            'checkOut' => 'required|date_format:Y-m-d',
            'guests' => 'required|int',
            'vehicle' => 'required|int',
            'children' => 'required|int',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => 'error',
                'data' => $validator->errors()
            ]);
        }

        $booking = Booking::find($request->id);
        $booking->check_in = $request->checkIn;
        $booking->check_out = $request->checkOut;
        $booking->guests = $request->guests;
        $booking->vehicle = $request->vehicle;
        $booking->children = $request->children;
        $booking = $booking->save();

        return response()->json([
            'message' => 'successful',
            'data' => $booking
        ], 201);
    }

    public function destroy(Request $request, int $idBooking)
    {
        $booking = Booking::find($idBooking);
        $isDeletePermanent = $booking->delete();

        return response()->json([
            'data' => [
                'delete_permanent' => $isDeletePermanent
            ]
        ]);
    }
}
