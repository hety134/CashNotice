<?php

namespace App\Admin\Controllers;

use App\Admin\Extensions\Tools\UserGender;
use App\Common\Functions;
use App\Events\UserEvent;
use App\File;
use App\Jobs\SendEmail;
use App\User;

use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Content;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\ModelForm;
use Illuminate\Http\Request;
use Event;
use Excel;

class UserController extends Controller
{
    use ModelForm;

    /**
     * Index interface.
     *
     * @return Content
     */
    public function index()
    {
        return Admin::content(function (Content $content) {

            $content->header('员工');
            $content->description('列表');

            $content->body($this->grid());
        });
    }

    /**
     * Edit interface.
     *
     * @param $id
     * @return Content
     */
    public function edit($id)
    {
        return Admin::content(function (Content $content) use ($id) {

            $content->header('header');
            $content->description('description');

            $content->body($this->form()->edit($id));
        });
    }

    /**
     * Create interface.
     *
     * @return Content
     */
    public function create()
    {
        return Admin::content(function (Content $content) {

            $content->header('header');
            $content->description('description');

            $content->body($this->form());
        });
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Admin::grid(User::class, function (Grid $grid) {

            $grid->id('ID')->sortable();
            $grid->name('用户名');
            $grid->email('邮箱');
            $grid->disableExport();
            $grid->disableActions();
            $grid->disableRowSelector();
            $grid->disableFilter();
            $grid->tools(function ($tools) {
                $tools->append(new UserGender());
            });

        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Admin::form(User::class, function (Form $form) {

            $form->display('id', 'ID');
            // 添加text类型的input框
            $form->text('name', '姓名')->help('姓名必须唯一');
            $form->text('email', '邮箱')->help('邮箱必须唯一');


            $form->display('created_at', 'Created At');
            $form->display('updated_at', 'Updated At');
        });
    }

    protected function getBatch()
    {
        return view("user.upload");
    }

    public function export(Request $request)
    {
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
                    $filePath = public_path().'/uploads/excel/' . $newName;
                    Event::fire(new UserEvent($filePath));

                    return redirect('/admin/batch')->with('message', '文件上传成功！');
                }
                return redirect('/admin/batch')->withErrors(['文件上传失败，请重试！']);

            }
        }
        return redirect('/admin/batch')->withErrors(['文件上传失败，请重试！']);
    }

    public function cash(){
        return view("user.cash");
    }

    public function sendEmail(Request $request){
        $file = $request->file("cash");
        if ($request->hasFile('cash')) {    // 检验一下是否有上传的文件.

            if ($file->isValid()) {     // 检验一下上传的文件是否有效.
                $clientName = $file->getClientOriginalName();
                $tmpName = $file->getFileName(); // 缓存在tmp文件夹中的文件名 例如 php8933.tmp 这种类型的.
                $realPath = $file->getRealPath();    // 这个表示的是缓存在tmp文件夹下的文件的绝对路径
                $entension = $file->getClientOriginalExtension(); //上传文件的后缀.
                $size = round($file->getSize() / 1024); // 文件大小

                $extension = $file->getClientOriginalExtension(); // 上传文件的后缀.
                if (!in_array($extension, ['xls', 'xlsx'])) {
                    return redirect('/admin/cash')->withErrors(['上传的excel文件必须为xls或xlsx类型！']);
                }
                $newName = date('YmdHis') . '.' . $entension;
                $path = $file->move(base_path() . '/public/uploads/excel/', $newName);

                if ($path) {
                    $filePath = public_path().'/uploads/excel/' . $newName;
                    $job = (new SendEmail($filePath))->onQueue("SendEmail");
                    $this->dispatch($job);

                    return redirect('/admin/cash')->with('message', '文件上传成功！');
                }
                return redirect('/admin/cash')->withErrors(['文件上传失败，请重试！']);

            }
        }
        return redirect('/admin/cash')->withErrors(['文件上传失败，请重试！']);
    }


}
