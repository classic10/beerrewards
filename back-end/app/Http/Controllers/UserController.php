<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;

class UserController extends Controller
{
    /**
     * index -Returns the list of all users [Test Method]
     *
     * @return string JSON
     */
    public function index()
    {
        $users = User::all();
        
        return response()->json(
            [
                'status' => 'success',
                'users' => $users->toArray()
            ],
            200
        );
    }


    /**
     * show - Sending the details of given user [Test Method]
     *
     * @param Request $request
     * @param integer $id
     * @return string JSON
     */
    public function show(Request $request, $id)
    {
        $user = User::find($id);
        
        return response()->json(
            [
                'status' => 'success',
                'user' => $user->toArray()
            ],
            200
        );
    }
}
