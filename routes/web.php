<?php

use App\Http\Controllers\logincontroller;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\productcontroller;
use App\Http\Controllers\SettingsController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('login');
});

Route::get('/sign', function () {
    return view('signup');
});
// Route::get('/index', function () {
//     return view('index');
// });
Route::get('/login',[logincontroller::class,'login']);

Route::get('/index',[productcontroller::class,'norder']);


Route::get('/products',[productcontroller::class,'showproduct']);

Route::get('/analytics', function () {
    return view('analytics');
});

Route::get('/notification',[productcontroller::class,"noti"]);

Route::get('/signup', function () {
    return view('signup');
});
Route::get('/logout', function () {
    echo "<script>";
    echo "alert('Are you sure you want to logout');";
    echo "</script>";

    return view('login');
});

Route::get('/add',[productcontroller::class,'categoryfetch']);
Route::get('/save',[productcontroller::class,'insert']);
Route::get('/rec',[productcontroller::class,'rorder']);
//Route::get('/submit',[productcontroller::class,'submit']);

// Route::get('/submit',function(){
//     return view('produtc');
// });

Route::get('/cake-menu', function () {
    return view('cakemenu');
});






