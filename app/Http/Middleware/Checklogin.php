<?php

namespace App\Http\Middleware;

use Closure;

class Checklogin
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        //$request->session()->put('name', 'bibhash');
        $value1 = $request->session()->get('username');
       
        if (!$value1) {
            return redirect('/admin');
           
        }else{
           return $next($request); 
        }
        
    }


}
 