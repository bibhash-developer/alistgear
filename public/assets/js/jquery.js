
setTimeout( function(){ $('#error-message').hide(); $("#error-message").remove(); } , 4000);


function input_search_affiliation()
 {  
    var name     = $('#txt-Search2').val();
    var myLength =  jQuery("#txt-Search2").val().length;

    if(name){
     if(myLength >=2){
      $.ajax({ 
        type : "GET",
        url  : "search-signup-affiliation",
        data : { name: name},
        success: function(data){
              $("#suggest-alert2").show();
              $("#suggest-alert2").html(data);
              $("#txt-Search2").css("background","#FFF");
              }
           });
        }
    }
}

function selectNameHeader(val) {
$("#txtSearch").val(val);
$("#suggesstion-box").hide();
}
function selectName(val) {
$("#txtSearch").val(val);
$("#suggesstion-box").hide();

}

 /* Show University Section Start*/

      function check_univ_first(){
            var radio = $('input[name=optradio]:checked').val();
            var univ  = $('#university').val();
            var dep   = $('#department').val();
            var topa  = $('#topicArea').val();

           if(radio == 'Yes'){
              if(! univ && ! dep && ! topa){ 
                                 
                $('#univ').show();
                $('#dept').show();
                $('#topa').show();
             }else if(! univ){
                 $('#univ').show();
                 $('#topa').hide(); 
                 $('#dept').hide();
             }else if(! dep){
                 $('#dept').show();
                 $('#topa').hide();
                 $('#univ').hide();
             }else if(! topa){
                 $('#topa').show();
                 $('#univ').hide();
                 $('#dept').hide();
             }else{
                 $('#second-slide').show();
                 $('#first-slide').hide();
             }
            
          }else{
                 $('#second-slide').show();
                 $('#first-slide').hide();
                 
          }    
     }

           /* Show Company Section Start*/

      function check_comp_second(){
            var aiml         = $('input[name=aiml]:checked').val();
            var company      = $('#company').val();
            var department   = $('#com-department').val();
            var jobtitle     = $('#jobtitle').val();

           if(aiml == 'Yes'){
              if(! company && ! department && ! jobtitle){ 
                                 
                $('#jobt').show();
                $('#com-dept').show();
                $('#comp').show();
             }else if(! company){
                 $('#comp').show();
                 $('#com-dept').hide();
                 $('#jobt').hide();
             }else if(! department){
                 $('#com-dept').show();
                 $('#comp').hide();
                 $('#jobt').hide();
             }else if(! jobtitle){
                 $('#jobt').show();
                 $('#comp').hide();
                 $('#com-dept').hide();
             }else{
                 $('#third-slide').show();
                 $('#first-slide').hide();
                 $('#second-slide').hide();
             }
            
          }else{
                 $('#third-slide').show();
                 $('#first-slide').hide();
                 $('#second-slide').hide();
                
          }
     }
        
        /* Show City Section Start*/
      function check_city_third(){
            
            var univ  = $('#university').val();
            var dep   = $('#department').val();
            var topa  = $('#topicArea').val();

            var company   = $('#company').val();
            var com_dep   = $('#com-department').val();
            var jobtitle  = $('#jobtitle').val();

            var city     = $('#city').val();
            var country  = $('#country').val();
            var cnt_id   = country.split("&&");

            var state    = $('#state').val(); 
            var weburl   = $('#weburl').val();
            var giturl   = $('#giturl').val();

           
              if(! city && ! cnt_id[1]){            
                $('#city-error').show();
                $('#country-error').show();
                
             }else if(! city){
               $('#city-error').show();
               $('#country-error').hide();

             }else if(! cnt_id[1]){
               $('#country-error').show();
               $('#city-error').hide();

             }else{

               window.location = '/create-profile-sub?univ=' +univ + '&&dep=' + dep + '&&topa=' + topa + '&&company=' + 
               company + '&&com_dep=' + com_dep + '&&jobtitle=' + jobtitle  + '&&city=' + city + '&&state=' + state + '&&country=' 
               + cnt_id[1] + '&&weburl=' + weburl + '&&giturl=' + giturl;     
              }
          } /* End Create your Profile*/

         /* Fetch All State Name */
          function select_state_name(){

            var country_id  = $('#country').val();
            var cnt_id      = country_id.split("&&");
               //alert("Dddddd" + cnt_id[0]); exit;

               $.ajax({
                 type: "GET",
                 url: "fetch-state-name",
                 data: { country_id: cnt_id[0]},
                 success: function(data){
                  //alert(data);
                    $("#state").html(data);
                    
                   }
              });
          }    /* End All State Name */


    /*Publication Search */

  $(document).ready(function()
  {
      $("#txtSearchs").keyup(function(){
          publication_details();  
      });

      $("#txtSearchsBTns").click(function(){
       
          publication_details();
          
      });


  });

 function publication_details() {
        var name     = $('#txtSearchs').val(); 
        var pid      = $('#txtSearchs1').val();
        
        var myLength =  jQuery("#txtSearchs").val().length;
        //alert(name + pid);
        if(myLength >=2){ 
             $.ajax({
                    type: "GET",
                    url: "search-title",
                    data: { search_title: name, pid:pid },
                    success: function(data){ 
                      //alert(data);

                    if(data){
                      $("#second-pub").show();
                      $(".table").hide();
                      $("#second-pub").html(data);
                   }
                }
            });
          }
          if(myLength == 0){
            //alert(myLength);
             $("#second-pub").hide();
             $(".table").show();
          }
    } /* End Publication Search */


