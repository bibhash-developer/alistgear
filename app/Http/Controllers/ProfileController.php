<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Details_model;
use App\Models\Home_model;
use App\Models\tbl_video;
use App\Models\tbl_claim_profiles;
use App\Models\tbl_country;
use App\Models\My_profile_details;
use App\Models\tbl_citation_details;
use DB; 
use URL;

class ProfileController extends Controller
{
     public function grand_children(Request $req)
      {
         $child_id       = trim($req->pid);
         $educationalLineage = Details_model::educational_lineage($child_id);
         //$educationalLineage = Details_model::educational_lineage_search($child_id[0], $child_id[1]);

          if(isset($educationalLineage['children'])){
                $count_children = count($educationalLineage['children']);
          }else{
                $count_children = 0;
          }


         if(!empty($educationalLineage['children'][0])){ ?>
             
                  <div class="col-md-4">
                    <div class="title_child"><?php echo $count_children; ?>&nbsp&nbsp&nbsp&nbspCHILDREN</div>
                      <div class="lagre_div1">

                        <div class="scroll_up_left" id="center" style="display: none;">
                           <ul class="pagination">
                            <li><i class="fa fa-angle-up" aria-hidden="true"></i></li>
                          </ul>
                       </div>
                       <div class="text">
                 <?php foreach ($educationalLineage['children'] as $key => $children) {
                     $author_pid[] =$children->pid;
                      if($key <2){ ?>
                        <div class="main_box1 active" id="<?php echo $children->pid; ?>">
                            <div class="name_box">
            
                              <a href="JavaScript:void(0)" class="part1" onclick="children_lock('<?php echo $children->pid; ?>')"
                                id="locks<?php echo $children->pid; ?>"> <i class="fa fa-unlock-alt" aria-hidden="true"></i></a>

                              <div class="part2">
                                <a href="<?php echo base_url; ?>author-details/<?php echo $children->pid; ?>">
                                    <?php echo substr($children->name,0,15); ?>
                                </a></div>
                              <div class="part3"></div>
                            </div>
                       </div> 
                
                    <?php  }else{ ?>

                         <div class="main_box1" id="<?php echo $children->pid; ?>" style="display: none;">
                            <div class="name_box">
                              <a href="JavaScript:void(0)" class="part1" onclick="children_lock('<?php echo $children->pid; ?>')"
                               id="locks<?php echo $children->pid; ?>"> <i class="fa fa-unlock-alt" aria-hidden="true"></i></a>

                              <div class="part2">
                                <a href="<?php echo base_url; ?>author-details/<?php echo $children->pid; ?>">
                                    <?php echo substr($children->name,0,15); ?>
                                </a></div>
                              <div class="part3"></div>
                            </div>
                       </div> 

                   <?php } } ?>
                 </div> 

                     <?php if($count_children >=2){ ?>
                          <div class="scroll_down_left" id="center">
                            <ul class="pagination">
                              <li><i class="fa fa-angle-down" aria-hidden="true"></i></li>
                            </ul>
                          </div>

                        <?php } ?>
                    </div>                     
                 </div>
                   <div class="col-md-4" id="loader_lineage_grand" style="display: none;">
                     <div class="load">
                       <div class="loader_lineage"></div>
                    </div>
                  </div>
                <div class="text" id="grand_children_id">
                    <div class="col-md-4">

                      <?php
                      if(!empty($author_pid[0])){
                          $grand_children_grand1 = Details_model::educational_lineage($author_pid[0]);
                       }else{
                          $grand_children_grand1 =0;
                       }  
                     
                       if(!empty($author_pid[1])){
                         $grand_children_grand2 = Details_model::educational_lineage($author_pid[1]);
                       }else{
                        $grand_children_grand2 = 0;
                       }   

                  $total_grand_child_grand = count($grand_children_grand1['children'])+ count($grand_children_grand2['children']);

                      ?>
                        <div class="title_child"><?php echo $total_grand_child_grand; ?>&nbsp&nbsp&nbsp&nbspGRANDCHILDREN</div>
                           <?php  
                          for ($i=0; $i < 2; $i++) { 
                    
                             $grand_children = Details_model::educational_lineage($author_pid[$i]);

                             if(!empty($grand_children['children'][0])){  

                              if($i<=1){ 
                                ?>
                
                          <div class="lagre_div2" id="grand_children_div<?php echo $i; ?>">
                            <div class="scroll_up_left_grand<?php echo $i; ?>" id="center" style="display: none;">
                               <ul class="pagination">
                                <li><i class="fa fa-angle-up" aria-hidden="true"></i></li>
                              </ul>
                           </div>

                      <div class="text">
                        <?php foreach ($grand_children['children'] as $grand_key => $grand_child) { 
                          if($grand_key <2){
                           ?>
                           <div class="main_box22 active" id="<?php echo $grand_child->pid; ?>">
                             <div class="name_box_new">
                            <a href="JavaScript:void(0)" class="part1" onclick="children_lock('<?php echo $grand_child->pid; ?>')"
                              id="locks<?php echo $grand_child->pid; ?>"> <i class="fa fa-unlock-alt" aria-hidden="true"></i></a>
                                  <div class="part2">
                                    <a href="<?php echo base_url; ?>author-details/<?php echo $grand_child->pid; ?>">
                                  <?php echo substr($grand_child->name,0,15); ?>
                                     </a></div>
                                  <div class="part3"></div>
                                   <div class="medium_img_<?php echo $grand_key ; ?>">
                                  <img src="<?php echo base_url; ?>public/assets/fonts/medium.png">
                               </div>
 
                                </div> 
                              </div> 
                        <?php  }else{ ?>

                                <div class="main_box22" id="<?php echo $grand_child->pid; ?>" style="display: none;">
                                <div class="name_box_new">
                           <a href="JavaScript:void(0)" class="part1" onclick="children_lock('<?php echo $grand_child->pid; ?>')"
                              id="locks<?php echo $grand_child->pid; ?>"> <i class="fa fa-unlock-alt" aria-hidden="true"></i></a>
                                  <div class="part2">
                                    <a href="<?php echo base_url; ?>author-details/<?php echo $grand_child->pid; ?>">
                                  <?php echo substr($grand_child->name,0,15); ?>
                                     </a></div>
                                  <div class="part3"></div>
                                  <!--  <div class="medium_img_<?php //echo $grand_key ; ?>">
                                  <img src="<?php //echo base_url; ?>public/assets/fonts/medium.png">
                               </div> -->
                                </div> 
                              </div>
                       <?php } 
                         } ?>
                     </div>
                         <?php if(count($grand_children['children']) >=2){ ?>
                          <div class="scroll_down_left_grand<?php echo $i; ?>" id="center">
                            <ul class="pagination">
                              <li><i class="fa fa-angle-down" aria-hidden="true"></i></li>
                            </ul>
                          </div>
                        <?php } ?>
                       </div>
                      <?php } }else{ ?>
                         <div class="lagre_div2" id="grand_children_div<?php echo $i; ?>">
                           <div class="grandchild_warning">
                              <b class="warning_text">No Records Found!</b>
                           </div>
                      </div>
                      <?php } } ?>
                     </div>
                   </div>
               <?php  
         }?>
          <script type="text/javascript">
                                                   //Children parth
            jQuery( document ).ready(function() {
                jQuery(".scroll_down_left").click(function(){  //Down

                    jQuery('.scroll_up_left').show();
                     var vlength =jQuery(this).prev().prev().children(".active").length;
                             
                   if(jQuery( ".text .main_box1:last-child" ).hasClass('active')){
                       $(".scroll_down_left").hide();
               }else{
                    
                    var divposition = jQuery( "div .scroll_down_left" ).attr('id');

                   /* if(divposition == 'left'){
                        $('#grand_children_id').hide();
                        jQuery('#loader_lineage_grand').show();
                        exit;
                    }*/
                    var id = [];
                    id[0] = jQuery("div[class='main_box1 active']").next().next().attr('id');

                    if(jQuery("div[class='main_box1 active']").next().next().next().attr('id') !== 'undefined'){
                       id[1] = jQuery("div[class='main_box1 active']").next().next().next().attr('id');
                    }

                  jQuery(this).prev().children("div.active:last").next().show();
                  jQuery(this).prev().children("div.active:last").next().next().show();
                  jQuery(this).prev().children("div.active").hide();
                  jQuery(this).prev().children().removeClass("active");
                  jQuery(this).prev().children(":visible").addClass("active");
                  $('#grand_children_id').hide();
                  jQuery('#loader_lineage_grand').show();


                  $.ajax({ 
                      type : "GET",
                      url  : "children-grand-id",
                      data : { id: id, divposition: divposition},
                      success: function(data){
                              jQuery('#grand_children_id').show(); 
                              jQuery('#loader_lineage_grand').hide(); 
                              $("#grand_children_id").html(data);
                            }
                   });
                }
           });
                 jQuery(".scroll_up_left").click(function(){ // Up
             
                var vlength=$(".scroll_up_left").next().next().children(".active").length;
                           
                var t1 =jQuery(this).next().children("div.active").prev().attr("id");
                var t2 = jQuery(this).next().children("div.active").attr("id");
                $(".scroll_down_left").show();
               
                   var id = [];

                    if(jQuery("div[class='main_box1 active']").prev().prev().attr('id') !== 'undefined'){
                       id[0] = jQuery("div[class='main_box1 active']").prev().prev().attr('id');
                    }
                      id[1] = jQuery("div[class='main_box1 active']").prev().attr('id');
                
                if(t1!=t2){

                    var divposition = jQuery( "div .scroll_down_left" ).attr('id');
                  $('#grand_children_id').hide();
                    jQuery('#loader_lineage_grand').show();
                 
                $.ajax({ 
                        type : "GET",
                        url  : "children-grand-id",
                        data : { id: id, divposition: divposition},
                        success: function(data){
                              jQuery('#grand_children_id').show(); 
                              jQuery('#loader_lineage_grand').hide();
                              $("#grand_children_id").html(data);
                         }
                   });

                 jQuery(this).next().children("div.active:first").prev().show();
                 jQuery(this).next().children("div.active:first").prev().prev().show();

              //}
                 jQuery(this).next().children("div.active").hide();
                 jQuery(this).next().children().removeClass("active");
                 jQuery(this).next().children(":visible").addClass("active");
                }
             });
          }); 

              jQuery( document ).ready(function() {  //grand father.
                jQuery(".scroll_down_left_grand0").click(function(){  //Down 
                jQuery('.scroll_up_left_grand0').show();
                var vlength =jQuery(this).prev().prev().children(".active").length;

               if(jQuery(".text .main_box22:last-child" ).hasClass('active')){
                 $(".scroll_down_left_grand0").hide();
               }else{

                  jQuery(this).prev().children("div.active:last").next().show();
                  jQuery(this).prev().children("div.active:last").next().next().show();
                  jQuery(this).prev().children("div.active").hide();
                  jQuery(this).prev().children().removeClass("active");
                  jQuery(this).prev().children(":visible").addClass("active");

                 var divposition = jQuery( "div .scroll_down_left_grand0" ).attr('id');
                 if(divposition == 'left'){
                     grandchild_slider();
                 }
                 
               }
            });  

            jQuery(".scroll_up_left_grand0").click(function(){ // Up
                                        
                var t1 =jQuery(this).next().children("div.active").prev().attr("id");
                var t2 = jQuery(this).next().children("div.active").attr("id");
                  $(".scroll_down_left_grand0").show();
                //alert(t1+"=="+t2);
                if(t1!=t2){

                 jQuery(this).next().children("div.active:first").prev().show();
                 jQuery(this).next().children("div.active:first").prev().prev().show();
                 jQuery(this).next().children("div.active").hide();
                 jQuery(this).next().children().removeClass("active");
                 jQuery(this).next().children(":visible").addClass("active");

                 var divposition = jQuery( "div .scroll_up_left_grand0" ).attr('id');
                 if(divposition == 'left'){
                     grandchild_slider();
                 }

                }
             });  
          }); 



             jQuery( document ).ready(function() {  //grand father.
                jQuery(".scroll_down_left_grand1").click(function(){  //Down
                jQuery('.scroll_up_left_grand1').show();
                var vlength =jQuery(this).prev().prev().children(".active").length;
                 
             if(jQuery(".text .main_box22:last-child" ).hasClass('active')){
                 $(".scroll_down_left_grand1").hide();
               }else{
                 
                  jQuery(this).prev().children("div.active:last").next().show();
                  jQuery(this).prev().children("div.active:last").next().next().show();
                  jQuery(this).prev().children("div.active").hide();
                  jQuery(this).prev().children().removeClass("active");
                  jQuery(this).prev().children(":visible").addClass("active");

                  var divposition = jQuery( "div .scroll_down_left_grand1" ).attr('id');
                 if(divposition == 'left'){
                     grandchild_slider();
                 }
              }
            });  

            jQuery(".scroll_up_left_grand1").click(function(){ // Up
                                        
                var t1 =jQuery(this).next().children("div.active").prev().attr("id");
                var t2 = jQuery(this).next().children("div.active").attr("id");
                  $(".scroll_down_left_grand1").show();
                if(t1!=t2){

                 jQuery(this).next().children("div.active:first").prev().show();
                 jQuery(this).next().children("div.active:first").prev().prev().show();

                 jQuery(this).next().children("div.active").hide();
                 jQuery(this).next().children().removeClass("active");
                 jQuery(this).next().children(":visible").addClass("active");
                  
                   var divposition = jQuery( "div .scroll_up_left_grand1" ).attr('id');
                 if(divposition == 'left'){
                     grandchild_slider();
                 }
                }
             });  
          }); 
          </script>
      <?php }
   
