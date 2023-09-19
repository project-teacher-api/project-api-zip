<?php

namespace App\Http\Controllers;
use App\Models\category;
use App\Models\leaderproduct;
use Illuminate\Http\Request;
use App\Models\pomodel;
use App\Models\taxmoel;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;
use function PHPUnit\Framework\returnCallback;


class barcodeController extends Controller
{
    public function barcodeview(){
        $getcategory=category::get();
        $tbpro=leaderproduct::get();
        $data=[
        'pushview'=>$getcategory,
        'proview'=>$tbpro,
        ];
        return view('barcodeproduct.addbarcode',$data);
    }
    public function funbarcode(Request $request){
    $txtcode=$request->pushcontroller;
    $dbresurt= leaderproduct::where('barcode',$txtcode)->first();
    if(isset($dbresurt)){
        $proid=$dbresurt->proid;
        $proname=$dbresurt->title;
        echo $proid.";".$proname;
    }else{
        echo 0;
    }

    }
  // create function for route in controller
  public function searchfun(){
    $result=pomodel::get();
  //  echo $result;
     return view('reportdata.report',['polist'=>$result]);
    // return view('reportdata.report');
  }
  public function searchfunexcate(Request $rq){
    // $dbexcateto=$rq->datepushto;
    // $dbexcateform=$rq->datepushform;
    $dbexcateto=$rq->input('txtfdate');
    $dbexcateform=$rq->input('txttodate');
   // echo $dbexcateto;
   if(isset($dbexcateto) OR isset($dbexcateform)){
    $result=pomodel::where('date','>=',$dbexcateto)
    ->where('date','<=',$dbexcateform)
    ->get();
   }else{
    $result = PoModel::get();
   }
   return view('reportdata.report',['polist'=>$result]);
  }
  // new page in controller
 public function funsavebarcode(Request $request){
    $date=$request->podate;
    $barcode=$request->txtpocorde;
    $dicount=$request->txtdicount;
    $tax=$request->txttax;
    $txtgrand=$request->txtgrand;
    $txttotal=$request->txttotal;
    $prid=$request->prid;
    $qty=$request->qty;
    $cost=$request->cost;
 $id=   pomodel::insertGetId([
        'pocode'=>$barcode,
        'date'=>$date,
        'dis'=>$dicount,
        'tax'=>$tax,
        'total'=>$txttotal,
        'grantotal'=>$txtgrand,
    ]);
    $poid = $id;
 $data = array();
 for($i=0; $i<count($prid); $i++){
     $data= array('poid'=>$poid,'proid'=>$prid[$i],'qty'=>$qty[$i],'cost'=>$cost[$i]);
     DB::table('tblpodetail')->select('poid','proid','qty','cost')->insert($data);
 }
 echo 1;
 }
// view all product
public function viewpro(){
    $tblpo= DB::table('tblpo')->select('poid','pocode','date','dis','tax','total','grantotal')->get();
    $tblpodetailview = DB::table('tblpodetail')->select('pdetail','poid','proid','qty','cost')->get();
    $data=[
   'tblpoview'=>$tblpo,
   'tblpodetail'=> $tblpodetailview
    ];
    return view('viewproductall.pro',$data);
}
}