/*   search header   */

$(document).ready(function(){
    $("#author_search").keyup(function(){
        var name     = $('#author_search').val(); 
        var myLength =  jQuery("#author_search").val().length;
               
    if(myLength >=2){ 
        $.ajax({
                type: "GET",
                url: "search-header",
                data: { name: name},
        success: function(data){
          //alert(data);

            $("#suggesstion-box").show();
            $("#suggesstion-box").html(data);
            $("#txtSearch").css("background","#FFF"); 
            $("#message-header").css("display", "none");
            $("#header-msg-one").css("display", "none");
           }
        });
      }
    });
});

 function select_affiliation_name(val) {
  
    $("#txt-Search2").val(val);
    $("#suggest-alert2").hide();
   }

function selectmyprofile(val) {
  
    $("#author_search").val(val);
    $("#suggesstion-box").hide();
   }

function countryName()
  {
   var id = $('#country').val();
   //alert(id);
   $.ajax({
          type  : "GET",
          url   :"selectCountry",
          data  : {id: id},
        success : function(data)
          {
            //alert(data);
             $('#state').html(data);
          }
   });
}


/*   search Profile  */
function input_search_profile()
{
  var name     = $('#txt-Search1').val();
  var myLength =  jQuery("#txt-Search1").val().length;
  if( myLength >=2){
   $.ajax({

      type: "GET",
      url : "search-home-profile",
      data: { name: name},
    success: function(data){
          $("#suggest-alert").show();
          $("#suggest-alert").html(data);
          $("#txt-Search1").css("background","#FFF");
          $("#profile_msg").css("display", "none");
          $("#suggest-alert2").css("display", "none");
          $("#suggesstion-box").css("display", "none");

         }
       });
  }
}

function selectNameprofile(val) {
    $("#txt-Search1").val(val);
    $("#suggest-alert").hide();
    //window.location.href = "search-profile-link?pid=" + val;
    }

     /*   search Network  */

  function input_search_network()
  {
     var name     = $('#txt-Search2').val();
     var myLength =  jQuery("#txt-Search2").val().length;
      
    if(name){
     if(myLength >=2){
      $.ajax({
        type : "GET",
        url  : "search-home-network",
        data : { name: name},
        success: function(data){

                  $("#suggest-alert2").show();
                  $("#suggest-alert2").html(data);
                  $("#txt-Search2").css("background","#FFF");
                  $("#message").css("display", "none");
                  $("#network-msg-one").css("display", "none");
                  $("#suggest-alert").css("display", "none");
                  $("#suggesstion-box").css("display", "none");
                }
           });
         }
      }
  }

  function selectNamenetwork(val) {
    $("#txt-Search2").val(val);
    $("#suggest-alert2").hide();
    //window.location.href = "search-network-link?pid=" + val;
   }

    function myProfile(){

       var name     = $('#fullname').val();
       var myLength =  jQuery("#fullname").val().length;

      if(name){
       if(myLength >=2){
        $.ajax({
          type : "GET",
          url  : "search-my-profile",
          data : { name: name},
          success: function(data){
                $("#suggest-alert3").show();
                $("#suggest-alert3").html(data);
                $("#fullname").css("background","#FFF");
                $("#message-one").css("display", "none");
                $("#message-two").css("display", "none");
                }
             });
           }
        }
    }