     public function children_grand_id(Request $req)
        {
               $div_position          = $req->divposition;
               
               $children_id       = $req->id;
               $grand_children1 = Details_model::educational_lineage($children_id[0]);

               if(!empty($children_id[1])){
                 $grand_children2 = Details_model::educational_lineage($children_id[1]);
               }else{
                $grand_children2['children'] = [];
               }          
              $total_grand_child = count($grand_children1['children'])+ count($grand_children2['children']);

              if(isset($educationalLineage['children'])){
                     $count_children = count($educationalLineage['children']);
                }else{
                      $count_children = 0;
                }
    
             if(!empty($children_id[0])){ ?> 
                   
                   <div class="col-md-4">
                        <div class="title_child"><?php echo $total_grand_child; ?>&nbsp&nbsp&nbsp&nbspGRANDCHILDREN</div>
                           <?php  
                          for ($i=0; $i <count($children_id); $i++) { 
                    
                             $grand_children = Details_model::educational_lineage($children_id[$i]);

                             if(!empty($grand_children['children'][0])){  

                              if($i<=1){ 
                                ?>
                          <div class="lagre_div2" id="grand_children_div<?php echo $i; ?>">
                            <div class="scroll_up_left_grand<?php echo $i; ?>" id="center" style="display: none;">
                               <ul class="pagination">
                                <li><i class="fa fa-angle-up" aria-hidden="true"></i></li>
                              </ul>
                           </div>

                      <div class="text">
                        <?php foreach ($grand_children['children'] as $grand_key => $grand_child) { 
                          if($grand_key <2){
                           ?>
                           <div class="main_box22 active" id="<?php echo $grand_child->pid; ?>">
                             <div class="name_box_new">
                            <a href="JavaScript:void(0)" class="part1" onclick="children_lock('<?php echo $grand_child->pid; ?>')"
                              id="locks<?php echo $grand_child->pid; ?>"> <i class="fa fa-unlock-alt" aria-hidden="true"></i></a>
                                  <div class="part2">
                                    <a href="<?php echo base_url; ?>author-details/<?php echo $grand_child->pid; ?>">
                                  <?php echo substr($grand_child->name,0,15); ?>
                                     </a></div>
                                  <div class="part3"></div>
                                   <div class="medium_img_<?php echo $grand_key ; ?>">
                                  <img src="<?php echo base_url; ?>public/assets/fonts/medium.png">
                               </div>
                               <?php 
                                 if($div_position == 'left'){ ?>
                                    <script type="text/javascript">
                                           grandchild_slider();
                                    </script>
                               <?php  } ?>
                                </div> 
                              </div> 
                        <?php  }else{ ?>

                                <div class="main_box22" id="<?php echo $grand_child->pid; ?>" style="display: none;">
                                <div class="name_box_new">
                           <a href="JavaScript:void(0)" class="part1" onclick="children_lock('<?php echo $grand_child->pid; ?>')"
                              id="locks<?php echo $grand_child->pid; ?>"> <i class="fa fa-unlock-alt" aria-hidden="true"></i></a>
                                  <div class="part2">
                                    <a href="<?php echo base_url; ?>author-details/<?php echo $grand_child->pid; ?>">
                                  <?php echo substr($grand_child->name,0,15); ?>
                                     </a></div>
                                  <div class="part3"></div>
                                  <!--  <div class="medium_img_<?php //echo $grand_key ; ?>">
                                  <img src="<?php //echo base_url; ?>public/assets/fonts/medium.png">
                               </div> -->
                                </div> 
                              </div>
                       <?php } 
                         } ?>
                     </div>
                         <?php if(count($grand_children['children']) >=2){ ?>
                          <div class="scroll_down_left_grand<?php echo $i; ?>" id="center">
                            <ul class="pagination">
                              <li><i class="fa fa-angle-down" aria-hidden="true"></i></li>
                            </ul>
                          </div>
                        <?php } ?>
                       </div>
                      <?php } }else{ ?>
                        <div class="lagre_div2" id="grand_children_div<?php echo $i; ?>">
                            <?php 
                                 if($div_position == 'left'){ ?>
                                    <script type="text/javascript">
                                           grandchild_slider();
                                    </script>
                               <?php  } ?>
                               <div class="grandchild_warning">
                                  <b class="warning_text">No Records Found!</b>
                               </div>
                        </div>
                     <?php  } } ?>
                     </div> 

            <script type="text/javascript">

              jQuery( document ).ready(function() {  //grand father.
                jQuery(".scroll_down_left_grand0").click(function(){  //Down 
                jQuery('.scroll_up_left_grand0').show();
                var vlength =jQuery(this).prev().prev().children(".active").length;

               if(jQuery(".text .main_box22:last-child" ).hasClass('active')){
                 $(".scroll_down_left_grand0").hide();
               }else{

                  jQuery(this).prev().children("div.active:last").next().show();
                  jQuery(this).prev().children("div.active:last").next().next().show();
                  jQuery(this).prev().children("div.active").hide();
                  jQuery(this).prev().children().removeClass("active");
                  jQuery(this).prev().children(":visible").addClass("active");

                   var divposition = jQuery( "div .scroll_down_left_grand0" ).attr('id');
                   if(divposition == 'left'){
                       grandchild_slider();
                   }
               }
            });  

            jQuery(".scroll_up_left_grand0").click(function(){ // Up
                                        
                var t1 =jQuery(this).next().children("div.active").prev().attr("id");
                var t2 = jQuery(this).next().children("div.active").attr("id");
                  $(".scroll_down_left_grand0").show();
                //alert(t1+"=="+t2);
                if(t1!=t2){

                 jQuery(this).next().children("div.active:first").prev().show();
                 jQuery(this).next().children("div.active:first").prev().prev().show();
                 jQuery(this).next().children("div.active").hide();
                 jQuery(this).next().children().removeClass("active");
                 jQuery(this).next().children(":visible").addClass("active");

                 var divposition = jQuery( "div .scroll_up_left_grand0" ).attr('id');
                   if(divposition == 'left'){
                       grandchild_slider();
                   }
                }
             });  
          }); 



          jQuery( document ).ready(function() {  //grand father.
                jQuery(".scroll_down_left_grand1").click(function(){  //Down
                jQuery('.scroll_up_left_grand1').show();
                var vlength =jQuery(this).prev().prev().children(".active").length;
                 
             if(jQuery(".text .main_box22:last-child" ).hasClass('active')){
                 $(".scroll_down_left_grand1").hide();
               }else{

                  jQuery(this).prev().children("div.active:last").next().show();
                  jQuery(this).prev().children("div.active:last").next().next().show();
                  jQuery(this).prev().children("div.active").hide();
                  jQuery(this).prev().children().removeClass("active");
                  jQuery(this).prev().children(":visible").addClass("active");

                  var divposition = jQuery( "div .scroll_down_left_grand1" ).attr('id');
                   if(divposition == 'left'){
                       grandchild_slider();
                   }
              }
            });  

            jQuery(".scroll_up_left_grand1").click(function(){ // Up
                                        
                var t1 =jQuery(this).next().children("div.active").prev().attr("id");
                var t2 = jQuery(this).next().children("div.active").attr("id");
                  $(".scroll_down_left_grand1").show();
                if(t1!=t2){

                 jQuery(this).next().children("div.active:first").prev().show();
                 jQuery(this).next().children("div.active:first").prev().prev().show();

                 jQuery(this).next().children("div.active").hide();
                 jQuery(this).next().children().removeClass("active");
                 jQuery(this).next().children(":visible").addClass("active");

                  var divposition = jQuery( "div .scroll_up_left_grand1" ).attr('id');
                   if(divposition == 'left'){
                       grandchild_slider();
                   }
                }
             });  
          }); 
          </script>
                     
    
          <?php }
        }

