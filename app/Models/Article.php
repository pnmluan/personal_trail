<?php 
namespace App\Models;
  
use App\Models\BaseModel;
use Illuminate\Database\Eloquent\Model;
  
class Article extends BaseModel
{
    protected $table = 'articles'; 
    protected $fillable = ['title', 'content', 'author_id', 'categories_id', 'publish_date', 'status','created_at', 'updated_at'];

    public function getModelValidations()
    {
        return [
            // 'full_name' => 'required|string|' //. $this->getUniqueValidatorForField('full_name')
        ];
    }

    public static function listItems(array $param = null){

        $aColumns = ['articles.title', 'category_id', 'categories.name', 'articles.content', 'articles.author_id', 'articles.publish_date'];

        $query = \DB::table('articles')
            ->select(\DB::raw('SQL_CALC_FOUND_ROWS articles.id'),\DB::raw('articles.id AS DT_RowId'),'articles.*', \DB::raw('categories.name AS categories_name')
            	// , 'pictures.name', 'pictures.url', 'pictures.email', 'pictures.requirement'
            	)
            ->leftJoin('categories', 'articles.category_id', '=', 'categories.id');
            // ->leftJoin('pictures', 'articles.id', '=', 'pictures.article_id');

        // Filter search condition
        foreach ($aColumns as $key => $value) {
            (isset($param[$value]) && $param[$value]) && $query->where($value,'like','%'.$param[$value].'%');
        }

        if(isset($param['except_id'])) {
            $query->where('articles.id','!=', $param['except_id']);
        }

        //======================= SEARCH =================
        if(isset($param['columns'])) {
            $sWhere = "";
            $count = count($aColumns);
            if(isset($param['search']) && $param['search']['value']){
                $keyword = '%'. $param['search']['value'] .'%';
                for($i=0; $i<$count; $i++){
                    $requestColumn = $param['columns'][$i];
                    if($requestColumn['searchable']=='true'){
                        
                        $sWhere .= $aColumns[$i].' LIKE "'.$keyword.'" OR ';
                    }
                }
                $sWhere = substr_replace( $sWhere, "", -4 );
            }
            /* Individual column filtering */
            for($i=0; $i<$count; $i++){
                $requestColumn = $param['columns'][$i];
                if ($requestColumn['searchable']=="true" && $requestColumn['search']['value'] != '' ){
                    if ($sWhere == "" ){
                        $sWhere = "WHERE ";
                    }else{
                        $sWhere .= " AND ";
                    }
                    $sWhere .= $aColumns[$i]." LIKE '%".mysql_real_escape_string($requestColumn['search']['value'])."%' ";
                }
            }

            if($sWhere != ""){
                $query->where(\DB::raw($sWhere));
            }
        }

        //======================= Ordering =================
        // $sOrder = '';
        // if (isset($param['order']) && count($param['order'])){
        // 	for ($i=0 ; $i<count($param['order']); $i++){
        // 		$columnIdx = intval($param['order'][$i]['column']);
        // 		$requestColumn = $param['columns'][$columnIdx];
        // 		if($requestColumn['orderable']=='true'){
        // 			$sOrder .= $aColumns[$columnIdx]." ". $param['order'][$i]['dir'] .", ";
        // 		}
        // 	}
        // 	$sOrder = substr_replace( $sOrder, "", -2 );
        // 	$sOrder && $query->orderBy(\DB::raw($sOrder));
        // }
        //======================= Paging =================
        (isset($param['start']) && $param['length']!=-1) && $query->limit($param['length'])->offset($param['start']);

        // $query = preg_replace('# null#', '', $query);

        $data = $query->get();

        // Add pictures 
        foreach ($data as $key => $value) {
            $album = \DB::table('pictures')->where('article_id', $value->id)->get();
            $data[$key]->album = $album;
        }

        \DB::setFetchMode(\PDO::FETCH_ASSOC);
        $total = \DB::select('SELECT FOUND_ROWS() as rows');


        $draw = 0;
        if(isset($param['draw'])) {
            $draw  = $param['draw'];
        }

        return [
            'draw' => $draw,
            'data' => $data,
            'recordsTotal' => $total[0]['rows'],
            'recordsFiltered' => $total[0]['rows'],
        ];
    }
}
?>