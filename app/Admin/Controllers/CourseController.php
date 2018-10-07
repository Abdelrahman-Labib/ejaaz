<?php

namespace App\Admin\Controllers;

use App\Course;
use App\Video;

use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Content;
use App\Http\Controllers\Controller;
use App\User;
use App\Category;
use Encore\Admin\Controllers\ModelForm;
use Illuminate\Support\Facades\Storage;

class CourseController extends Controller
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

            $content->header('header');
            $content->description('description');

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
        return Admin::grid(Course::class, function (Grid $grid) {

            $grid->id('ID')->sortable();
            $grid->title('Title')->sortable();
            $grid->img('Profile Picture')->display(function ($img) {
                $url= Storage::url($img);
                return "<img src='{$url}' alt='Profile Picture' width='75' height='75' />";
            });

            $grid->user_id('Username')->display(function($userId) {
                return User::find($userId)->name;
            });
            $grid->category_id('Categories')->display(function($categoryId) {
                return Category::findOrFail($categoryId)->name;
            });
            $grid->type('Type')->display(function($typeId) {
                if($typeId == 0){
                    return "<span class='label label-warning'>Trainee</span>";
                }else{
                    return "<span class='label label-warning'>Trainer</span>";
                }
                return User::find($typeId)->type;
            });

            $grid->videos('No. of Videos')->display(function ($video) {
                $count = count($video);
                return "<span class='label label-warning'>{$count}</span>";
            });

            $grid->joint_users('No. of People')->display(function ($people) {
                $count = count($people);
                return "<span class='label label-warning'>{$count}</span>";
            });

            $grid->created_at();
            $grid->updated_at();
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Admin::form(Course::class, function (Form $form) {

            // $form->display('id', 'ID');
            $form->text("title", "Title")->rules('required');
            $form->select("user_id", "Owner")->options(User::all()->pluck('name', 'id'));
            $form->select("category_id", "Category")->options(Category::all()->pluck('name', 'id'));
            $Type= Array(1 => "In Door",2 => "Online");
            $form->select("type")->options($Type)->rules('required');
            $form->image("img", "Image")->rules('nullable');

            $form->textarea("description", "Description")->rules('required');
            $form->text("address")->rules('required_if:type,==,1', [
                'required_if' => 'Required in in door courses'
            ])->help('Required only in in door courses.');
            $form->file("video", "Introduction Video");
            $form->currency("price", "Price")->symbol('$')->rules('required')->help('Put 0 if you want the course to be for free.');

            $form->divide();

            $form->hasMany('videos', function (Form\NestedForm $form) {
                $form->text('Title');
                $form->textarea("description")->rules('required');
                $form->file("video", "Video");
            });

            $form->display('created_at', 'Created At');
            $form->display('updated_at', 'Updated At');
        });
    }
}
