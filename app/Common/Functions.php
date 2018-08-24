<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 2017/6/26
 * Time: 10:38
 */

namespace App\Common;


use App\Http\Model\Menu;
use App\Http\Model\Users;
use Auth;
use Illuminate\Support\Facades\DB;
use Request;

class Functions
{
    public static function ajaxReturn($code, $msg, $request = '')
    {
        $data = [
            'code' => $code,
            'msg' => $msg,
            'request' => $request
        ];
        return json_encode($data);
    }

    /**
     * 删除指定目录下文件
     * @param $path
     * @return bool
     */
    public static function delFile($path){
        //查看文件是否存在
        if(is_file($path)){
            $result = unlink($path);
            return $result;
        }
        return false;
    }

}