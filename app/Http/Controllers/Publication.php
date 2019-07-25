<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\tbl_scholar;

class Publication extends Controller
{
    public function index(Request $req)
    {
    	$pid           = $req->pid;
    	$data['data']  = tbl_scholar::show_publication($pid);

     if(count($data['data']) >0)
    	{
          return view('allpublication',$data);
    	}
       
    	
    }

    public function oldest(Request $req)
    {
    	$pid           = $req->pid;
    	$data['data']  = tbl_scholar::oldest_publication($pid);
    	if(count($data['data']) >0)
    	{
           return view('allpublication',$data);
        }
    }

    public function publicationSearch(Request $req)
    {
      $publicationdata['publicationdata']  = tbl_scholar::publicationCheck($req->pid,
                                               $req->name);
       
        
      if($publicationdata['publicationdata'][0])
        {
           foreach ($publicationdata as $value) 
           {
                foreach ($value as $recourd) 
               { ?>
                                   <tr class="even">
                                        <td><?php echo $recourd->year; ?></td>
                                        <td><?php echo $recourd->title; ?></td>
                                        <td>
                                            <?php echo $recourd->publication; ?>
                                        </td>

                                        <td>
                                            <a href="#">
                                            <img src=" <?php echo url('public/assets/images/cost-icon.png'); ?>">
                                           </a>

                                        </td>

                                    <td>
                                        <a href="<?php echo  $recourd->links; ?>">
                                         <img src="<?php echo url('/public/assets/images/link-icon.png') ?>">
                                        </a>
                                    </td>
                                </tr>
                  <?php
               }
           }
        }
    }

    public function publicationSearchAll(Request $req)
    {
        echo $req->pid; exit;
      $publicationdata['publicationdata']  = tbl_scholar::publicationCheckall($req->pid,
                                               $req->name);
       
        
      if($publicationdata['publicationdata'][0])
        {
           foreach ($publicationdata as $value) 
           {
                foreach ($value as $recourd) 
               { ?>
                                   <tr class="even">
                                        <td><?php echo $recourd->year; ?></td>
                                        <td><?php echo $recourd->title; ?></td>
                                        <td>
                                            <?php echo $recourd->publication; ?>
                                        </td>

                                        <td>
                                            <a href="#">
                                            <img src=" <?php echo url('public/assets/images/cost-icon.png'); ?>">
                                           </a>

                                        </td>

                                    <td>
                                        <a href="<?php echo  $recourd->links; ?>">
                                         <img src="<?php echo url('/public/assets/images/link-icon.png') ?>">
                                        </a>
                                    </td>
                                </tr>
                  <?php
               }
           }
        }
    }
}