    public function children_grand_pid(Request $req){

        $first_grand_pid = $req->first_grand;
        $second_grand_pid = $req->second_grand; 


        if(!empty($first_grand_pid[0])){
            $first_grand_pid[0] = $first_grand_pid[0];
        }else{
          $first_grand_pid[0] = 'aaa';
        }

         if(!empty($first_grand_pid[1])){
            $first_grand_pid[1] = $first_grand_pid[1];
        }else{
          $first_grand_pid[1] = 'aaa';
        }

         if(!empty($second_grand_pid[0])){
            $second_grand_pid[0] = $second_grand_pid[0];
        }else{
          $second_grand_pid[0] = 'aaa';
        }

        if(!empty($second_grand_pid[1])){
            $second_grand_pid[1] = $second_grand_pid[1];
        }else{
          $second_grand_pid[1] = 'aaa';
        }



        if($first_grand_pid[0] && $second_grand_pid[0]){
             $thired_grand_id = array_merge($first_grand_pid, $second_grand_pid);
        }
        ?>

       <div class="col-md-4">
        <div class="title_child">&nbsp&nbsp&nbsp&nbspGREAT GRANDCHILDREN</div>
      <?php 
        for ($i=0; $i < count($thired_grand_id); $i++) { 

            if(!empty($thired_grand_id[$i])){
                 $grand_children = Details_model::educational_lineage($thired_grand_id[$i]);
               }else{
                $grand_children['children'] = [];
               }
                 if(!empty($grand_children['children'])){
                   $record_count = count($grand_children['children']);
                 }else{
                  $record_count = 1;
                 }
              
               
             if(!empty($grand_children['children'])){ ?>

                  <div class="lagre_div_ggchlideren" id="lagre_div_ggchlideren<?php echo $i; ?>">
                    <div class="scroll_up_left_grand_8" id="scroll_up_left_grand_8<?php echo $i; ?>" style="display: none;">
                        <ul class="pagination">
                          <li><i class="fa fa-angle-up" aria-hidden="true"></i></li>
                        </ul>
                    </div>
                    <div class="text">
                 <?php foreach($grand_children['children'] as $key=>$grand_children){ 
                       if($key<2){ ?>
                              
                            <div class="main_box_ggchlideren active" id="<?php echo $grand_children->pid; ?>">
                                <div class="name_box_ggchlideren">
                                <!--   <div class="part11"><i class="fa fa-lock" aria-hidden="true"></i></div> -->
                                   <a href="JavaScript:void(0)" class="part11" onclick="children_lock('<?php echo $grand_children->pid; ?>')"id="locks<?php echo $grand_children->pid; ?>"> 
                                    <i class="fa fa-lock" aria-hidden="true"></i>
                                  </a>

                                   <div class="part22">
                                    <a href="<?php echo base_url; ?>author-details/<?php echo $grand_children->pid; ?>">
                                       <?php echo substr($grand_children->name,0,15); ?>
                                    </a>
                                   </div>
                                   <div class="part33"></div>
                               </div>
                               <div class="img_small<?php echo $key; ?>">
                                <img src="<?php echo base_url; ?>public/assets/fonts/small.png">
                              </div>
                            </div>
    
                  <?php  }else{ ?>
                         
                          <div class="main_box_ggchlideren" id="<?php echo $grand_children->pid; ?>" style="display: none;">
                            <div class="name_box_ggchlideren">
                              <!-- <div class="part11"><i class="fa fa-lock" aria-hidden="true"></i></div> -->
                        <a href="JavaScript:void(0)" class="part11" onclick="children_lock('<?php echo $grand_children->pid; ?>')"id="locks<?php echo $grand_children->pid; ?>"> <i class="fa fa-lock" aria-hidden="true"></i>
                        </a>
                              <div class="part22">
                                  <a href="<?php echo base_url; ?>author-details/<?php echo $grand_children->pid; ?>">
                                     <?php echo substr($grand_children->name,0,15); ?>
                                  </a>
                              </div>
                              <div class="part33"></div>
                           </div>
                              <div class="img_small<?php echo $key; ?>">
                                <img src="<?php echo base_url; ?>public/assets/fonts/small.png">
                              </div>
                          </div>
              <?php      } 
                     }  ?>

                    </div>
                     <?php if($record_count >=2){  ?>

                      <div class="scroll_down_left_grand_8" id="scroll_down_left_grand_8<?php echo $i; ?>">
                          <ul class="pagination">
                             <li><i class="fa fa-angle-down" aria-hidden="true"></i></li>
                          </ul>
                      </div>
                    <?php } ?>
                  
              </div>
        <?php }else{ ?>
              <div class="lagre_div_ggchlideren" id="lagre_div_ggchlideren<?php echo $i; ?>">
                <div class="lagre_div21"> 
                  <div class="grandchild_warning1">
                      <b class="warning_text1">No Records Found!</b> 
                  </div>
                </div>
              </div>
       <?php } 
      } ?>

    </div>
    <script type="text/javascript">

      jQuery( document ).ready(function() {  //pa grand father one.
                jQuery("#scroll_down_left_grand_80").click(function(){  //Down
                jQuery('#scroll_up_left_grand_80').show();
                //var vlength =jQuery(this).prev().prev().children(".active").length;
              
             if(jQuery(".text .main_box_ggchlideren:last-child" ).hasClass('active')){
                 $("#scroll_down_left_grand_80").hide();
               }else{
                  jQuery(this).prev().children("div.active:last").next().show();
                  jQuery(this).prev().children("div.active:last").next().next().show();
                  jQuery(this).prev().children("div.active").hide();
                  jQuery(this).prev().children().removeClass("active");
                  jQuery(this).prev().children(":visible").addClass("active");
              }
            });  

            jQuery("#scroll_up_left_grand_80").click(function(){ // Up
                                        
                var t1 =jQuery(this).next().children("div.active").prev().attr("id");
                var t2 = jQuery(this).next().children("div.active").attr("id");
                  $("#scroll_down_left_grand_80").show();
                if(t1!=t2){
                 
                 jQuery(this).next().children("div.active:first").prev().show();
                 jQuery(this).next().children("div.active:first").prev().prev().show();

                 jQuery(this).next().children("div.active").hide();
                 jQuery(this).next().children().removeClass("active");
                 jQuery(this).next().children(":visible").addClass("active");
                }
             });  
          }); 

       jQuery( document ).ready(function() {  //greate grand father Two.
                jQuery("#scroll_down_left_grand_81").click(function(){  //Down
                jQuery('#scroll_up_left_grand_81').show();
                //var vlength =jQuery(this).prev().prev().children(".active").length;
                 
             if(jQuery(".text .main_box_ggchlideren:last-child" ).hasClass('active')){
                 $("#scroll_down_left_grand_80").hide();
               }else{
                  jQuery(this).prev().children("div.active:last").next().show();
                  jQuery(this).prev().children("div.active:last").next().next().show();
                  jQuery(this).prev().children("div.active").hide();
                  jQuery(this).prev().children().removeClass("active");
                  jQuery(this).prev().children(":visible").addClass("active");
              }
            });  

            jQuery("#scroll_up_left_grand_81").click(function(){ // Up
                                        
                var t1 =jQuery(this).next().children("div.active").prev().attr("id");
                var t2 = jQuery(this).next().children("div.active").attr("id");
                  $("#scroll_down_left_grand_81").show();
                if(t1!=t2){
                 
                 jQuery(this).next().children("div.active:first").prev().show();
                 jQuery(this).next().children("div.active:first").prev().prev().show();

                 jQuery(this).next().children("div.active").hide();
                 jQuery(this).next().children().removeClass("active");
                 jQuery(this).next().children(":visible").addClass("active");
                }
             });  
          }); 

       jQuery( document ).ready(function() {  //greate grand father Three.
                jQuery("#scroll_down_left_grand_82").click(function(){  //Down
                jQuery('#scroll_up_left_grand_82').show();
                //var vlength =jQuery(this).prev().prev().children(".active").length;
                 
             if(jQuery(".text .main_box_ggchlideren:last-child" ).hasClass('active')){
                 $("#scroll_down_left_grand_82").hide();
               }else{
                  jQuery(this).prev().children("div.active:last").next().show();
                  jQuery(this).prev().children("div.active:last").next().next().show();
                  jQuery(this).prev().children("div.active").hide();
                  jQuery(this).prev().children().removeClass("active");
                  jQuery(this).prev().children(":visible").addClass("active");
              }
            });  

            jQuery("#scroll_up_left_grand_82").click(function(){ // Up
                                        
                var t1 =jQuery(this).next().children("div.active").prev().attr("id");
                var t2 = jQuery(this).next().children("div.active").attr("id");
                  $("#scroll_down_left_grand_82").show();
                if(t1!=t2){
                 
                 jQuery(this).next().children("div.active:first").prev().show();
                 jQuery(this).next().children("div.active:first").prev().prev().show();

                 jQuery(this).next().children("div.active").hide();
                 jQuery(this).next().children().removeClass("active");
                 jQuery(this).next().children(":visible").addClass("active");
                }
             });  
          }); 

       jQuery( document ).ready(function() {  //greate grand father four.
                jQuery("#scroll_down_left_grand_83").click(function(){  //Down
                jQuery('#scroll_up_left_grand_83').show();
                //var vlength =jQuery(this).prev().prev().children(".active").length;
                 
             if(jQuery(".text .main_box_ggchlideren:last-child" ).hasClass('active')){
                 $("#scroll_down_left_grand_83").hide();
               }else{
                  jQuery(this).prev().children("div.active:last").next().show();
                  jQuery(this).prev().children("div.active:last").next().next().show();
                  jQuery(this).prev().children("div.active").hide();
                  jQuery(this).prev().children().removeClass("active");
                  jQuery(this).prev().children(":visible").addClass("active");
              }
            });  

            jQuery("#scroll_up_left_grand_83").click(function(){ // Up
                                        
                var t1 =jQuery(this).next().children("div.active").prev().attr("id");
                var t2 = jQuery(this).next().children("div.active").attr("id");
                  $("#scroll_down_left_grand_83").show();
                if(t1!=t2){
                 
                 jQuery(this).next().children("div.active:first").prev().show();
                 jQuery(this).next().children("div.active:first").prev().prev().show();

                 jQuery(this).next().children("div.active").hide();
                 jQuery(this).next().children().removeClass("active");
                 jQuery(this).next().children(":visible").addClass("active");
                }
             });  
          }); 
    </script>
<?php

    }