/*   search List of topic options  */

  $(document).ready(function(){
      $("select#sel1").change(function(){
          var selectedtopic = $(this).children("option:selected").val();
           $('#loader').show();
           $.ajax({ 
                  type : "GET",
                  url  : "focus-area",
                  data : { selectedtopic: selectedtopic},
                  success: function(data){
                     $('#loader').hide();
                     $("#map").html(data);
                }
          });
      });
  });

/*   search network author  */

$(document).ready(function(){
    $("#network-search").keyup(function(){
        var name     = $('#network-search').val(); 
        var myLength =  jQuery("#network-search").val().length;
              
    if(myLength >=2){ 
        $.ajax({
                type: "GET",
                url: "search-header-network",
                data: { name: name},
        success: function(data){
          
              $("#suggesstion-network").show();
              $("#suggesstion-network").html(data);
           }
        });
      }
    });
});

function selectnetwork(val) {
  
    $("#network-search").val(val);
    $("#suggesstion-network").hide();

       var name     = $('#network-search').val(); 
        var myLength =  jQuery("#network-search").val().length;
        $('#loader').show();

    if(myLength >=2){ 
        $.ajax({
                type: "GET",
                url: "search-geographic-network",
                data: { name: name},
        success: function(data){
           $('#loader').hide();
            $("#map").html(data);
            $("#network-search").val('');
           }
        });
      }
   }

   /*   individual network search */

$(document).ready(function(){
    $("#individual-search").click(function(){
        var name     = $('#network-search').val(); 
        var myLength =  jQuery("#network-search").val().length;
        $('#loader').show();

    if(myLength >=2){ 
        $.ajax({
                type: "GET",
                url: "search-geographic-network",
                data: { name: name},
        success: function(data){
            $('#loader').hide();
            $("#map").html(data);
            $("#network-search").val('');
            $("#suggesstion-network").hide();
           }
           
        });
      }
    });
});

  // Add videos that you’re interested in.

$(document).ready(function() {
      $(".add-more").click(function(){ 
          var html = $(".copy").html();
          $(".after-add-more").before(html);
      });

      $("body").on("click",".remove",function(){ 
          $(this).parents(".showInputNew").remove();
      });


    });

  $(function () {
  
  $('#registration').on('submit', function (e) {
     e.preventDefault();
        e.preventDefault();
            $.ajax({
                  type: 'post',
                  url: 'video-url',
                  data: $('form').serialize(),
                  success: function (data) {
                      $('#error-message-video').html(data);
                      $("#registration")[0].reset();
                      location.reload(true);
                  }
            });
   });


    /* Update Profile Details */

    $('#editModal-profile').on('submit', function (e) {

        e.preventDefault();
              $.ajax({
                    url: "editModal-profile", // Url to which the request is send
                    type: "POST",             // Type of request to be send, called as method
                    data: new FormData(this), // Data sent to server, a set of key/value pairs (i.e. form fields and values)
                    contentType: false,       // The content type used when sending data to the server.
                    cache: false,             // To unable request pages to be cached
                    processData:false,        // To send DOMDocument or non processed data file it is set to false
                    success: function(data)   // A function to be called if request succeeds
                    {
                     $('#error-message-update').html(data);
                      location.reload(true);
                    }
             });
        });
  });

  /* Add Parent Details */ 
  
   $(document).ready(function() {
    var max_fields_limit      = 10; //set limit for maximum input fields
    var x = 1; //initialize counter for text box
    $('.add_circle').click(function(e){ //click event on add more fields button having class add_more_button
        e.preventDefault();
        if(x < max_fields_limit){ //check conditions
            x++; //counter increment
             var class_one = "affiliation"+x; var class_two = "affiliation-response"+x;  var fun_metode = "add_affiliation('"+class_one+"');";
            $('.wrapper').append('<div class="add_parent"><input type="text" placeholder="Add Parents Name Here" id="parent_name[]" name="parent_name[]" class="form-control display_input" required/><a href="#" class="minus_circle">-</a><input type="text" placeholder="Add Affiliation Here" name="address[]" id="'+class_one+'" class="form-control display_input" onkeyup="'+fun_metode+'" required/><div id="'+class_two+'"> </div><div class="row"><div class="col-md-6"><div class="form-group display_input pad_r"><input type="text" class="form-control display_input input_width" id="city[]" placeholder="Add City Here" name="city[]" required/></div></div><div class="col-md-6"><div class="form-group display_input pad_r"><input type="text" class="form-control display_input" id="state[]" placeholder="Add State Here" name="state[]" required/></div></div></div><input type="text" placeholder="Add Country Here" name="country[]" id="country[]" class="form-control display_input" required/></div>'); //add input field
        }
    });  
    $('.wrapper').on("click",".minus_circle", function(e){ //user click on remove text links
        e.preventDefault(); $(this).parent('div').remove(); x--;
    })
});

