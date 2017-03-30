<?php
/**
 * Created by PhpStorm.
 * User: hsb
 * Date: 27-Nov-16
 * Time: 12:33 PM
 */

namespace App\Http\Controllers\System;

use Illuminate\Support\Facades\Mail;
use App\Http\Controllers\Controller;
use App\Models\News;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Http\JsonResponse;
use Tymon\JWTAuth\Facades\JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;
use Illuminate\Http\Exception\HttpResponseException;

class MailController extends Controller
{

    public function sendConfirmInfo(Request $request) {
        $data = $request->all();

        if(!empty($data)) {

            Mail::send('_confirm_info',  ['data'=>$data], function($message) use ($data)
            {
                $message->from(env('MAIL_USERNAME') , 'LightHouse');
                $message->to($data['email'], $data['name']);
                $message->subject($data['title']);
            });
        }

    }

    
}