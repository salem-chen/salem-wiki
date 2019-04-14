@extends('layouts.master')
@section('content')

    <div class="row">
        <div class="layui-col-md12">

            <form class="layui-form" action="{{url('admin')}}" id="search-form">
                <div class="layui-inline">
                    <div class="layui-input-inline">
                        <input type="text" name="keyword" value="{{$param['keyword']}}"  placeholder="keyword"  class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <div class="layui-input-inline">
                        <select name="type_id" id="type_id">
                            <option value="">All types</option>
                            @foreach($types as $value)
                                <option value="{{$value->id}}" @if($param['type_id'] == $value->id) selected @endif>{{$value->name}} {{$value->name_zh}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <div class="layui-input-inline">
                        <button class="layui-btn" lay-filter="formDemo">搜索</button>
                        <a href="{{url('admin')}}" class="layui-btn layui-btn-primary">重置</a>
                        <input type="hidden" name="parent_id" value="{{$param['parent_id']}}"/>
                    </div>
                </div>
            </form>
        </div>

    </div>
    <div class="row">
        <div class="layui-col-md12">
            <table class="layui-table">
                <colgroup>
                    <col width="150">
                    <col width="200">
                    <col>
                </colgroup>
                <thead>
                <tr>
                    <th width="10%">ID</th>
                    <th  width="23%">名称</th>
                    <th width="17%">类型</th>
                    <th width="20%">进度</th>
                    <th width="15%">排序</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                @if(!count($data))
                    <tr>
                        <td colspan="6" align="center">
                            <br/>
                                <h3>~_~ No Data</h3>
                            <br/>
                        </td>
                    </tr>
                @endif
                @foreach($data as $key=>$value)
                    <tr>
                        <td>{{$value->id}}</td>
                        <td>
                            <a href="{{url('admin')}}?parent_id={{$value->id}}">{{$value->name}}</a>
                            {{$value->name_zh}}
                        </td>
                        <td>{{$value->type_name}}</td>
                        <td></td>
                        <td>{{$value->order_sort}}</td>
                        <td>
                            <a href="">删除</a>
                            <a href="">编辑</a>
                        </td>
                    </tr>
                @endforeach
                </tbody>
            </table>
        </div>
    </div>

    <div class="row">
        <div  class="layui-col-md6">&nbsp;</div>
        <div  class="layui-col-md6">
            {{ $data->appends($param)->links() }}
        </div>
    </div>

@endsection
<style type="text/css">
    .pagination {}
    .pagination li{float: left;margin: 2px;}
    .pagination li a{padding: 8px;}

</style>





