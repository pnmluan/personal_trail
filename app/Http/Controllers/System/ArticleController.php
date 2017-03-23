<?php

namespace App\Http\Controllers\System;

use App\Http\Controllers\Controller;
use App\Models\Article;
use App\Models\Tag;
use App\Models\ArticleTag;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Http\JsonResponse;
use Tymon\JWTAuth\Facades\JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;
use Illuminate\Http\Exception\HttpResponseException;

class ArticleController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->table = 'articles';
        $this->columns = \DB::getSchemaBuilder()->getColumnListing($this->table);
    }

    /**
     * Get info users base on params
     *
     * @param \Illuminate\Http\Request $request
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request){
        $params = $request->all();
        if(isset($request['has_data_table']) && $request['has_data_table']) {
            $data = Article::listItems($params);
            return $data;
        } else {

            $columns  = $this->columns;

            $limit          = 5000;
            $offset         = 0;

            $alias = 'MT';
            $alias_dot = $alias . '.';
            $select         = $alias_dot . '*';
            $query = \DB::table($this->table . ' AS ' . $alias)
                        ->select($select, \DB::raw('users.name as author_name'))
                        ->leftJoin('users', 'users.id', '=', $alias_dot . 'author_id');
            /*==================================================
             * Filter Data
             *==================================================*/
            foreach ($columns as $field) {
                if(isset($params[$field]) || !empty($params[$field])){
                    if(is_array($params[$field])){
                        $query->where($alias_dot . $field, 'IN', $params[$field]);
                    }else{
                        switch ($field) {
                            case 'status':
                                $query->where($alias_dot . $field, '=', $params[$field]);
                                break;
                            default:
                                $query->where($alias_dot . $field, 'LIKE', '%' . $params[$field] . '%');
                                break;
                        }
                    }
                }
            }

            /*==================================================
             * Limit & Offset
             *==================================================*/
            $limit = (isset($params['limit']) || !empty($params['limit']))?$params['limit']:$limit;
            $offset = (isset($params['offset']) || !empty($params['offset']))?$params['offset']:$offset;


            /*==================================================
             * Process Query
             *==================================================*/
            $query->limit($limit)->offset($offset);
            $data = $query->get()->toArray();

            // Add pictures & tags
            if(!empty($data)) {
                foreach ($data as $key => $value) {
                    $pictures = \DB::table('pictures')->where('article_id', $value->id)->get();
                    $data[$key]->pictures = $pictures;
                }

                $tags = \DB::table('tags')
                    ->leftJoin('article_tags', 'article_tags.tag_id', '=', 'tags.id')
                    ->where('article_tags.article_id', $value->id)->get();
                $data[$key]->tags = $tags;
            }
            
            $total_data = count($data);

            /*==================================================
             * Update number of viewers
             *==================================================*/
            if(isset($params['is_count_viewers']) && !empty($params['is_count_viewers']) && 
                isset($params['clean_url']) && !empty($params['clean_url'])) {
                Article::where('clean_url', '=', $params['clean_url'])->increment('views');
            }

            /*==================================================
             * Response Data
             *==================================================*/
            return new JsonResponse([
                'message' => 'list_data',
                'total' => $total_data,
                'data' => $data
            ]);
        }

    }

    /**
     * Get most popular posts.
     *
     * @return \Illuminate\Http\Response
     */
    public function getPopularPosts() {

        $data  = Article::orderBy('views', 'DESC')->limit(3)->get();

        if (empty($data)) {
            return new JsonResponse([
                'message' => 'no_data',
            ]);
        }

        return new JsonResponse([
            'message' => 'get_popular_posts',
            'data' => $data
        ]);

    }

    /**
     * Get authenticated user.
     *
     * @return \Illuminate\Http\Response
     */
    public function show($id) {

        $model  = Article::where('clean_url', '=', $id)->firstOrFail();

        if (empty($model)) {
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
        $data = $request->all();
        $author = JWTAuth::parseToken()->authenticate();
        if(!empty($id)) {
            $model = Article::find($id);
            $data['updated_user_id'] = $author->id;
            
            if(isset($data['article_tags']) && !empty($data['article_tags'])) {
                // Remove all tags with article_id
                ArticleTag::where('article_id', '=', $id)->delete();

                // Add new article_tags
                foreach ($data['article_tags'] as $tag) {
                    if(!empty($tag)) {
                        ArticleTag::create(['article_id' => $id, 'tag_id' => $tag]);
                    }
                }
            }

            if (!$model) {
                return new JsonResponse([
                    'message' => 'no_data',
                ]);
            }
        } else {
            $model = new Article();
            $data['publish_date'] = date('Y-m-d');
            $data['author_id'] = $author->id;
        }
        
        $data['clean_url'] = $this->toAscii($data['title']);
        
        $model->fill($data);

        if (!$model->isValid()) {
            return new JsonResponse([
                'message' => 'invalid',
                'error' => $model->getValidationErrors()
            ]);
        }
        try {
            $model->save();
            if(empty($id)) {
                // Add new article_tags
                foreach ($data['article_tags'] as $tag) {
                    if(!empty($tag)) {
                        ArticleTag::create(['article_id' => $model->id, 'tag_id' => $tag]);
                    }
                }

            }
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

        $model  = Article::find($id);
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
