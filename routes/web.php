<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

/*website: http://alistgear.com/
  author : Bibhash Shishodiya
*/

Route::get('/abcd', function()
{
    return View::make('abcd');
});

Route::get('/map1',                    'DetailsPageController@map_xml');

/*  --------------------Web Scraping  ---------------------*/
 
Route::get('/text',                   'SigninController@text');
Define('base_url',                    "http://alistgear.com/");

Route::get('/parent',                 'ScrapingController@index');
Route::get('/citations',              'CitationController@index');
Route::get('/profile-address',        'ProfileAddress@getAddress');
Route::get('/dublicate',              'Collaborators@index');
Route::get('/grand-children-record',  'GrandChild@index');
Route::get('/grand-parent-record',    'GrandFather@index');
Route::get('/great-grand-parent',     'GreatGrandParent@index');


/*  -------------------- Home Page  ---------------------*/

Route::get('/',                        'HomeController@home_details');


/*  -------------------- SignIn & SignUp  ---------------------*/ 

Route::get('/signIn',                   'SigninController@login');
Route::post('/sign-sub',                'SigninController@login_submit');
Route::get('/signOut',                  'SigninController@login_out'); 

/*  -------------------- New Create Account  ---------------------*/ 

Route::get('/create-account',           'SigninController@create_account');  
Route::get('/search-signup-affiliation','SigninController@search_signup_affiliation'); 
Route::post('/create-account-submit',   'SigninController@register_submit'); 




Route::group(['middleware' => 'disablepreventback'],function(){

	/*  -------------------- Check Middleware for create profile  ---------------------*/ 

	Route::group(['middleware' => ['check_create_profile']], function() {

		/*  -------------------- Claim Account     ---------------------*/ 

	Route::get('/claim-account',             'SigninController@claim_account');

	/*  -------------------- Create Your Profile     ---------------------*/ 

	Route::get('/create-profile',           'SigninController@create_profile'); 
	Route::get('/fetch-state-name',         'SigninController@fetch_state_name'); 

	Route::get('/create-profile-sub',       'SigninController@create_profile_sub');
	Route::get('/check-profile',            'SigninController@check_profile');

	/*  ------------------   Profile Details Page  ---------------------*/ 

	Route::get('/profile-details-page',      'DetailsPageController@search_profile_details');

  });/*  ------------------ End middleware for create profile ---------------------*/ 



	/*  ------------------   Check Middleware for show profile details  ---------------------*/ 

	Route::group([ 'middleware' => ['check_sign_profile']], function(){

		/*  ------------------   Profile Details Page After SignIn ---------------------*/ 

	Route::get('/profile-details',      'DetailsPageController@profile_details');

	/*  -------------------- PUBLICATIONS  ---------------------*/

	Route::get('/publication',          'PublicationController@index');
	Route::match(array('GET', 'POST'),'/search-title',  'PublicationController@search_title_details');


	/*  -------------------- Search Header   ---------------------*/

	Route::get('/search-header',         'DetailsPageController@search_header_author');
	Route::match(array('GET', 'POST'),'/search-details',  'DetailsPageController@search_header_details');

	/*  ---------------------  Focus Area  --------------------------*/

	Route::get('/focus-area',            'DetailsPageController@focus_area');

	Route::get('/search-header-network',      'DetailsPageController@search_header_network');
	Route::get('/search-geographic-network',  'DetailsPageController@search_geographic_network');

	/*  -------------------- EDUCATIONAL LINEAGE  ---------------------*/

	Route::get('/grand-children',          'ProfileController@grand_children');
	Route::get('/children-grand-id',       'ProfileController@children_grand_id');
	Route::get('/children-grand-pid',      'ProfileController@children_grand_pid');

	Route::get('/grand-children-pid',       'ProfileController@grand_children_pid');

	Route::get('/great-grandparent-pid',   'ProfileController@great_grandparent_pid');
	

	 /* ---------------------  parent section -------------*/

	 Route::get('/first-parent-record',   'ProfileController@first_parent_details');
	 Route::get('/second-parent-record',  'ProfileController@second_parent_details');
	 Route::get('/parent-grand-id',       'ProfileController@parent_grand_id');

	/*  -------------------- Video  ---------------------*/

    Route::post('/video-url',             'DetailsPageController@add_video');


	/*  -------------------- Profile updata  ---------------------*/

    Route::post('/editModal-profile',      'DetailsPageController@editModal_profile');  

    /*  -------------------- Map Url  ---------------------*/

    Route::get('/author-details/{pid}',    'DetailsPageController@author_details_pid'); 

     /*  -------------------- Add Parent  ---------------------*/

    Route::post('/add-parent',              'DetailsPageController@add_parent_details');  

      /*  -------------------- Add Children  ---------------------*/

    Route::post('/add-children',           'DetailsPageController@add_children_details');

     /*  -------------------- Add Collaborators   ---------------------*/

    Route::post('/add-collaborators',      'DetailsPageController@add_collaborators_details');

      /*  -------------------- Add Publications   ---------------------*/

    Route::post('/add-publications',      'DetailsPageController@add_publications_details');

   /*  -------------------- Add affiliation for all form  ---------------------*/

    Route::get('/search-affiliation', 'SigninController@search_affiliation');

	});
 });

/*  -------------------- forget password  ---------------------*/

Route::get('/forgetPassword',        'SigninController@ForgetPassword'); 
Route::post('/sendLink',             'SigninController@submit_link'); 

Route::get('/forgetPasswords/{uid}', 'SigninController@ChangePassword'); 
Route::post('/resetPassword',        'SigninController@change_password'); 















/*  -------------------- Profile Page  ---------------------*/

