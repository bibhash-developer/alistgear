<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Goutte\Client;
use App\Models\tbl_parent_info;
use App\Models\tbl_children_releation;
use App\Models\tbl_parents_releation;
use Response;
use DB;

class Collaborators extends Controller
{
    public function index(Client $client)
    {

$url="http://www.mca.gov.in/mcafoportal/loginValidateUser.do"; 

$post_fields = array();

$post_fields['userNamedenc'] ='bibhashkumar';
$post_fields['passwordenc']  ='Magento@12';    
$post_fields['accessCode']  = "";

$str = call_post_mca($url, $post_fields);
//$str = str_replace("&nbsp;","",$str);   

//print_r($str);  exit;


$dom = new DOMDocument();
$dom->loadHTML($str);
$xpath = new DOMXPath($dom);

$input_id =  '//input[@id="login_accessCode"]/@value';
$input_val = $xpath->query($input_id)->item(0);
$input_val1 = $input_val->nodeValue;



$url="http://www.mca.gov.in/mcafoportal/loginValidateUser.do"; 

$post_fields['userNamedenc']='hGJfsdnk`1t';
$post_fields['passwordenc']='675894242fa9c66939d9fcf4d5c39d1830f4ddb9';
$post_fields['accessCode'] = $input_val1;  //New Accesscode 

}

function  call_post_mca($url, $params)
{   
  echo $url; exit;
    #$user_agent = getRandomUserAgent();
    $user_agent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36";
    $str = "";
    foreach($params as $key=>$value)
    {
        $str = $str . "$key=$value" . "&";
    }
    $postData = rtrim($str, "&");

    $ch = curl_init();  

    curl_setopt($ch,CURLOPT_URL,$url);
    curl_setopt($ch,CURLOPT_RETURNTRANSFER,true);
    curl_setopt($ch,CURLOPT_HEADER, false); 
    #curl_setopt($ch, CURLOPT_CAINFO, DOC_ROOT . '/includes/cacert.pem');

    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $postData);   


    curl_setopt($ch,CURLOPT_USERAGENT, $user_agent);
    curl_setopt ($ch, CURLOPT_FOLLOWLOCATION, 1);
    curl_setopt ($ch, CURLOPT_REFERER, $url); 

    $cookie= DOC_ROOT . "/cookie.txt";
    curl_setopt ($ch, CURLOPT_COOKIEJAR, $cookie); 
    curl_setopt ($ch, CURLOPT_COOKIEFILE, $cookie); 

    $output=curl_exec($ch);

    curl_close($ch);
    return $output;
    }

     public function ParentInfo($id)
     {
        $client    = new\Goutte\Client();
        $crawler   = $client->request('GET', 'https://neurotree.org/neurotree/peopleinfo.php?pid='.$id);
        $fullname  = $crawler->filter('.personinfo h1')->text();  
        $location  = $crawler->filter('.personinfo tr')->text();
        //$Website   = $crawler->filter('.boxinline a[href]')->eq(1)
                                                                 //->text('href');
          if ($crawler->filter('.boxinline img[src]')->count() > 0 ) 
            {
              $imageLink = $crawler->filter('.boxinline img[src]')
                                    ->attr('src');
              $imgName = 'css/'.basename($imageLink);
            }else
            {
              $imageLink =0;

            }
           
    /*  $lastid=`324`;
      $name21 = $crawler->filter('.personinfo a')->each(function($node, $lastid)          
                 {
                    $id11= $_GET['pid'];
                        $wblink  = $node->text();
                        if(strstr($wblink, "http://www"))
                        {
                           $wblink  = $wblink;
                           echo "<pre>";
                           echo $id11;
                           print_r( $wblink); 
                        }
                      
                      
                });*/

                    
              
              $id11= 12;
              $html = file_get_contents('https://neurotree.org/neurotree/peopleinfo.php?pid='.$id);

                $pokemon_doc = new \DOMDocument();
                libxml_use_internal_errors(TRUE); 

                if(!empty($html))
                { 
                    $pokemon_doc->loadHTML($html);
                    libxml_clear_errors();   
                    $pokemon_xpath = new \DOMXPath($pokemon_doc);
                    $pokemon_row = $pokemon_xpath->query("//*[contains(@class, 'personinfo')]/a");

                    if($pokemon_row->length > 0)
                    {
                        foreach($pokemon_row as $row)
                        {
                          $wblink = $row->nodeValue;
                            if(strstr($wblink, "http://www"))
                              {
                                 $wblink  = $wblink;
                                 echo "<pre>";
                                 echo $id11;
                                 echo $wblink; 
                              }
                         
                        }
                    }
                }
      }

}