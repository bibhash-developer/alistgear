<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\tbl_addjoin_us;

class Joinus extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function show_joinus(Request $req)
    {
      echo "hello"; exit;
       //$joinus = tbl_addjoin_us::showjoinUs();
    }
}
