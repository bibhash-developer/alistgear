<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\tbl_grand_father;
use App\Models\tbl_parents_releation;
use Goutte\Client; 
use DB;

class GrandFather extends Controller
{
	 public function index(Client $client)
     {

      $parentRecord = tbl_parents_releation::allParentChildrenParent();
      
      /*echo "<pre>";
      print_r($parentRecord); exit;*/
       if($parentRecord['0']){
          
         foreach ($parentRecord as $key => $value) {
            
          $html          = file_get_contents("https://neurotree.org/neurotree/peopleinfo.php?pid=".$value->pid);
          $pokemon_doc   = new \DOMDocument();
          libxml_use_internal_errors(TRUE); 
          $pokemon_doc->loadHTML($html);
          libxml_clear_errors(); 
          $pokemon_xpath = new \DOMXPath($pokemon_doc);
          $pokemon_row1  = $pokemon_xpath->query("//*[contains(@class, 'leftcol')]//div[1]//div[1]//tr/td/a/@href");
          foreach ($pokemon_row1 as $data) 
          {
              $datalink = $data->nodeValue;
              $id       = explode("=", $datalink);                 
              if(is_numeric($id['1']))
              {      
                   
              $clientGrandfather    = new\Goutte\Client();
              $Grandfather   = $clientGrandfather->request('GET', 'https://neurotree.org/neurotree/peopleinfo.php?pid='.$id['1']);
                  $grand_father          = $Grandfather->filter('.personinfo h1')->text();
                  $grand_parent_location = $Grandfather->filter('.personinfo tr')->text();
                  $grand_father_location = explode(":", $grand_parent_location);
                  
                  
                if ($Grandfather->filter('.boxinline img[src]')->count() > 0 ) 
                  {
                    $imageLink = $Grandfather->filter('.boxinline img[src]')
                                          ->attr('src');
                    $imgName = 'css/'.basename($imageLink);
                  }else
                  {
                    $imageLink ='NULL';

                  }
                      
                  $dublicate_check = tbl_grand_father::dublicate_check($value->id, $id['1']);

                  if(!$dublicate_check){
  
                   $grand_father_name = str_replace(' ', ' ', trim($grand_father));

                   $address = str_replace(',', '-', trim($grand_father_location['1']));
                   //$address = str_replace(' ', '/', $address);
                   $data      = array(
                               'pid'         => trim($id['1']),
                               'parent_id' =>trim($value->id), 
                               'super_parent_id' => trim($value->super_parent_id),
                               'grand_father_name' => $grand_father_name,
                               'address'     => $address,
                               'image_name'  => trim($imageLink),
                              );

                  
                 if(isset($data))
                   {
                     $lastInsertedID = tbl_grand_father::add($data);
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
                                
                                 $lastInsertedID = tbl_grand_father::website_link($lastInsertedID, $wblink);
                                 return true;                                  
                              }
                         
                        }
                 }
            }
      }
	
}

?>