jQuery("#AddParent-profile").submit(function( event ) {
   event.preventDefault();
   
    $.ajax({
            type: 'post',
            url: 'add-parent',
            data: $('form').serialize(),
            success: function (data) {
             
              $('#error-message-addParent').html(data);
               location.reload(true);
              $("#AddParent-profile")[0].reset();
            }
    });
});      /* End add parent */


    /* add children */

 $(document).ready(function() {
    var max_fields_limit      = 10; //set limit for maximum input fields
    var x = 1; //initialize counter for text box
    $('.add_circle_child').click(function(e){ //click event on add more fields button having class add_more_button
        e.preventDefault();
        if(x < max_fields_limit){ //check conditions
            x++; //counter increment
            var class_one = "child_affiliation"+x; var class_two = "child_affiliation_response"+x;  var fun_metode = "add_affiliation('"+class_one+"');";
            $('.wrapper_child').append('<div class="add_parent"><input type="text" placeholder="Add Parents Name Here" name="parent[]" class="form-control display_input_child" required/><a href="#" class="minus_circle_child">-</a><input type="text" placeholder="Add Affiliation Here" name="location[]" id="'+class_one+'" onkeyup="'+fun_metode+'" class="form-control display_input_child" required/><div id="'+class_two+'"> </div><div class="row"><div class="col-md-6"><div class="form-group display_input pad_r"><input type="text" class="form-control display_input input_width" id="city[]" placeholder="Add City Here" name="city[]" required/></div></div><div class="col-md-6"><div class="form-group display_input pad_r"><input type="text" class="form-control display_input" id="state[]" placeholder="Add State Here" name="state[]" required/></div></div></div><input type="text" placeholder="Add Country Here" name="country[]" class="form-control display_input_child" required/></div>'); //add input field
        }
    });  
    $('.wrapper_child').on("click",".minus_circle_child", function(e){ //user click on remove text links
        e.preventDefault(); $(this).parent('div').remove(); x--;
    })
});

jQuery("#AddChildren-profile").submit(function( event ) {
   event.preventDefault();
    $.ajax({
            type: 'post',
            url: 'add-children',
            data: $('#AddChildren-profile').serialize(),
            success: function (data) { 

              $('#error-message-AddChildren').html(data);
              location.reload(true);
              $("#AddChildren-profile")[0].reset();
            }
    });
});      /* End add children */


   /*  Add Collaborators */

jQuery("#AddCollaborators-profile").submit(function( event ) {
   event.preventDefault();
   
    $.ajax({
            type: 'post',
            url: 'add-collaborators',
            data: $('form').serialize(),
            success: function (data) { 

              $('#error-message-collaborators').html(data);
              $("#AddCollaborators-profile")[0].reset();
              location.reload(true);
            }
    });
});      /* End add Collaborators */
   
/*  Add Publications Here. */


