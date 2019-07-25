<?php

namespace App\Http\Controllers\admin;
use Illuminate\Http\Request;
use App\Models\tbl_episodes;
use App\Models\tbl_about_us;
use App\Models\tbl_event_details;

class AboutController extends BaseController  
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

   public function index(Request $req)
    {
      $data['data'] = tbl_about_us::where('id', '1')->get()->first();
       return view('admin/about_us', $data);
    } 

    public function episodes(Request $req)
    {
      $data['data'] = tbl_episodes::where('id', '1')->get()->first();
       return view('admin/episodes', $data);
    } 


    public function event(Request $req)
    {
       $data['data'] = tbl_event_details::where('id', '1')->get()->first();
       return view('admin/event', $data);
    } 

    public function edit_episodes(Request $request)
    {
        $postedData = $request->all();
        unset($postedData['_token']);
        $recourd = tbl_episodes::where('id', '1')->update($postedData);
        if($recourd){
             $request->session()->flash('success', '<div class="alert alert-success" id="success-alert">
                                 <button type="button" class="close" data-dismiss="alert">x</button>
                            <strong>Success! </strong><b>Records has successfully Save.</b>
                                  </div>');
                return redirect('/episodes');
         }else{
                   $request->session()->flash('error', '<div class="alert alert-danger" id="success-alert">
                                    <button type="button" class="close" data-dismiss="alert">x</button>
                                     <strong>Sorry! </strong><b>Some Error Occurred!.</b></div>');
                  return redirect('/episodes');
        }
    } 

    public function edit_about(Request $request)
    {
       $postedData = $request->all();
        unset($postedData['_token']);
        $recourd = tbl_about_us::where('id', '1')->update($postedData);
        if($recourd){
             $request->session()->flash('success', '<div class="alert alert-success" id="success-alert">
                                 <button type="button" class="close" data-dismiss="alert">x</button>
                            <strong>Success! </strong><b>Records has successfully Save.</b>
                                  </div>');
                return redirect('/about');
         }else{
                   $request->session()->flash('error', '<div class="alert alert-danger" id="success-alert">
                                    <button type="button" class="close" data-dismiss="alert">x</button>
                                     <strong>Sorry! </strong><b>Some Error Occurred!.</b></div>');
                  return redirect('/about');
        }
    } 

     public function edit_event(Request $request)
    {
       $postedData = $request->all();
        unset($postedData['_token']);
        $recourd = tbl_event_details::where('id', '1')->update($postedData);
        if($recourd){
             $request->session()->flash('success', '<div class="alert alert-success" id="success-alert">
                                 <button type="button" class="close" data-dismiss="alert">x</button>
                            <strong>Success! </strong><b>Records has successfully Save.</b>
                                  </div>');
                return redirect('/event');
         }else{
                   $request->session()->flash('error', '<div class="alert alert-danger" id="success-alert">
                                    <button type="button" class="close" data-dismiss="alert">x</button>
                                     <strong>Sorry! </strong><b>Some Error Occurred!.</b></div>');
                  return redirect('/event');
        }
    } 
}