Route::post('/add-claim-profile',      'ProfileController@add_claim_profile');
Route::get('/peopleinfo/',             'ProfileController@click_name_link');
Route::get('/profile/',                'MyProfile@profile');
Route::get('/my-profile/',             'MyProfile@my_profile');
Route::get('/my-claim-profile/{pid}',  'MyProfile@my_claim_profile');
Route::get('/my-claim-profile-pid/',   'MyProfile@my_claim_profile_pid');

/*  -------------------- Search  ---------------------*/


//Route::match(array('GET', 'POST'),'/search-details',  'ProfileController@search_header_details');
//Route::match(array('GET', 'POST'),'/search-detailss',  'ProfileController@search_header_detailss');

Route::get('/search-home-profile',   'ProfileController@search_home_profile');
Route::get('/search-home-network',   'ProfileController@search_home_network');
Route::get('/search-my-profile',     'ProfileController@search_my_profile');
Route::match(array('GET', 'POST'),   '/search-profile-details', 'ProfileController@search_profile_details');
Route::match(array('GET', 'POST'),   '/search-network-details', 'ProfileController@search_network_details');

   /*  -------------------- My Profile details  ---------------------*/

Route::post('/search-myprofile-details', 'ProfileController@search_myprofile_details');

Route::get('/explore-details',       'ProfileController@explore_details'); 

/*  -------------------- Details  ---------------------*/

Route::get('/all-publications/{id}',   'ProfileController@all_publications');

/*  -------------------- Invite Message  ---------------------*/

Route::get('/invite',         'InviteController@index');
Route::post('/add-invite',    'InviteController@add_invite');

/*  -------------------- About  ---------------------*/

Route::get('/about_us',   'AboutController@index');
Route::get('/episode',   'EpisodeController@index');
Route::get('/events',    'EventController@index');
Route::get('/jobboard',  'AboutController@jobboard');
Route::get('/submit',    'AboutController@submit');  
Route::get('/podcast',   'AboutController@podcast');
Route::get('/jobs',      'AboutController@jobs');
Route::get('/conference','AboutController@conference'); 
Route::get('/contact',   'AboutController@contact');



/*  -------------------- Joinus  ---------------------*/
 
Route::get('/joinus',             'HomeController@joinus');
Route::get('/selectCountry',      'HomeController@state');
Route::post('/addjoinus',         'HomeController@addjoinus');
Route::get('/show-profile/{pid}', 'HomeController@show_profile');
Route::get('/view-profile',       'HomeController@view_profile');


/*  -------------------- Dispute Profile  ----------------*/

Route::get('/dispute-profile/{pid}', 'DisputeProfile@dispute_profile'); 
Route::get('/dispute-profile-pid',   'DisputeProfile@dispute_profile_pid');
Route::post('/add-dispute-profile',  'DisputeProfile@add_dispute_profile'); 


/*  -------------------- Profile Update  ---------------------*/

Route::get('/explore-data',           'UpdateProfile@explore_data'); 
Route::post('/update_profile',        'UpdateProfile@update_record'); 
Route::get('/check_pin/{pid}',        'UpdateProfile@check_pin'); 


/*  -------------------- Admin  ---------------------*/

Route::get('/admin',            'admin\Dashboard@index');  
Route::get('/login',            'admin\Dashboard@signin');
Route::post('/login-submit',    'admin\Dashboard@login_submit');

/*  -------------------- New Author Add  ---------------------*/

Route::get('/add_new_author',     'HomeController@add_new_user');
Route::get('/add_new_user/{id}',  'HomeController@add_new_user');


Route::group(['middleware' => 'disablepreventback'],function(){

	Route::group(['middleware' => ['loginpage']], function() {

	Route::get('/dashboard',        'admin\Dashboard@dashboard');	
	Route::get('/logout',           'admin\Dashboard@logout');

	/*  -------------------- Video  ---------------------*/

	Route::get('/video',            'admin\video@index');
	Route::post('/add-video',       'admin\video@store');
	Route::get('/show-video',       'admin\video@show');
	Route::get('/delete-video/{id}','admin\video@deleteVideo');
	Route::get('/update-video/{id}','admin\video@updateVideo');
	Route::post('/edit-video/{id}', 'admin\video@editVideo');


	/*  -------------------- All Publications   ---------------------*/

	Route::get('/publication-newest/{pid}',  'Publication@index');
	Route::get('/publication-oldest/{pid}',  'Publication@oldest');
	Route::get('/publication-search',        'Publication@publicationSearch');
	Route::get('/publication-search-all',    'Publication@publicationSearchAll');


	/*  -------------------- Joinus  ---------------------*/

	Route::get('/show-joinus',         'admin\video@show_joinus');
	Route::get('/delete-joinus/{id}',  'admin\video@delete_joinus');

	Route::get('/show-profile-joinus',        'admin\video@show_profile_joinus');
	Route::get('/delete-profile-joinus/{id}', 'admin\video@delete_profile_joinus');
	Route::get('/status-profile-joinus/{id}', 'admin\video@status_approve_profile');

	/*  -------------------- Dispute Profile  ----------------*/

	Route::get('/show-dispute-profile',        'admin\Dispute@index'); 
	Route::get('/delete-dispute-profile/{id}', 'admin\Dispute@delete_dispute_profile'); 
	Route::get('/status-dispute-profile/{id}', 'admin\Dispute@status_dispute_profile'); 

	/*  -------------------- About Us         ----------------*/

	Route::get('/about',               'admin\AboutController@index'); 
	Route::post('/edit-about',          'admin\AboutController@edit_about'); 

	Route::get('/episodes',            'admin\AboutController@episodes'); 
	Route::post('/edit-episodes',      'admin\AboutController@edit_episodes');

	Route::get('/event',            'admin\AboutController@event'); 
	Route::post('/edit-event',      'admin\AboutController@edit_event');
	});
});