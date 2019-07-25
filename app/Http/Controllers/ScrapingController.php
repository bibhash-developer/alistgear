<?php

namespace App\Http\Controllers;

use App\Scholar;
use Illuminate\Http\Request;
use App\Models\tbl_parent_children_id;
use App\Models\tbl_author_details;
use Goutte\Client; 
use Response;
use DB;

class ScrapingController extends Controller
{
    /** 
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function index()
    {
       for($i=9942; $i<=10000; $i++){
           
           $this->ParentInfo($i);
       }
    }

    public function ParentInfo($pid)
    {

        $client    = new\Goutte\Client();
        $crawler   = $client->request('GET', 'https://neurotree.org/neurotree/peopleinfo.php?pid='.$pid);
        $url       = explode("=", $crawler->filter('#navigation ul li a')->eq(5)->attr('href'));
        
        if($url[2] == "https://neurotree.org/neurotree/peopleinfo.php?pid"){

          $fullname  = $crawler->filter('.personinfo h1')->text();  
          $fullname  = explode(",", $crawler->filter('.personinfo h1')->text());
          $fullname  = $fullname['0'];
          
          $location  = $crawler->filter('.personinfo tr')->text();
          //$message   = $crawler->filter('.boxinline h5')->eq(2)
                                                  //->text('h5'); 
          //$area      = $crawler->filter('.personinfo h5')->eq(1)->text('h5');
          
      if ($crawler->first()->filter('.personinfo h5')->eq(1)->text('h5') == "Area:") 
          {
              $area      = $crawler->filter('.personinfo h5')->eq(1)->text();
              $area1     = $crawler->filter('.personinfo')->text();
              $area2     = explode('Area:', $area1);
              $area3     = explode(':', $area2[1]);
             
              $area4     = substr($area3[0], 0,50);
              $area5     = explode("  ", $area4);
              $areas     = $area5[0];
              
          }else
            {
              $areas ='NULL';

            }
            
       if ($crawler->filter('.boxinline img[src]')->count() > 0) 
            {
              $imageLink = $crawler->filter('.boxinline img[src]')->attr('src');
              $data      = explode('.', $imageLink);
              $data      = end($data);
               
                  if($data == 'jpg' || $data == 'jpeg' || $data == 'png'){

                    if(strpos($imageLink, 'photo/00')){
                        
                            $crawler  = get_headers('https://neurotree.org'.$imageLink, 1);
                            if(isset($crawler['ETag'])){
                                   $imageLink ='https://neurotree.org'.$imageLink;
                             }else{
                                   $imageLink ='NULL';
                            }

                       }else{
                             $crawler  = get_headers($imageLink, 1);
                            if(isset($crawler['ETag'])){
                                   $imageLink =$imageLink;
                             }else{
                                   $imageLink ='NULL';
                            }
                       }

                  }else{
                        $imageLink ='NULL';
                  }     
         }else{
                 $imageLink ='NULL';
         } 

      
        $location      = explode(":", $location); 
        $fulladdress   = explode(',', $location[1]);
        
        if(isset($fulladdress[0])){
          $address       = $fulladdress[0];
        }else{
          $address       ="NULL";
        }

        if(isset($fulladdress[1])){
          $city       = $fulladdress[1];
        }else{
          $city       ="NULL";
        }

        if(isset($fulladdress[2])){
          $state       = $fulladdress[2];
        }else{
          $state       ="NULL";
        }

        if(isset($fulladdress[4])){
          $country       = $fulladdress[3].$fulladdress[4];
        }else if(isset($fulladdress[3])){
          $country       = $fulladdress[3];
        }else{
          $country ="NULL";
        }
        
         $data      = array(
                           'pid'        => trim($pid),
                           'name'       => str_replace('  ', ' ',trim($fullname)),
                           'address'    => trim($address),
                           'city'       => trim($city),
                           'state'      => trim($state),
                           'country'    => trim($country),
                           'area'       => trim($areas),
                           'image_name' => trim($imageLink),
                          );
         /*echo "<pre>@@@";
         print_r($data); exit;*/


           $tbl_child_last_pid = $this->ParentChildrenInfo($pid);

             if($tbl_child_last_pid){

                  $this->ParentToParentInfo($tbl_child_last_pid, $pid);  
                /*------------------   Add  Collaborators ------------------*/

                  $this->Collaborators($tbl_child_last_pid, $pid);
             }
          
        $dublicateParent = tbl_author_details::CheckAuthorPid($pid);  
        
