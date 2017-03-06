<?php

namespace App\Http\Controllers\System;

use App\Http\Controllers\Controller;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Http\JsonResponse;
use Tymon\JWTAuth\Facades\JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;
use Illuminate\Http\Exception\HttpResponseException;

class CategoryController extends Controller
{
    /**
     * Get info users base on params
     *
     * @param \Illuminate\Http\Request $request
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request){

        $data = Category::listItems($request->all());
        return $data;

    }

    /**
     * Get authenticated user.
     *
     * @return \Illuminate\Http\Response
     */
    public function show($id) {

        $categoryTicket  = CategoryTicket::find($id);

        if (!empty($categoryTicket)) {
            return new JsonResponse([
                'status' => 'error',
                'message' => 'no_data',
            ]);
        }

        return new JsonResponse([
            'status' => 'success',
            'message' => 'get_detail',
            'data' => $categoryTicket
        ]);

    }

    /**
     * Create/Update record into DB.
     *
     * @return JsonResponse
     */
    public function save(Request $request, $id = null){
        if(!empty($id)) {
            $model = Category::find($id);

            if (!$model) {
                return new JsonResponse([
                    'status' => 'error',
                    'message' => 'no_data',
                ]);
            }
        } else {
            $model = new Category();
        }
        
        $data = $request->all();

        $model->fill($data);

        if (!$model->isValid()) {
            return new JsonResponse([
                'status' => 'error',
                'message' => 'invalid',
                'error' => $model->getValidationErrors()
            ]);
        }
        try {
            $model->save();
        } catch (\Exception $ex) {
            return new JsonResponse([
                'status' => 'error',
                'message' => 'exception',
                'error' => $ex->getMessage()
            ]);
        }
        return new JsonResponse([
            'status' => 'success',
            'message' => 'created',
            'data' => $model
        ]);
    }

    /**
     * Remove record into DB.
     *
     * @return JsonResponse
     */
    public function delete($id){

        $model  = Category::find($id);
        if (!$model) {
            return new JsonResponse([
                'status' => 'error',
                'message' => 'no_data',
            ]);
        }
        try {
            if (!$model->delete()) {
                return new JsonResponse([
                    'status' => 'error',
                    'message' => 'exception',
                    'error' => 'can not delete'
                ]);
            }
        } catch (\Exception $ex) {
            return new JsonResponse([
                'status' => 'error',
                'message' => 'exception',
                'error' => $ex->getMessage()
            ]);
        }
        return new JsonResponse([
            'status' => 'success',
            'message' => 'created',
            'rercord_id' => $id
        ]);
    }

   
}