$(document).ready(function() {
    var max_fields_limit      = 10; //set limit for maximum input fields
    var x = 1; //initialize counter for text box
    $('.add_circle_Publications').click(function(e){ //click event on add more fields button having class add_more_button
        e.preventDefault();
        if(x < max_fields_limit){ //check conditions
            x++; //counter increment
            $('.wrapper_Publications').append('<div><div class="wrapper_Publications"> <div class="form-group text_top_margin_Publications"><label for="sel1" class="label_left">Type of publication</label><select class="form-control" id="publications" name="publications[]"><option value="Paper">Paper</option><option value="Book">Book</option><option value="Blog post">Blog post</option></select></div><a href="#" class="minus_circle_Publications">-</a><div class="form-group"><label class="label_left"for="Publications">Title</label><input type="text" class="form-control" id="title" placeholder="Title" name="tittle[]" required/></div><div class="col-md-6 padd-l"><div class="form-group top_1"><label for="sel1" class="label_left">Publication Name</label><input type="text" class="form-control display_input_Publications_1" id="title" placeholder="Publication" name="publication_name[]" required/></div></div><div class="col-md-6 padd-r"><div class="form-group top_1"><label for="sel1" class="label_left">Year Publication</label><select class="form-control" id="year" name="year[]" ><option value="2019">2019</option><option value="2018">2018</option><option value="2017">2017</option><option value="2016">2016</option></select></div></div><div class="form-group"><label class="label_left" for="Publications">Link to Article or Paper</label><input type="text" class="form-control display_input_Publications" id="link" placeholder="Add Link Here" name="publication_link[]" required/></div><div class="form-group"><label class="label_left" for="Publications">Cited By</label><input type="text" class="form-control display_input_Publications" id="cited_by" placeholder="Cited By" name="cited_by[]" required/></div></div></div>'); //add input field
        }
    });  
    $('.wrapper_Publications').on("click",".minus_circle_Publications", function(e){ //user click on remove text links
        e.preventDefault(); $(this).parent('div').remove(); x--;
    })
});

   /*  Add Publications */

/*   $("#Addpublications_profile").submit(function(e) {

    e.preventDefault(); // avoid to execute the actual submit of the form.

    var form = $(this);
    var url = form.attr('action');

    $.ajax({
           type: "POST",
           url: 'add-publications',
           data: form.serialize(), // serializes the form's elements.
           success: function(data)
           {
               alert(data); // show response from the php script.
           }
         });


});*/

jQuery("#Addpublications_profile").submit(function( event ) {
   event.preventDefault();

    $.ajax({
            type: 'post',
            url: 'add-publications',
            data: $('#Addpublications_profile').serialize(),
            success: function (data) { 
              
              $('#error-message-publications').html(data);
              $("#Addpublications_profile")[0].reset();
              location.reload(true);
            }
    });
});      /* End add Publications */


   /* add parent, children, COLLABORATORS affiliation */

function add_affiliation(class_id){

    var response_id = $('#'+class_id).next().attr('id');
    //alert(response_id);
    var name     = $('#'+class_id).val();
    var myLength =  jQuery("#"+class_id).val().length;

    if(name){
     if(myLength >=2){
      $.ajax({ 
        type : "GET",
        url  : "search-affiliation",
        data : { name: name, top:class_id, botton:response_id},
        success: function(data){
              $("#"+response_id).show();
              $("#"+response_id).html(data);
              $("#"+class_id).css("background","#FFF");
              }
           });
        }
    }
}

 function select_form_affiliation(top, message, val) {
  
    $("#"+top).val(val);
    $("#"+message).hide();
   }
   /* End parent affiliation */

 /*  affiliation popup hide for create account*/

$("body").click(function(){
     $("#suggest-alert2").hide();
});

$("#AddChildren").click(function(){
     $("#child_affiliation_response").hide();
});

$("#AddParents").click(function(){
     $("#affiliation-response").hide();
});

