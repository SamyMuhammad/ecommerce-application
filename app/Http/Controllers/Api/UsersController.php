<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class UsersController extends Controller
{
    use ApiResponseTrait;

    
    public function get()
    {
    	$user = auth('api')->user();
    	
    	$data = [
    		'name' => $user->name,
    		'email' => $user->email
    	];

    	return $this->dataResponse($data);
    }


    public function update(Request $request)
    {
    	$validator = Validator::make($request->all(), [
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users,email,'.auth('api')->id()],
            'password' => ['sometimes', 'nullable', 'string', 'min:8', 'confirmed'],
        ]);

        if ($validator->fails()) {
        	
        	return $this->errorResponse($validator->errors(), 400);
        }

        $user = auth('api')->user();
        $input = $request->except('password', 'password_confirmation');

        if (! $request->filled('password')) {
            $user->fill($input)->save();

            return $this->successResponse('Profile updated successfully!');
        }

        $user->password = bcrypt($request->password);
        $user->fill($input)->save();
        
        return $this->successResponse('Profile updated successfully!');        
    }
}
