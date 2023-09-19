<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\profileupdate;
use App\Http\Controllers\addprodustController;
use App\Http\Controllers\barcodeController;
use App\Http\Controllers\dashboardController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/add_product', function () {
    return view('add_product');
});
Route::get('/index', function () {
    return view('index');
})->name('index');
// add login for admin
// Route::get('/dashboard', function () {
//     return view('index');
// })->middleware(['auth', 'verified'])->name('dashboard');
Route::get('/dashboard',[dashboardController::class,'dashboardcontrol'])->middleware(['auth', 'verified'])->name('dashboard');
// new admin
Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
    // create a new profile for encrypting
Route::get('/profileupdate', [ProfileController::class, 'showprofile'])->name('user.profile');
Route::post('/profileupdate', [ProfileController::class, 'storedataupdate'])->name('user.profile');
// create product in
// delect profile for image
Route::get('/select-profile', [ProfileController::class, 'fundelectprofile']);
Route::delete('/delete-profile', [ProfileController::class, 'delectprofile'])->name('profile.destroy.image');
// new file for create now
Route::get('/addprodust',[addprodustController::class,'createprodust'])->name('addprodust');
// delect profile for image
Route::post('/addcategory',[addprodustController::class,"dbpostinsert"]);
Route::get('/showprodust',[addprodustController::class, 'funshowprodust'])->name("showprodust");
// for edit product for
Route::POST('/update',[addprodustController::class,"funedite"]);
// delect produst
Route::post('/del',[addprodustController::class,"fundelproduct"]);
// view barcode in controller
Route::get('/barcodeview',[barcodeController::class,'barcodeview'])->name('namebacode');
Route::post('/searchproduct',[barcodeController::class,'funbarcode']);
Route::post('/saveproduct',[barcodeController::class,'funsavebarcode']);
// view barcode in
Route::get('/search',[barcodeController::class,'searchfun']);
Route::post('/date',[barcodeController::class,'searchfunexcate']);
// view product in laravel
Route::get('/view',[barcodeController::class,'viewpro']);
// admin do=

});

require __DIR__ . '/auth.php';

Route::get('/',[profileupdate::class,'funregister']);
// the
// log in now
Route::get('/login',[profileupdate::class,'funlogin'])->name('login');
Route::get('/test', function () {
    return view('auth.register');
});




