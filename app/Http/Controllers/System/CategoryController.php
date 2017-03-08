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
     * Get info users for datatables
     *
     * @param \Illuminate\Http\Request $request
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request){

        if(isset($request['has_data_table']) && $request['has_data_table']) {
            $data = Category::listItems($request->all());
            return $data;
        } else {
            return new JsonResponse([
                'message' => 'list_data',
                'data' => Category::all()
            ]);
        }
        

    }

    /**
     * Get authenticated user.
     *
     * @return \Illuminate\Http\Response
     */
    public function show($id) {

        $model  = Category::find($id);

        if (!empty($model)) {
            return new JsonResponse([
                'message' => 'no_data',
            ]);
        }

        return new JsonResponse([
            'message' => 'get_detail',
            'data' => $model
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
                'message' => 'invalid',
                'error' => $model->getValidationErrors()
            ]);
        }
        try {
            $model->save();
        } catch (\Exception $ex) {
            return new JsonResponse([
                'message' => 'exception',
                'error' => $ex->getMessage()
            ]);
        }
        return new JsonResponse([
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
                'message' => 'no_data',
            ]);
        }
        try {
            if (!$model->delete()) {
                return new JsonResponse([
                    'message' => 'exception',
                    'error' => 'can not delete'
                ]);
            }
        } catch (\Exception $ex) {
            return new JsonResponse([
                'message' => 'exception',
                'error' => $ex->getMessage()
            ]);
        }
        return new JsonResponse([
            'message' => 'created',
            'rercord_id' => $id
        ]);
    }

   
}