    public function first_parent_details(Request $req){

           $parent_pid = $req->pid;

           $educationalLineage = Details_model::educational_lineage($parent_pid);
          
            if(isset($educationalLineage['parent'])){
                  $count_parent = count($educationalLineage['parent']);
            }else{
                  $count_parent = 0;
            } 

           if(!empty($educationalLineage['parent'][0])){  ?>
             
              <div class="col-md-4">
                    <div class="title_child"><?php echo $count_parent; ?>&nbsp&nbsp&nbsp&nbspPARENT</div>
                      <div class="lagre_div1">
                        <!-- second methode show -->
                        <script type="text/javascript">
                          second_parent_methode();
                        </script>
                       <!-- End second methode show -->
                        <div class="scroll_up_secondparent" id="center" style="display: none;">
                           <ul class="pagination">
                            <li><i class="fa fa-angle-up" aria-hidden="true"></i></li>
                          </ul>
                       </div>
                       <div class="text">
                 <?php foreach ($educationalLineage['parent'] as $key => $parent) {
                       $author_pid[] =$parent->pid;

                      if($key <2){ ?>
                        <div class="main_box1 active main_box1_reverse" id="<?php echo $parent->pid; ?>">
                            <div class="name_box">
            
                              <a href="JavaScript:void(0)" class="part1" onclick="children_lock('<?php echo $parent->pid; ?>')"
                                id="locks<?php echo $parent->pid; ?>"> <i class="fa fa-unlock-alt" aria-hidden="true"></i></a>

                              <div class="part2">
                                <a href="<?php echo base_url; ?>author-details/<?php echo $parent->pid; ?>">
                                    <?php echo substr($parent->name,0,15); ?>
                                </a></div>
                              <div class="part3"></div>
                            </div>
                       </div> 
                
                    <?php  }else{ ?>

                         <div class="main_box1 main_box1_reverse" id="<?php echo $parent->pid; ?>" style="display: none;">
                            <div class="name_box">
                              <a href="JavaScript:void(0)" class="part1" onclick="children_lock('<?php echo $parent->pid; ?>')"
                               id="locks<?php echo $parent->pid; ?>"> <i class="fa fa-unlock-alt" aria-hidden="true"></i></a>

                              <div class="part2">
                                <a href="<?php echo base_url; ?>author-details/<?php echo $parent->pid; ?>">
                                    <?php echo substr($parent->name,0,15); ?>
                                </a></div>
                              <div class="part3"></div>
                            </div>
                       </div> 

                   <?php } } ?>
                 </div> 

                     <?php if($count_parent >=2){ ?>
                          <div class="scroll_down_secondparent" id="center">
                            <ul class="pagination">
                              <li><i class="fa fa-angle-down" aria-hidden="true"></i></li>
                            </ul>
                          </div>

                        <?php } ?>
                    </div>                     
                 </div>
              <!--  -------------------   grand paretn section -->

                <div class="col-md-8" id="grandparent_loader_first" style="display: none;">
                  <div class="load">
                    <div class="loader_lineage"></div>
                  </div>
              </div>



           <script type="text/javascript">
              /* parent for two div */

         jQuery( document ).ready(function() {
                jQuery(".scroll_down_secondparent").click(function(){  //Down
                   
                    jQuery('.scroll_up_secondparent').show();
                     var vlength =jQuery(this).prev().prev().children(".active").length;
                             
                   if(jQuery( ".text .main_box1:last-child" ).hasClass('active')){
                       $(".scroll_down_secondparent").hide();
               }else{
                    
                    var divposition = jQuery( "div .scroll_down_left" ).attr('id');
                    var id = [];
                    id[0] = jQuery("div[class='main_box1 active']").next().next().attr('id');

                    if(jQuery("div[class='main_box1 active']").next().next().next().attr('id') !== 'undefined'){
                       id[1] = jQuery("div[class='main_box1 active']").next().next().next().attr('id');
                    }

                  jQuery(this).prev().children("div.active:last").next().show();
                  jQuery(this).prev().children("div.active:last").next().next().show();
                  jQuery(this).prev().children("div.active").hide();
                  jQuery(this).prev().children().removeClass("active");
                  jQuery(this).prev().children(":visible").addClass("active");
                 
                  var divposition = jQuery( "div .scroll_down_secondparent" ).attr('id');
                  second_parent_methode(divposition);

                 
                }
            });

                  jQuery(".scroll_up_secondparent").click(function(){ // Up
             
                var vlength=$(".scroll_up_secondparent").next().next().children(".active").length;
                           
                var t1 =jQuery(this).next().children("div.active").prev().attr("id");
                var t2 = jQuery(this).next().children("div.active").attr("id");
                $(".scroll_down_secondparent").show();
               
                   var id = [];

                    if(jQuery("div[class='main_box1 active']").prev().prev().attr('id') !== 'undefined'){
                       id[0] = jQuery("div[class='main_box1 active']").prev().prev().attr('id');
                    }
                      id[1] = jQuery("div[class='main_box1 active']").prev().attr('id');
                
                if(t1!=t2){
                 
                    var divposition = jQuery( "div .scroll_up_secondparent" ).attr('id');
                    second_parent_methode(divposition);
             

                 jQuery(this).next().children("div.active:first").prev().show();
                 jQuery(this).next().children("div.active:first").prev().prev().show();

              //}
                 jQuery(this).next().children("div.active").hide();
                 jQuery(this).next().children().removeClass("active");
                 jQuery(this).next().children(":visible").addClass("active");
                }
             });
          }); /* End for Parent two div*/
           </script>
          <?php  }
         
        }


