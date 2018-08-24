@extends('admin::index')

@section('content')
    <div class="box box-info">
        <div class="box-header with-border">
            <h3 class="box-title">员工上传</h3>

            <div class="box-tools">

            </div>
        </div>
        <!-- /.box-header -->
        <!-- form start -->
        <form action="/admin/export" method="post" accept-charset="UTF-8" class="form-horizontal"
              enctype="multipart/form-data" >
            @if(Session::has('message'))
                <div class="alert alert-info"> {{Session::get('message')}}
                </div>
            @endif
            <div class="box-body">

                <div class="fields-group">

                    <div class="form-group  ">

                        <label for="path" class="col-sm-2  control-label">员工文件上传</label>

                        <div class="col-sm-8">


                            <input type="file" class="path" name="file"
                                   accept="application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,text/csv">

                            <span class="help-block">
                            <i class="fa fa-info-circle"></i>&nbsp;文件格式为excel格式
                        </span>
                        </div>
                    </div>
                    <div class="form-group">
                        @if (count($errors) > 0)
                            <div class="alert alert-danger">
                                <ul>
                                    @foreach ($errors->all() as $error)
                                        <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                        @endif
                    </div>


                </div>

            </div>
            <!-- /.box-body -->
            <div class="box-footer">

                {{ csrf_field() }}
                <div class="col-md-2">

                </div>
                <div class="col-md-8">

                    <div class="btn-group pull-right">
                        <button type="submit" class="btn btn-info pull-right"
                                data-loading-text="<i class='fa fa-spinner fa-spin '></i> 提交">提交
                        </button>
                    </div>

                    <div class="btn-group pull-left">
                        <button type="reset" class="btn btn-warning">重置</button>
                    </div>

                </div>

            </div>

            <!-- /.box-footer -->
        </form>
    </div>
@endsection
@section("page_js")

@endsection