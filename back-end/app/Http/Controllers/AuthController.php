<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Constants\UserTypes;
use App\Constants\Common;
use App\User;

class AuthController extends Controller
{
    /**
     * login - Handles the authentication of registered users
     *
     * @param Request $request
     * @return Response string JSON
     */
    public function login(Request $request)
    {
        try {
            $request->validate([
                'email' => 'email|required',
                'password' => 'required'
            ]);
            $credentials = request(['email', 'password']);
            if (!Auth::attempt($credentials)) {
                return response()->json(['status_code' => 200,'error'=> 1 , 'message' => 'Email or Password is incorrect']);
            }
            $user = User::where('email', $request->email)->first();
            if (!Hash::check($request->password, $user->password, [])) {
                throw new \Exception('Error in Login');
            }
            $tokenResult = $user->createToken('authToken')->plainTextToken;
            return response()->json([
                'status_code' => 200,
                'access_token' => $tokenResult,
                'token_type' => 'Bearer',
                'data' => $user
            ]);
        } catch (Exception $error) {
            return response()->json([
                'status_code' => 500,
                'message' => 'Error in Login',
                'error' => $error,
            ]);
        }
    }

    /**
     * guestLogin - Use to handle the guest login
     *
     * @param Request $request
     * @return string JSON
     */
    public function guestLogin(Request $request)
    {
        try {
            $request->validate([
                'dob' => 'required|date_format:Y-m-d|before:18 years ago',
            ]);

            /* Making a Fake Entry for guest user in user table making user to allow login */
            $userObj = new User();
            $userObj->first_name = "Guest";
            $userObj->last_name = "Guest";
            $userObj->email = "guest_" . date('Y_m_d_h_i_s') . "@guest.com";
            $userObj->password = Hash::make(Common::GUEST_DEFAULT_PASSWORD);
            $userObj->dob = $request->dob;
            $userObj->user_type = UserTypes::GUEST;
            $userObj->save();

            $credentials = ['email' => $userObj->email, 'password' => Common::GUEST_DEFAULT_PASSWORD];

            if (!Auth::attempt($credentials)) {
                return response()->json(['status_code' => 500, 'message' => 'Unauthorized']);
            }

            $user = User::where('email', $userObj->email)->first();

            if (!Hash::check(Common::GUEST_DEFAULT_PASSWORD, $user->password, [])) {
                throw new \Exception('Error in Login');
            }

            $tokenResult = $user->createToken('authToken')->plainTextToken;

            return response()->json([
                'status_code' => 200,
                'access_token' => $tokenResult,
                'token_type' => 'Bearer',
                'data' => $user
            ]);
        } catch (Exception $error) {
            return response()->json([
                'status_code' => 500,
                'message' => 'Error in Login',
                'error' => $error,
            ]);
        }
    }

    /**
     * register -Handles the Registration
     *
     * @param Request $request
     * @return string JSON
     */
    public function register(Request $request)
    {
        try {
            $request->validate([
                'title' => 'string',
                'first_name' => 'string',
                'last_name' => 'string',
                'email' => 'email|required|unique:users',
                'password' => 'required',
                'dob' => 'required|date_format:Y-m-d|before:18 years ago',
                'mobile' => 'string',
                'postcode' => 'string',
                'terms' => 'accepted'
            ]);

            /* creating a user and providing token to login at the same time */
            $userObj = new User();
            $userObj->title = $request->title;
            $userObj->first_name = $request->first_name;
            $userObj->last_name = $request->last_name;
            $userObj->email = $request->email;
            $userObj->password = Hash::make($request->password);
            $userObj->dob = $request->dob;
            $userObj->user_type = UserTypes::REGISTERED;
            $userObj->mobile = $request->mobile;
            $userObj->postcode = $request->postcode;
            $userObj->save();

            $credentials = request(['email', 'password']);

            if (!Auth::attempt($credentials)) {
                return response()->json(['status_code' => 500, 'message' => 'Unauthorized']);
            }

            $user = User::where('email', $userObj->email)->first();

            if (!Hash::check($request->password, $user->password, [])) {
                throw new \Exception('Error in Login');
            }

            $tokenResult = $user->createToken('authToken')->plainTextToken;

            return response()->json([
                'status_code' => 200,
                'access_token' => $tokenResult,
                'token_type' => 'Bearer',
                'data' => $user
            ]);
        } catch (Exception $error) {
            return response()->json([
                'status_code' => 500,
                'message' => "Some Error Occured: ".$error->getMessage(),
                'error' => $error,
            ]);
        }
    }

    /**
     * logout -handles logging out of the system
     *
     * @param Request $request
     * @return string JSON
     */
    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();

        return response()->json([
            'status' => 'success',
            'msg' => 'Logged out Successfully.'
        ], 200);
    }
}
