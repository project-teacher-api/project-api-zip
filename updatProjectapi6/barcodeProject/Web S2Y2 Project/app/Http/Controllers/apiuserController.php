<?php

namespace App\Http\Controllers;
use App\Models\pomodel;
use Illuminate\Http\Request;

class apiuserController extends Controller
{
    public function viewapi(Request $rq){
        $fdate=$rq->fromdate;
        $tdate=$rq->todate;
        $result=pomodel::where('date','>=',$fdate)
        ->where('date','<=',$tdate)
        ->get();
        return $result;
        // echo 1;
        //    return view('apiview.apirrach',['polist'=>$result]);
    }
    public function showapiuser(){
      $show= pomodel::get();
      return $show;
    }
}
