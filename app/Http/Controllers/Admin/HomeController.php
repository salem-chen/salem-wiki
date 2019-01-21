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
        $where    = [
            'parent_id' => $parentId,
            'status'    => 0
        ];

        $data = DB::table("technology")
            ->where($where)
            ->orderBy("order_sort",'desc')->get();

        return view('admin.index',['data'=>$data]);
    }
}