          if(empty($dublicateParent))
          {
              $lastInsertedID = tbl_author_details::InsertAuthorDetails($data);
              if($lastInsertedID){

                    $this->WebsiteLink($lastInsertedID, $pid);
                    //echo "success";
              }
          }
        }
      }
    /*.................. Parent to Children informeation save ..............*/

    public function ParentChildrenInfo($idd)
      {
          $html          = file_get_contents("https://neurotree.org/neurotree/peopleinfo.php?pid=".$idd."");
          $pokemon_doc   = new \DOMDocument();
          libxml_use_internal_errors(TRUE); 
          $pokemon_doc->loadHTML($html);
          libxml_clear_errors(); 
          $pokemon_xpath = new \DOMXPath($pokemon_doc);
          $pokemon_row1  = $pokemon_xpath->query("//*[contains(@class, 'leftcol')]//div[2]//div[1]//tr/td[1]/a/@href");
          $ChildPid = array(); 
          foreach ($pokemon_row1 as $value) 
          {
              $datalink = $value->nodeValue;
              $id       = explode("=", $datalink); 
            if(is_numeric($id['1']))
              {                
                $ChildPid[] = $id['1'];  
              }               
          }

          if(implode('-', $ChildPid)){
              $AllChildPid = implode('-', $ChildPid); 
            }
        
            $piddetails = [
                              'author_pid' => $idd,
                              'children_pid' => isset($AllChildPid)? $AllChildPid: "",
                          ];

           $dublicate_child = tbl_parent_children_id::CheckchildPid($idd);

           if($dublicate_child){

                $lastInsertedId = tbl_parent_children_id::CheckChildUpdate($idd, $piddetails);
                return $dublicate_child;
           }else{
                $lastInsertedId = tbl_parent_children_id::InsertAuthorPid($piddetails);
                return $lastInsertedId;
           }
          
      }

  /*.................. Parent to Parent informeation save ..............*/

       public function ParentToParentInfo($lastInsertedId, $pid)
        {
          $html          = file_get_contents("https://neurotree.org/neurotree/peopleinfo.php?pid=".$pid."");
          $pokemon_doc   = new \DOMDocument();
          libxml_use_internal_errors(TRUE); 
          $pokemon_doc->loadHTML($html);
          libxml_clear_errors(); 
          $pokemon_xpath = new \DOMXPath($pokemon_doc);
          $pokemon_row1  = $pokemon_xpath->query("//*[contains(@class, 'leftcol')]//div[1]//div[1]//tr/td[1]/a/@href");
          $allpid = array(); 
          foreach ($pokemon_row1 as $value) 
          {
              $datalink = $value->nodeValue;
              $id       = explode("=", $datalink); 
              if(is_numeric($id['1']))
              {                
                  $allpid[] = $id['1'];
              }  
          }

          if(implode('-', $allpid)){
                  $Allpid = implode('-', $allpid);
            }
                  $piddetails = [
                                    'author_pid' => $pid,
                                    'parent_pid' =>isset($Allpid)? $Allpid: "",
                                ];

             $dublicate_parent = tbl_parent_children_id::CheckParentPid($pid);
             
           if($dublicate_parent){
                $lastInsertedId = tbl_parent_children_id::CheckParentUpdate($pid, $piddetails);
                return $dublicate_parent;
           }else{
               
                $lastInsertedId = tbl_parent_children_id::UpdateParentPid($pid, $piddetails);
                return $lastInsertedId;
           }
            //tbl_parent_children_id::UpdateParentPid($pid, $piddetails);
          
      }

            /*.................. Collaborators informeation save ..............*/

       public function Collaborators($lastInsertedId, $pid)
        {
           $html          = file_get_contents("https://neurotree.org/neurotree/peopleinfo.php?pid=".$pid."");
          $pokemon_doc   = new \DOMDocument();
          libxml_use_internal_errors(TRUE); 
          $pokemon_doc->loadHTML($html);
          libxml_clear_errors(); 
          $pokemon_xpath = new \DOMXPath($pokemon_doc);
          $pokemon_row1  = $pokemon_xpath->query("//*[contains(@class, 'leftcol')]//div[3]//div[1]//tr/td[1]/a/@href");
          $allpid = array(); 
          foreach ($pokemon_row1 as $value) 
          {
              $datalink = $value->nodeValue;
              $id       = explode("=", $datalink); 
              if(is_numeric($id['1']))
              {                
                  $allpid[] = $id['1'];
              }  
          }

          if(implode('-', $allpid)){
                  $Allpid = implode('-', $allpid);
            }
                  $piddetails = [
                                    'author_pid'       => $pid,
                                    'collaborators_id' =>isset($Allpid)? $Allpid: "",
                                ];

             $dublicate_collaborat = tbl_parent_children_id::CheckParentPid($pid);
             
           if($dublicate_collaborat){
                $lastInsertedId = tbl_parent_children_id::CheckCollaboratorsUpdate($pid, $piddetails);
                return $dublicate_collaborat;
           }else{
              
                $lastInsertedId = tbl_parent_children_id::UpdateCollaboratPid($pid, $piddetails);
                return $lastInsertedId;
           } 
      }
           /*.................. Collaborators informeation save ..............*/

    public function WebsiteLink($lastInsertedID, $pid)
      {  
         $html5 = file_get_contents('https://neurotree.org/neurotree/peopleinfo.php?pid='.$pid);
         $pokemon_doc5 = new \DOMDocument();
         libxml_use_internal_errors(TRUE); 

          if(!empty($html5))
          { 
            $pokemon_doc5->loadHTML($html5);
            libxml_clear_errors();   
            $pokemon_xpath5 = new \DOMXPath($pokemon_doc5);
            $pokemon_row5 = $pokemon_xpath5->query("//*[contains(@class, 'personinfo')]/a");

              if($pokemon_row5->length > 0)
              {
                  foreach($pokemon_row5 as $row5)
                  {
                    $wblink = $row5->nodeValue;
                   
                      if(strstr($wblink, "http://"))
                        {
                           $wblink  = $wblink;
                           tbl_author_details::AuthorWebLink($lastInsertedID, $wblink);
                           return true;
                        }
                  }
              }
          }
      }
}