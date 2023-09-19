<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use App\Models\Flight;
use Illuminate\Http\Request;

class dashboardController extends Controller
{
    public function dashboardcontrol(){
        $getdata=Flight::select()->get();
        $tblpo= DB::table('tblpo')->select('poid','pocode','date','dis','tax','total','grantotal')->get();
      $data=[
    'showview'=>$getdata,
    'tblpoview'=>$tblpo,
      ];
        // $tblproduct= DB::table('tblproduct')->select('proid')->get()->count();
        // // $tblproductprice= DB::table('tblproduct')->select('price')->get()->count();
        // $data=[
        // 'tablesale'=>  $tblproduct
        // ];
        return view('index',$data);
    }
}