        // thired parent methode

    public function second_parent_details(Request $req){

        $div_position = $req->divposition;

        $author_pid   = $req->pid;

      if(!empty($author_pid[0])){
        $grand_parent_grand1 = Details_model::educational_lineage($author_pid[0]);
        $grand_parent_grand1 = count($grand_parent_grand1['parent']);
      }else{
        $grand_parent_grand1 =0;
      }  
                     
     if(!empty($author_pid[1])){
       $grand_parent_grand2 = Details_model::educational_lineage($author_pid[1]);
       if(!empty($grand_parent_grand2['parent'])){
           $grand_parent_grand2 = count($grand_parent_grand2['parent']);
       }
      
     }else{
      $grand_parent_grand2 = 0;
     }   

    $total_grand_parent_grand = $grand_parent_grand1 + $grand_parent_grand2;
      ?>

          <div class="text" id="grand_parent">
                <div class="col-md-4">
                  <div class="title_child">
                    <?php echo $total_grand_parent_grand; ?>&nbsp;&nbsp;&nbsp;&nbsp;GRANDPARENT
                  </div>

                      <?php  
                          for ($i=0; $i < 2; $i++) { 
                    
                             $grand_parent = Details_model::educational_lineage($author_pid[$i]);

                             if(!empty($grand_parent['parent'][0])){  

                              if($i<=1){ 
                                $total_grand_parent = count($grand_parent['parent']);
                       ?>
                      <div class="lagre_div2" id="grand_parent_div<?php echo $i; ?>">
                      <div class="scroll_up_left_grand_parent<?php echo $i; ?>" id="left" style="display: none;">
                         <ul class="pagination">
                          <li><i class="fa fa-angle-up" aria-hidden="true"></i></li>
                        </ul>
                     </div>

                  <div class="text">
                   <?php foreach ($grand_parent['parent'] as $grand_key => $grand_parent) { 
                          if($grand_key <2){
                    ?>
                         <div class="main_box22 active main_box22_reverse" id="<?php echo $grand_parent->pid; ?>">
                              <div class="name_box_new">
                               <a href="JavaScript:void(0)" class="part1" onclick="children_lock('<?php echo $grand_parent->pid; ?>')" id="locks<?php echo $grand_parent->pid; ?>"> 
                              <i class="fa fa-unlock-alt" aria-hidden="true"></i></a>
                                <div class="part2">
                               <a href="<?php echo base_url; ?>author-details/<?php echo $grand_parent->pid; ?>">
                                <?php echo substr($grand_parent->name,0,15); ?> </a></div>
                                    <div class="part3"></div>
                                    <?php if($grand_key == 0){ ?>
                                     <div class="medium_img_0 right_r">
                                        <img src="<?php echo base_url; ?>public/assets/fonts/parent_left.png">
                                    </div>
                                  <?php } ?>
                                </div> 
                          </div> 
                        <?php  }else{ ?>
                           <div class="main_box22 main_box22_reverse" id="<?php echo $grand_parent->pid; ?>" style="display: none;">
                              <div class="name_box_new">
                               <a href="JavaScript:void(0)" class="part1" onclick="children_lock('3166')" id="locks3166"> 
                              <i class="fa fa-unlock-alt" aria-hidden="true"></i></a>
                                <div class="part2">
                               <a href="<?php echo base_url; ?>author-details/<?php echo $grand_parent->pid; ?>">
                               <?php echo substr($grand_parent->name,0,15); ?> </a></div>
                                    <div class="part3"></div>
                                     <div class="medium_img_0">
                                 <!--  <img src="<?php //echo base_url; ?>public/assets/fonts/parent_left.png"> -->
                               </div>
                                </div> 
                          </div> <?php 
                           }  
                       } ?>
                        
                      </div>
                  <?php  
                      if($total_grand_parent >=2){ ?>
                    <div class="scroll_down_left_grand_parent<?php echo $i; ?>" id="left">
                      <ul class="pagination">
                        <li><i class="fa fa-angle-down" aria-hidden="true"></i></li>
                      </ul>
                    </div>
                  <?php } ?>
                </div>
             <?php } }else{ ?>

                 <div class="lagre_div2" id="grand_children_div<?php echo $i; ?>">
                  <b class="warning_text">No Records Found!</b></div>

              <?php } } ?>
                        <?php 
                           if($div_position == 'right'){ ?>
                              <script type="text/javascript">
                                     grand_parent_slider();
                              </script>
                         <?php  } ?>
            </div>
          </div>
          <script type="text/javascript">
            

              jQuery( document ).ready(function() {  //grand father for top.
                jQuery(".scroll_down_left_grand_parent0").click(function(){  //Down 
                jQuery('.scroll_up_left_grand_parent0').show();
                var vlength =jQuery(this).prev().prev().children(".active").length;

               if(jQuery(".text .main_box22:last-child" ).hasClass('active')){
                 $(".scroll_down_left_grand_parent0").hide();
               }else{

                  jQuery(this).prev().children("div.active:last").next().show();
                  jQuery(this).prev().children("div.active:last").next().next().show();
                  jQuery(this).prev().children("div.active").hide();
                  jQuery(this).prev().children().removeClass("active");
                  jQuery(this).prev().children(":visible").addClass("active");

                 var divposition = jQuery( "div .scroll_down_left_grand_parent0" ).attr('id');
                 if(divposition == 'center'){
                     grand_parent_slider();
                 }
                 
               }
            });  

            jQuery(".scroll_up_left_grand_parent0").click(function(){ // Up
                                        
                var t1 =jQuery(this).next().children("div.active").prev().attr("id");
                var t2 = jQuery(this).next().children("div.active").attr("id");
                  $(".scroll_down_left_grand_parent0").show();
                //alert(t1+"=="+t2);
                if(t1!=t2){

                 jQuery(this).next().children("div.active:first").prev().show();
                 jQuery(this).next().children("div.active:first").prev().prev().show();
                 jQuery(this).next().children("div.active").hide();
                 jQuery(this).next().children().removeClass("active");
                 jQuery(this).next().children(":visible").addClass("active");

                 var divposition = jQuery( "div .scroll_up_left_grand_parent0" ).attr('id');
                 if(divposition == 'center'){
                     grand_parent_slider();
                 }

                }
             }); 

             jQuery(".scroll_down_left_grand_parent1").click(function(){  //Down 
                jQuery('.scroll_up_left_grand_parent1').show();
                var vlength =jQuery(this).prev().prev().children(".active").length;

               if(jQuery(".text .main_box22:last-child" ).hasClass('active')){
                 $(".scroll_down_left_grand_parent0").hide();
               }else{

                  jQuery(this).prev().children("div.active:last").next().show();
                  jQuery(this).prev().children("div.active:last").next().next().show();
                  jQuery(this).prev().children("div.active").hide();
                  jQuery(this).prev().children().removeClass("active");
                  jQuery(this).prev().children(":visible").addClass("active");

                 var divposition = jQuery( "div .scroll_down_left_grand_parent1" ).attr('id');
                 if(divposition == 'center'){
                     grand_parent_slider();
                 }
                 
               }
            }); 

              jQuery(".scroll_up_left_grand_parent1").click(function(){ // Up
                                        
                var t1 =jQuery(this).next().children("div.active").prev().attr("id");
                var t2 = jQuery(this).next().children("div.active").attr("id");
                  $(".scroll_down_left_grand_parent0").show();
                //alert(t1+"=="+t2);
                if(t1!=t2){

                 jQuery(this).next().children("div.active:first").prev().show();
                 jQuery(this).next().children("div.active:first").prev().prev().show();
                 jQuery(this).next().children("div.active").hide();
                 jQuery(this).next().children().removeClass("active");
                 jQuery(this).next().children(":visible").addClass("active");

                 var divposition = jQuery( "div .scroll_up_left_grand_parent1" ).attr('id');
                 if(divposition == 'center'){
                     grand_parent_slider();
                 }

                }
             });
          });
          </script>
    <?php

    }

