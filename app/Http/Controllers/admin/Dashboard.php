<?php

namespace App\Http\Controllers\admin;


use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\tbl_user;

class Dashboard extends BaseController
{
 public function index()
    {
      
      return redirect('/login');
    }

    public function dashboard()
    {
      return view('admin.dashboard');

    }

    public function signin()
    {
      
       return view('admin.login');
    } 

    public function logout(Request $req)
    {
      $req->session()->flush();
       //$value = session()->get('username');
       return redirect('/admin');
    } 


    public function login_submit(Request $req)
    { 
        $req->validate([

               'username' =>'required|max:255',
               'password' =>'required|max:255'
        ]);

        $username = $req->get('username');
        $password = $req->get('password');

        $data['data']  = tbl_user::loginSubmit($username, $password);

      if($data['data'])
        {
           session()->put('username', $data['data']->username);
           /*$value = session()->get('username');
           echo $value; exit;*/
          
          return redirect('dashboard');
              
        }else
        {
          return redirect('login');
        }

    }
}
