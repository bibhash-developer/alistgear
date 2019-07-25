<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\tbl_children_releation;
use App\Models\tbl_grand_children;
use Goutte\Client; 
use DB;

class GrandChild extends Controller
{
    /** 
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Client $client)
    {

      $childRecord = tbl_children_releation::all_child_record();
      
     /* echo "<pre>";
      print_r($childRecord); exit;*/
       if($childRecord['0']){
          
         foreach ($childRecord as $key => $value) {
            
          $html          = file_get_contents("https://neurotree.org/neurotree/peopleinfo.php?pid=".$value->pid);
          $pokemon_doc   = new \DOMDocument();
          libxml_use_internal_errors(TRUE); 
          $pokemon_doc->loadHTML($html);
          libxml_clear_errors(); 
          $pokemon_xpath = new \DOMXPath($pokemon_doc);
          $pokemon_row1  = $pokemon_xpath->query("//*[contains(@class, 'leftcol')]//div[2]//div[1]//tr/td/a/@href");
          foreach ($pokemon_row1 as $data) 
          {
              $datalink = $data->nodeValue;
              $id       = explode("=", $datalink);                 
              if(is_numeric($id['1']))
              {          
                  $clientChildren    = new\Goutte\Client();
              $crawlerChildren   = $clientChildren->request('GET', 'https://neurotree.org/neurotree/peopleinfo.php?pid='.$id['1']);
                  $grand_child       = $crawlerChildren->filter('.personinfo h1')->text();
                  $children_location = $crawlerChildren->filter('.personinfo tr')->text();
                  $children_location = explode(":", $children_location);
                  
                  
                if ($crawlerChildren->filter('.boxinline img[src]')->count() > 0 ) 
                  {
                    $imageLink = $crawlerChildren->filter('.boxinline img[src]')
                                          ->attr('src');
                    $imgName = 'css/'.basename($imageLink);
                  }else
                  {
                    $imageLink =0;

                  }
                      
                  $dublicate_check = tbl_grand_children::dublicate_check($id['1']);

                  if(!$dublicate_check){
  
                   $grand_children_name = str_replace(' ', ' ', trim($grand_child));

                   $address = str_replace(',', '-', trim($children_location['1']));
                   //$address = str_replace(' ', '/', $address);
                   $data      = array(
                               'pid'         => trim($id['1']),
                               'children_id' =>trim($value->id), 
                               'grand_children_name' => $grand_children_name,
                               'address'     => $address,
                               'image_name'  => trim($imageLink),
                              );

                 if(isset($data))
                   {
                     $lastInsertedID = tbl_grand_children::add($data);
                     if(! empty($lastInsertedID))
                     {
                        $this->WebsiteLink($lastInsertedID, $id['1']);
                      
                     }
             
                   }  
                 }
             }
          }
      }
   }
 }

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
                                
                                 $lastInsertedID = tbl_grand_children::website_link($lastInsertedID, $wblink);
                                 return true;                                  
                              }
                         
                        }
                 }
            }
      }
}



