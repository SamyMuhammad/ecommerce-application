<?php

namespace App\Http\Controllers\API;

trait ApiResponseTrait
{
	/**
	* Return an error.
	*
	*/
	public function errorResponse($msg = "", $code = 401)  // 401 unauthorized | unauthenticated
	{
		return response()->json([
			'status' => false,
			'code' => $code,
			'msg'	 => $msg
		]);
	}

	/**
	* Return a success message without need to return data.
	*
	*/
	public function successResponse($msg = "", $code = 200)
	{
		return response()->json([
			'status' => true,
			'code' => $code,
			'msg'	 => $msg
		]);
	}

	/**
	* Return the demanded data.
	*
	*/
	public function dataResponse($data, $code = 200)
	{
		return response()->json([
			'status' => true,
			'code' => $code,
			'data'	 => $data
		]);
	}
}