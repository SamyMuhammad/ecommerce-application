<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\User;

class RegisterController extends Controller
{
    
	use ApiResponseTrait;

    public function __construct()
    {
        $this->middleware('guest');
    }


    /**
     * Register a new user.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function register()
    {
        $validator = $this->validator(request()->all());

        if ($validator->fails()) {
        	
        	return $this->errorResponse($validator->errors(), 400);
        }

        $this->create(request(['name', 'email', 'password']));

        return $this->successResponse('User has been registered successfully!');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\User
     */
    protected function create(array $data)
    {
        return User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'password' => bcrypt($data['password']),
        ]);
    }
}
