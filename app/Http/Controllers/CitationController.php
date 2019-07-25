<?php

namespace App\Http\Controllers;

//session_start();
use Illuminate\Http\Request;
use App\Models\tbl_citation_details;
use App\Models\tbl_author_details;
//use App\LogIn;
use Goutte\Client;
//use Response;
use DB;


class CitationController extends Controller
{
  
    public function index(Request $request)
      { 
        $author['author'] = tbl_author_details::all_author_show();
        
        foreach ($author['author'] as $key => $value) {
          if($value->pid >2){
          //$data[] = $value->name.','.$value->pid;
        
        $request->session()->put('pid', $value->pid); //echo "@@@".$request->session()->get('pid'); exit;
        $author_name =str_replace(" ","+",$value->name);
        $html = file_get_contents('https://scholar.google.co.in/citations?hl=en&view_op=search_authors&mauthors='.$author_name.'&btnG=');
        $pokemon_doc = new \DOMDocument();   
        libxml_use_internal_errors(TRUE); 

        if(!empty($html)){ 

            $pokemon_doc->loadHTML($html);
              libxml_clear_errors();   
                $pokemon_xpath = new \DOMXPath($pokemon_doc);

                  $pokemon_row = $pokemon_xpath->query("//*[contains(@class, 'gsc_oai_name')]//a/@href");

                     if($pokemon_row->length > 0){

                        foreach($pokemon_row as $key=>$row){

                           if($key == 0){

                                $datalink = $row->nodeValue;
                                //echo "@@@@".$datalink; exit;

                                  if(!empty($datalink)){

                                        $this->GetCitations($datalink);
                                   }  
                            }                
                        } 
                    }
               }
           }
        }
     }


    public function GetCitations($datalink)
    {
 
        $client   = new\Goutte\Client();
        $crawler  = $client->request('GET', 'https://scholar.google.com'.$datalink);

        $page     = $crawler->filter('#gsc_art #gsc_lwp #gsc_a_nn')->text();
        $sno1     = explode("–", $page);
        
        $name       = $crawler->filter('#gsc_a_tw tbody tr')->each(function ($node) { 

          if ($node->filter('a[data-href]')->count() > 0 ){

               $link       = $node->filter('a[data-href]')->first()->attr('data-href');
               $link       = "https://scholar.google.com".$link;
            }
        /*$author     = $node->filter('td div')->text();
        $authorName = explode(',', $author);*/
           if ($node->filter('td a')->count() > 0 ){

                 $title     = $node->filter('td a')->text();
              }
            
            if ($node->filter('td a')->eq(1)->count() > 0 ){

                 $citedBy   = $node->filter('td a')->eq(1)->text();
            }
            
            if ($node->filter('td')->eq(2)->count() > 0 ){

                 $year        = $node->filter('td')->eq(2)->text(); 
            }
         

        $data        = array('pid' => session('pid'), 'links'=>trim($link), 'cited_by'=>$citedBy, 'year'=>$year, 'title' =>$title);
       
       
        $record      = tbl_citation_details::where(['links' =>trim($link), 'cited_by' =>trim($citedBy), 'year' =>trim($year)])->first();

        if(empty($record)){
                 //echo "!@@!!!"; print_r($data); exit;
            $response = tbl_citation_details::insertGetId($data);
         }
     });

        /*if(!empty($sno1['1'])){
            //$this->Get_Second_Citations($datalink, $sno1['1']);
            session()->forget('pid');
            return true;
            
          }else{
            return false;
          }*/
    }

    /*public function Get_Second_Citations($datalink, $id)
     {
        $client   = new\Goutte\Client(); 
        $crawler  = $client->request('GET', 'https://scholar.google.co.in'.$datalink.'&cstart'.$id.'&pagesize=100');
        $page     = $crawler->filter('#gsc_art #gsc_lwp #gsc_a_nn')->text();
        $sno1     = explode("–", $page);

        $name     = $crawler->filter('#gsc_a_tw tbody tr')->each(function ($node) {    
        $link     = $node->filter('a[data-href]')->first()->attr('data-href');
        $link     = "https://scholar.google.com".$link;
        $author   = $node->filter('td div')->text();
        $authorName = explode(',', $author);
           
        $title     = $node->filter('td a')->text();
        $citedBy   = $node->filter('td a')->eq(1)->text();
        $year      = $node->filter('td')->eq(2)->text();

        $data      = array('pid' =>session('pid'), 'links'=>trim($link), 'cited_by'=>$citedBy, 'year'=>$year, 'title' =>$title);

        $record    = tbl_citation_details::where('links', trim($link))->first();

         if(empty($record)){

               $response = tbl_citation_details::insertGetId($data);
               unset('pid');
         }  
      });

          /*if($sno1['1']){
            $this->Get_Second_Citations($sno1['1']);
          }else{
            return false;
          }
      }*/
}