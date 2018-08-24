<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Log;
use Excel;

class UserController extends Controller
{
    public function export(Request $request){
        $file = $request->file("file");
        if ($request->hasFile('file')) {    // 检验一下是否有上传的文件.

            if ($file->isValid()) {     // 检验一下上传的文件是否有效.
                $clientName = $file->getClientOriginalName();
                $tmpName = $file->getFileName(); // 缓存在tmp文件夹中的文件名 例如 php8933.tmp 这种类型的.
                $realPath = $file->getRealPath();    // 这个表示的是缓存在tmp文件夹下的文件的绝对路径
                $entension = $file->getClientOriginalExtension(); //上传文件的后缀.
                $size = round($file->getSize() / 1024); // 文件大小

                $extension = $file->getClientOriginalExtension(); // 上传文件的后缀.
                if (!in_array($extension, ['xls', 'xlsx'])) {
                    return redirect('/admin/batch')->withErrors(['上传的excel文件必须为xls或xlsx类型！']);
                }
                $newName = date('YmdHis') . '.' . $entension;
                $path = $file->move(base_path() . '/public/uploads/excel/', $newName);

                if ($path) {
                    $filePath = 'uploads/excel/' . $newName;

                    Excel::load($filePath,function ($reader){

                        $data=$reader->toArray();
                        dd($data);
                    });

                    return redirect('/admin/employee')->with('message', '文件上传成功！');
                }
                return redirect('/admin/batch')->withErrors(['文件上传失败，请重试！']);

            }
        }
        return redirect('/admin/batch')->withErrors(['文件上传失败，请重试！']);
    }
}
