<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\tbl_citation_details; 
//use App\Models\Home_model;
use DB; 
use Session;


class PublicationController extends Controller
{
  public function index(Request $request)
    { 
        $pid           =  Session::get('publication_id');
        $pub_record    = tbl_citation_details::where('pid', $pid)->get(); 
        $personalData  = DB::table('tbl_author_details')->where('pid', $pid)->get(); 
        $publication[] = $personalData;
        $publication[] = $pub_record;

        if(!empty($publication[0])){
           return view('publication')->with('publication', $publication);
           
        }
       
    }

  
   public function search_title_details(Request $req)
      {   
  
      $name          = trim($req->get('search_title'));   
      $pid           = trim($req->get('pid')); 
      $publications  = tbl_citation_details::search_publication($name, $pid);  

   if(isset($publications[0])){ ?>
     
            <table class="table">
                <thead>
                   <tr class="f">
                      <th>YEAR</th>
                      <th>TITLE</th>
                      <th>PUBLICATION</th>
                      <th>CITED BY</th>
                      <th>C0ST</th>
                      <th>LINK</th>
                  </tr>
                </thead>
              <tbody>
      <?php foreach($publications as $key=>$publication){ ?>
                                           
	       <tr class="<?php if($key % 2 ==0){ echo "even"; }else{ echo "odd"; }?>">
	          <td><?php echo $publication->year; ?></td>
	          <td><?php echo $publication->title; ?></td>
	          <td><?php echo $publication->title; ?></td>
	          <td><?php echo $publication->cited_by; ?></td>
            <td><a href="#"><img src="/public/assets/images/cost-icon.png"></a></td>
	          <td><a href="<?php echo $publication->links; ?>">
	                <img src="/public/assets/images/link-icon.png">
	              </a>
	          </td>
	       </tr>
    <?php } ?>
          </tbody>
       </table>
     <?php }else{
        echo  '<center><h4 style="color:red;margin-top: 40px; margin-bottom: 40px;">No Publications Record Found!</h4></center>';
       
      }
    }


     public function search_title_detail(Request $req)
      {   
  
      //$name          = trim($req->get('search_title'));   
      $pid           = trim($req->get('pid')); 
       
       //echo "dddddddddddddddd".$pid; exit;
      }
}
 ?>