@extends('admin::index')

@section('content')
    <div class="box box-info">
        <div class="box-header with-border">
            <h3 class="box-title">操作指南</h3>

            <div class="box-tools">

            </div>
        </div>
        <!-- /.box-header -->
        <!-- form start -->
        <div class="box-body">
            <pre>
                 <code>
                     ## 1.修改密码，在右上角点击名称-设置，进行初始密码修改
                     ## 2.员工添加：管理员-员工管理
                     ### 2.1 单个添加，输入姓名邮箱即可
                     ### 2.2 批量导入，上传excel文件，格式参照下方
                     <div style="margin-left: 150px;">
                         <table border="1" >
                         <tr>
                             <td>姓名 </td>
                             <td>邮箱 </td>
                         </tr>
                         <tr>
                             <td>马晓腾 </td>
                             <td>10001@qq.com </td>
                         </tr>
                     </table>
                     </div>
                     ## 3.工资文件导入：管理员-工资邮件发送，按照要求上传excel文件，默认处理完成，自动删除上传文件
                     <div style="margin-left: 150px;">
                         <table border="1" >
                         <tr>
                             <td>序号</td>
                             <td>姓名</td>
                             <td>****</td>

                         </tr>
                         <tr>
                             <td>8月</td>
                             <td>张三 </td>
                             <td>****</td>

                         </tr>
                     </table>
                     </div>
                     ## 4.上传文件管理：为上传的文件目录，可进行删除

                 </code>
            </pre>
        </div>
    </div>
@endsection