$("#AddCollaborators").click(function(){
     $("#coll-affiliation-response").hide();
});


       /*  Start To ACADEMIC & PROFESSIONAL LINEAGE. */


        /* locks system here for all */
 function children_lock(child_id){
         
        var yy ="#locks"+child_id+" i";
        
        if($(yy).attr('class') == 'fa fa-lock'){
    
           $(yy).removeClass();
           $(yy).addClass("fa fa-unlock-alt");
        }else{
      
           $(yy).removeClass();
           $(yy).addClass("fa fa-lock");
        }

        /* $("#"+child_id+".nmain_box1").click(function() {
          
          if (child_id) {
              var pclass =$(this).parent().attr("class");
              if (pclass=="test") {
                $(this).parent().prev().prepend(this);
              }
              if(pclass=="test1"){
                $(this).parent().next().prepend(this);
              }
            }
              
         });*/
    } /* End locks system here for all */


      /*pageneation for parent . */

       jQuery( document ).ready(function() {
          jQuery(".scroll_down_parent").click(function(){  //Down
          
        // alert(jQuery("span[class='glyphicon glyphicon-lock']").length);
        var vlength =jQuery(this).prev().prev().children(".active").length;
        //alert(vlength); 
       jQuery('.scroll_up_parent').show();
       if($(".scroll_down_parent").prev().children()[$(".scroll_down_parent").prev().children().length-1].classList.length !=2){
        if (vlength==4) {
          jQuery(this).prev().children("div.active:last").next().show();
        }
        if (vlength==3) {
          jQuery(this).prev().children("div.active:last").next().show();
         jQuery(this).prev().children("div.active:last").next().next().show();
        }
        if (vlength==2) {
          jQuery(this).prev().children("div.active:last").next().show();
         jQuery(this).prev().children("div.active:last").next().next().show();
         jQuery(this).prev().children("div.active:last").next().next().next().show();

        }
        if (vlength==1) {
          jQuery(this).prev().children("div.active:last").next().show();
         jQuery(this).prev().children("div.active:last").next().next().show();
         jQuery(this).prev().children("div.active:last").next().next().next().show();
         jQuery(this).prev().children("div.active:last").next().next().next().next().show();
        }
        if (vlength==0) {
          jQuery(this).prev().children("div.active:last").next().show();
         jQuery(this).prev().children("div.active:last").next().next().show();
         jQuery(this).prev().children("div.active:last").next().next().next().show();
         jQuery(this).prev().children("div.active:last").next().next().next().next().show();
         jQuery(this).prev().children("div.active:last").next().next().next().next().next().show();
        }
         
         jQuery(this).prev().children("div.active").hide();
         jQuery(this).prev().children().removeClass("active");
         jQuery(this).prev().children(":visible").addClass("active");
         //jQuery(".test").children().show();
       }
    });
      jQuery(".scroll_up_parent").click(function(){ // Up
       
        //var vlength =jQuery(this).next().children(".active").length;
        var vlength=$(".scroll_up_parent").next().children(".active").length;

          var t1 = jQuery(this).next().children("div.active").prev().attr("id");
          var t2 = jQuery(this).next().children("div.active").attr("id");
          //alert(t1+"=="+t2);
          if(t1!=t2){

           jQuery(this).next().children("div.active:first").prev().show();
           jQuery(this).next().children("div.active:first").prev().prev().show();
           jQuery(this).next().children("div.active:first").prev().prev().prev().show();
           jQuery(this).next().children("div.active:first").prev().prev().prev().prev().show();
           jQuery(this).next().children("div.active:first").prev().prev().prev().prev().prev().show();

           jQuery(this).next().children("div.active").hide();
           jQuery(this).next().children().removeClass("active");
           jQuery(this).next().children(":visible").addClass("active");
          }
       });
   });
       // End pageneation for parent.
   jQuery( document ).ready(function() {
          jQuery(".scroll_down").click(function(){  //Down
          
        // alert(jQuery("span[class='glyphicon glyphicon-lock']").length);
        var vlength =jQuery(this).prev().prev().children(".active").length;
        //alert(vlength); 
       jQuery('.scroll-up').show();
       if($(".scroll_down").prev().children()[$(".scroll_down").prev().children().length-1].classList.length !=2){
        if (vlength==4) {
          jQuery(this).prev().children("div.active:last").next().show();
        }
        if (vlength==3) {
          jQuery(this).prev().children("div.active:last").next().show();
         jQuery(this).prev().children("div.active:last").next().next().show();
        }
        if (vlength==2) {
          jQuery(this).prev().children("div.active:last").next().show();
         jQuery(this).prev().children("div.active:last").next().next().show();
         jQuery(this).prev().children("div.active:last").next().next().next().show();

        }
        if (vlength==1) {
          jQuery(this).prev().children("div.active:last").next().show();
         jQuery(this).prev().children("div.active:last").next().next().show();
         jQuery(this).prev().children("div.active:last").next().next().next().show();
         jQuery(this).prev().children("div.active:last").next().next().next().next().show();
        }
        if (vlength==0) {
          jQuery(this).prev().children("div.active:last").next().show();
         jQuery(this).prev().children("div.active:last").next().next().show();
         jQuery(this).prev().children("div.active:last").next().next().next().show();
         jQuery(this).prev().children("div.active:last").next().next().next().next().show();
         jQuery(this).prev().children("div.active:last").next().next().next().next().next().show();
        }
         
         jQuery(this).prev().children("div.active").hide();
         jQuery(this).prev().children().removeClass("active");
         jQuery(this).prev().children(":visible").addClass("active");
         //jQuery(".test").children().show();
       }
    });
      jQuery(".scroll-up").click(function(){ // Up
       
        //var vlength =jQuery(this).next().children(".active").length;
        var vlength=$(".scroll-up").next().children(".active").length;

          var t1 =jQuery(this).next().children("div.active").prev().attr("id");
          var t2 = jQuery(this).next().children("div.active").attr("id");
          //alert(t1+"=="+t2);
          if(t1!=t2){

           jQuery(this).next().children("div.active:first").prev().show();
           jQuery(this).next().children("div.active:first").prev().prev().show();
           jQuery(this).next().children("div.active:first").prev().prev().prev().show();
           jQuery(this).next().children("div.active:first").prev().prev().prev().prev().show();
           jQuery(this).next().children("div.active:first").prev().prev().prev().prev().prev().show();

           jQuery(this).next().children("div.active").hide();
           jQuery(this).next().children().removeClass("active");
           jQuery(this).next().children(":visible").addClass("active");
          }
       });
   });  

 function grandchild_slider(){
      
    var first_grand_pid = [];
          i = 0;
    $( "#grand_children_div0 " ).find(".active").each(function( index ) {
        first_grand_pid[i++] = $( this ).attr('id'); 
     });

    var second_grand_pid = []; 
          i = 0;
    $( "#grand_children_div1 " ).find(".active").each(function( index ) {
        second_grand_pid[i++] = $( this ).attr('id'); 
     });
     
     $("#grand_new_records").hide();
    /*  children for grete grand scroll*/

     $('div.scroll_down_left').attr('id', 'left');
     $('div.scroll_up_left').attr('id', 'left');

    /*  End children for grete grand scroll*/


    /*  grandchildren for grete grand scroll*/
    
     $('div.scroll_down_left_grand1').attr('id', 'left');
     $('div.scroll_up_left_grand1').attr('id', 'left');


     $('div.scroll_down_left_grand0').attr('id', 'left');
     $('div.scroll_up_left_grand0').attr('id', 'left');

    /*  End grandchildren for grete grand scroll*/

       $(".tab2").removeClass("active");
       $(".mid_section").hide();
       //$("#grand_new_records").hide(); 
       $("#loader_lineage_great_grand").show();


   $.ajax({ 
            type : "GET",
            url  : "children-grand-pid",
            data : { first_grand: first_grand_pid, second_grand:second_grand_pid },
            success: function(data){
                $("#loader_lineage_great_grand").hide();
                $("#grand_new_records").show();
                $("#grand_new_records").html(data);
                $("#tab5").addClass("active");
                $("#child_grandchild").hide();
             }
     });
 }


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

  function grand_parent_slider(){
      
    var first_grand_pid = [];
          i = 0;
    $( "#grand_parent_div0" ).find(".active").each(function( index ) {
        first_grand_pid[i++] = $( this ).attr('id'); 
     });

    var second_grand_pid = []; 
          i = 0;
    $( "#grand_parent_div1 " ).find(".active").each(function( index ) {
        second_grand_pid[i++] = $( this ).attr('id'); 
     });
     
     //$("#grand_new_records").hide();

    /*  parent for grete grand scroll*/

     $('div.scroll_down_secondparent').attr('id', 'right');
     $('div.scroll_up_secondparent').attr('id', 'right');

    /*  End children for grete grand scroll*/


    /*  grandparent for grete grand scroll*/
    
     $('div.scroll_down_left_grand_parent1').attr('id', 'center');
     $('div.scroll_up_left_grand_parent1').attr('id', 'center');


     $('div.scroll_down_left_grand_parent0').attr('id', 'center');
     $('div.scroll_up_left_grand_parent0').attr('id', 'center');

    /*  End grandparent for grete grand scroll*/


       $(".tab2").removeClass("active");
       $(".mid_section").hide();

       $("#great_grand_parent_records").hide(); 
       $("#loader_lineage_great_grand_parent").show();

       $("#tab8").show();

   $.ajax({ 
            type : "GET",
            url  : "great-grandparent-pid",
            data : { first_grand: first_grand_pid, second_grand:second_grand_pid },
            success: function(data){
                $("#loader_lineage_great_grand_parent").hide();
                
                $("#great_grand_parent_records").show();
                $("#great_grand_parent_records").html(data);
                $("#tab8").addClass("active");  

                $("#children_slider").hide();
                $("#parent_slider_back").show(); 
                // greate grand parent icon hide.   
                $("#grand_parent_slider").hide();          
             }
     });
 }
    
   