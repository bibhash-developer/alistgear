<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use App\Mail\SendMail;
use App\Models\tbl_episodes;
use App\Models\tbl_about_us;
use App\Models\tbl_event_details;

class AboutController extends Controller
{
    public function index()
    {
    	$data['data'] = tbl_about_us::where('id', '1')->get()->first();
        return view('about', $data);
    }

    public function jobboard()
    {
    	return view('jobboard');
    }

    public function submit()
    {
    	return view('submit');
    }
 
    public function podcast()
    {
    	return view('podcast');
    }

    public function jobs()
    {
    	return view('jobs');
    }

    public function conference()
    {
    	return view('conference');
    }

    public function contact()
    {
        return view('contact');
    }
}
