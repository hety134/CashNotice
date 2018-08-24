<html>
<head>
    <meta charset="UTF-8">
    <meta name="applicable-device" content="mobile">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=0,maximum-scale=1">
    <meta name="format-detection" content="telephone=no"/>
    <meta content="yes" name="mobile-web-app-capable">
    <meta content="yes" name="apple-mobile-web-app-capable"/>
    <meta name="robots" content="all"/>
    <link rel="stylesheet" href="{{asset("vendor/laravel-admin/AdminLTE/bootstrap/css/bootstrap.min.css")}}">
    <link rel="stylesheet" href="{{ asset("vendor/laravel-admin/AdminLTE/dist/css/AdminLTE.min.css") }}">
    <title></title>
</head>
<body>
<div class="row">
    <div class="col-xs-12">
        <div class="box">
            <div class="box-body table-responsive no-padding">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        @foreach($title as $item)
                            <td>{{ is_null($item)?"":$item }}</td>
                        @endforeach
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        @foreach($content as $value)
                            <td>{{ is_null($value)?"":$value }}</td>
                        @endforeach
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

</body>
</html>