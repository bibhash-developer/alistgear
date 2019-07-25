<?php

namespace App\Http\Middleware;

use Closure;

class CheckCreateProfile
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
        $value = $request->session()->get('account_pid');
       
        if (!$value) {
            return redirect('/create-account');
           
        }else{
           return $next($request); 
        }
        
    }


}