    public function great_grandparent_pid(Request $req){

        $first_grand_pid = $req->first_grand;
        $second_grand_pid = $req->second_grand; 


        if(!empty($first_grand_pid[0])){
            $first_grand_pid[0] = $first_grand_pid[0];
        }else{
          $first_grand_pid[0] = 'aaa';
        }

         if(!empty($first_grand_pid[1])){
            $first_grand_pid[1] = $first_grand_pid[1];
        }else{
          $first_grand_pid[1] = 'aaa';
        }

         if(!empty($second_grand_pid[0])){
            $second_grand_pid[0] = $second_grand_pid[0];
        }else{
          $second_grand_pid[0] = 'aaa';
        }

        if(!empty($second_grand_pid[1])){
            $second_grand_pid[1] = $second_grand_pid[1];
        }else{
          $second_grand_pid[1] = 'aaa';
        }



        if($first_grand_pid[0] && $second_grand_pid[0]){
             $thired_grand_id = array_merge($first_grand_pid, $second_grand_pid);
        }
        ?>

       <div class="col-md-4">
        <div class="title_child">&nbsp&nbsp&nbsp&nbspGREAT GRANDPARENT</div>
      <?php 
        for ($i=0; $i < count($thired_grand_id); $i++) { 

            if(!empty($thired_grand_id[$i])){
                 $grand_children = Details_model::educational_lineage($thired_grand_id[$i]);
               }else{
                $grand_children['parent'] = [];
               }
                 if(!empty($grand_children['parent'])){
                   $record_count = count($grand_children['parent']);
                 }else{
                  $record_count = 1;
                 }
              
               
             if(!empty($grand_children['parent'])){ ?>

                  <div class="lagre_div_ggchlideren" id="lagre_div_ggchlideren<?php echo $i; ?>">
                    <div class="scroll_up_left_grand_8" id="scroll_up_left_grand_8<?php echo $i; ?>" style="display: none;">
                        <ul class="pagination">
                          <li><i class="fa fa-angle-up" aria-hidden="true"></i></li>
                        </ul>
                    </div>
                    <div class="text">
                 <?php foreach($grand_children['parent'] as $key=>$grand_children){ 
                       if($key<2){ ?>
                              
                            <div class="main_box_ggchlideren active main_box_ggchlideren_revere" id="<?php echo $grand_children->pid; ?>">
                                <div class="name_box_ggchlideren">
                                <!--   <div class="part11"><i class="fa fa-lock" aria-hidden="true"></i></div> -->
                                   <a href="JavaScript:void(0)" class="part11" onclick="children_lock('<?php echo $grand_children->pid; ?>')"id="locks<?php echo $grand_children->pid; ?>"> 
                                    <i class="fa fa-lock" aria-hidden="true"></i>
                                  </a>

                                   <div class="part22">
                                    <a href="<?php echo base_url; ?>author-details/<?php echo $grand_children->pid; ?>">
                                       <?php echo substr($grand_children->name,0,15); ?>
                                    </a>
                                   </div>
                                   <div class="part33"></div>
                               </div>
                               <?php
                                   if($key % 2 ==0){ ?>
                                        <div class="img_small_left">
                                           <img src="<?php echo base_url; ?>public/assets/fonts/small_left.png">
                                        </div>
                                 <?php  }
                                ?>
                               
                            </div>
    
                  <?php  }else{ ?>
                         
                          <div class="main_box_ggchlideren main_box_ggchlideren_revere" id="<?php echo $grand_children->pid; ?>" style="display: none;">
                            <div class="name_box_ggchlideren">
                              <!-- <div class="part11"><i class="fa fa-lock" aria-hidden="true"></i></div> -->
                        <a href="JavaScript:void(0)" class="part11" onclick="children_lock('<?php echo $grand_children->pid; ?>')"id="locks<?php echo $grand_children->pid; ?>"> <i class="fa fa-lock" aria-hidden="true"></i>
                        </a>
                              <div class="part22">
                                  <a href="<?php echo base_url; ?>author-details/<?php echo $grand_children->pid; ?>">
                                     <?php echo substr($grand_children->name,0,15); ?>
                                  </a>
                              </div>
                              <div class="part33"></div>
                           </div>
                               <?php
                                   if($key % 2 ==0){ ?>
                                        <div class="img_small_left">
                                           <img src="<?php echo base_url; ?>public/assets/fonts/small_left.png">
                                        </div>
                                 <?php  }
                                ?>
                          </div>
              <?php      } 
                     }  ?>

                    </div>
                     <?php if($record_count >=2){  ?>

                      <div class="scroll_down_left_grand_8" id="scroll_down_left_grand_8<?php echo $i; ?>">
                          <ul class="pagination">
                             <li><i class="fa fa-angle-down" aria-hidden="true"></i></li>
                          </ul>
                      </div>
                    <?php } ?>
                  
              </div>
        <?php }else{ ?>
              <div class="lagre_div_ggchlideren" id="lagre_div_ggchlideren<?php echo $i; ?>">
                <div class="lagre_div21"> 
                  <div class="grandchild_warning1">
                      <b class="warning_text1">No Records Found!</b> 
                  </div>
                </div>
              </div>
       <?php } 
      } ?>

    </div>
    <script type="text/javascript">

      jQuery( document ).ready(function() {  //greate grand father one.
                jQuery("#scroll_down_left_grand_80").click(function(){  //Down
                jQuery('#scroll_up_left_grand_80').show();
                //var vlength =jQuery(this).prev().prev().children(".active").length;
                
             if(jQuery(".text .main_box_ggchlideren:last-child" ).hasClass('active')){
                 $("#scroll_down_left_grand_80").hide();
               }else{
                  jQuery(this).prev().children("div.active:last").next().show();
                  jQuery(this).prev().children("div.active:last").next().next().show();
                  jQuery(this).prev().children("div.active").hide();
                  jQuery(this).prev().children().removeClass("active");
                  jQuery(this).prev().children(":visible").addClass("active");
              }
            });  

            jQuery("#scroll_up_left_grand_80").click(function(){ // Up
                                        
                var t1 =jQuery(this).next().children("div.active").prev().attr("id");
                var t2 = jQuery(this).next().children("div.active").attr("id");
                  $("#scroll_down_left_grand_80").show();
                if(t1!=t2){
                 
                 jQuery(this).next().children("div.active:first").prev().show();
                 jQuery(this).next().children("div.active:first").prev().prev().show();

                 jQuery(this).next().children("div.active").hide();
                 jQuery(this).next().children().removeClass("active");
                 jQuery(this).next().children(":visible").addClass("active");
                }
             });  
          }); 

       jQuery( document ).ready(function() {  //greate grand father Two.
                jQuery("#scroll_down_left_grand_81").click(function(){  //Down
                jQuery('#scroll_up_left_grand_81').show();
                //var vlength =jQuery(this).prev().prev().children(".active").length;
                 
             if(jQuery(".text .main_box_ggchlideren:last-child" ).hasClass('active')){
                 $("#scroll_down_left_grand_80").hide();
               }else{
                  jQuery(this).prev().children("div.active:last").next().show();
                  jQuery(this).prev().children("div.active:last").next().next().show();
                  jQuery(this).prev().children("div.active").hide();
                  jQuery(this).prev().children().removeClass("active");
                  jQuery(this).prev().children(":visible").addClass("active");
              }
            });  

            jQuery("#scroll_up_left_grand_81").click(function(){ // Up
                                        
                var t1 =jQuery(this).next().children("div.active").prev().attr("id");
                var t2 = jQuery(this).next().children("div.active").attr("id");
                  $("#scroll_down_left_grand_81").show();
                if(t1!=t2){
                 
                 jQuery(this).next().children("div.active:first").prev().show();
                 jQuery(this).next().children("div.active:first").prev().prev().show();

                 jQuery(this).next().children("div.active").hide();
                 jQuery(this).next().children().removeClass("active");
                 jQuery(this).next().children(":visible").addClass("active");
                }
             });  
          }); 

       jQuery( document ).ready(function() {  //greate grand father Three.
                jQuery("#scroll_down_left_grand_82").click(function(){  //Down
                jQuery('#scroll_up_left_grand_82').show();
                //var vlength =jQuery(this).prev().prev().children(".active").length;
                 
             if(jQuery(".text .main_box_ggchlideren:last-child" ).hasClass('active')){
                 $("#scroll_down_left_grand_82").hide();
               }else{
                  jQuery(this).prev().children("div.active:last").next().show();
                  jQuery(this).prev().children("div.active:last").next().next().show();
                  jQuery(this).prev().children("div.active").hide();
                  jQuery(this).prev().children().removeClass("active");
                  jQuery(this).prev().children(":visible").addClass("active");
              }
            });  

            jQuery("#scroll_up_left_grand_82").click(function(){ // Up
                                        
                var t1 =jQuery(this).next().children("div.active").prev().attr("id");
                var t2 = jQuery(this).next().children("div.active").attr("id");
                  $("#scroll_down_left_grand_82").show();
                if(t1!=t2){
                 
                 jQuery(this).next().children("div.active:first").prev().show();
                 jQuery(this).next().children("div.active:first").prev().prev().show();

                 jQuery(this).next().children("div.active").hide();
                 jQuery(this).next().children().removeClass("active");
                 jQuery(this).next().children(":visible").addClass("active");
                }
             });  
          }); 

       jQuery( document ).ready(function() {  //greate grand father four.
                jQuery("#scroll_down_left_grand_83").click(function(){  //Down
                jQuery('#scroll_up_left_grand_83').show();
                //var vlength =jQuery(this).prev().prev().children(".active").length;
                 
             if(jQuery(".text .main_box_ggchlideren:last-child" ).hasClass('active')){
                 $("#scroll_down_left_grand_83").hide();
               }else{
                  jQuery(this).prev().children("div.active:last").next().show();
                  jQuery(this).prev().children("div.active:last").next().next().show();
                  jQuery(this).prev().children("div.active").hide();
                  jQuery(this).prev().children().removeClass("active");
                  jQuery(this).prev().children(":visible").addClass("active");
              }
            });  

            jQuery("#scroll_up_left_grand_83").click(function(){ // Up
                                        
                var t1 =jQuery(this).next().children("div.active").prev().attr("id");
                var t2 = jQuery(this).next().children("div.active").attr("id");
                  $("#scroll_down_left_grand_83").show();
                if(t1!=t2){
                 
                 jQuery(this).next().children("div.active:first").prev().show();
                 jQuery(this).next().children("div.active:first").prev().prev().show();

                 jQuery(this).next().children("div.active").hide();
                 jQuery(this).next().children().removeClass("active");
                 jQuery(this).next().children(":visible").addClass("active");
                }
             });  
          }); 
    </script>
<?php

    }
}   
  
