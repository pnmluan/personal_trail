<?php

namespace App\Http\Controllers\System;

use App\Http\Controllers\Controller;
use App\Models\Slide;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Http\JsonResponse;
use Tymon\JWTAuth\Facades\JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;
use Illuminate\Http\Exception\HttpResponseException;

class SlideController extends Controller
{
    private $path = 'backend/assets/apps/img/slides';
    /**
     * Get info users base on params
     *
     * @param \Illuminate\Http\Request $request
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request){
        if(isset($request['has_data_table']) && $request['has_data_table']) {
            $data = Slide::listItems($request->all());
        return $data;
        } else {
            return new JsonResponse([
                'message' => 'list_data',
                'data' => Slide::all()
            ]);
        }

    }

    /**
     * Get authenticated user.
     *
     * @return \Illuminate\Http\Response
     */
    public function show($id) {

        $model  = Slide::find($id);

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

    protected function uploadImage($image) {
        if($image) {
            $filename  = time() . '.' . $image->getClientOriginalExtension();

            $destinationPath = $this->path; // upload path

            $image->move($destinationPath, $filename); // uploading file to given path

            return $filename;
        }
        return null;

    }

    /**
     * Create/Update record into DB.
     *
     * @return JsonResponse
     */
    public function save(Request $request, $id = null){
        $data = $request->all();
        $filepath = $this->uploadImage($request->file('filepath'));

        if(!empty($id)) {

            $model = Slide::find($id);
            if (!$model) {
                return new JsonResponse([
                    'message' => 'no_data',
                ]);
            }
            if($filepath) {
                $filename = $this->path . '/' . $banner->filepath;
                if(file_exists($filename)) {
                    unlink($filename);
                }
                $data['filepath'] = $filepath;
            }

            
        } else {
            $model = new Slide();
            
            if($filepath) {
                $data['filepath'] = $filepath;
            }
        }
        

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

        $model  = Slide::find($id);
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
