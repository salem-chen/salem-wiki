<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use DB;
use App\Http\Requests;
use App\Http\Controllers\Controller;

class HomeController extends AdminBaseController
{
    //
    public function index(){

        $parentId = request('parent_id',0);
        $keyword  = request('keyword','');
        $typeId   = request('type_id');

        $where    = [
            ['technology.status',   '=',0],
            ['technology.parent_id','=',$parentId],
        ];

        if($keyword){
            $where[] = ['technology.name','like',"%{$keyword}%"];
        }
        if($typeId){
            $where[] = ['technology.type_id','=',$typeId];
        }

        $data = DB::table("technology")
             ->select('technology.*',"technology_type.name as type_name")
            ->leftJoin("technology_type",'technology.type_id',"=","technology_type.id")
            ->where($where)
            ->orderBy("technology.order_sort",'desc')->paginate(15);

        $types = DB::table("technology_type")
                ->orderby("order_sort","desc")
                ->get();

        $return = [
            'data'    => $data,
            'types'   => $types,
             'param' => [
                 'keyword' => $keyword,
                 'type_id' => $typeId,
                 'parent_id' => $parentId
             ],
        ];

        return view('admin.index',$return);
    }
}

