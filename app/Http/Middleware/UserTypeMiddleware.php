<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class UserTypeMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @param  string  $type
     * @return mixed
     */
    public function handle($request, Closure $next, $type)
    {
        if (Auth::check() && Auth::user()->user_type === $type) {
            return $next($request);
        }

        abort(403, 'Unauthorized action.');
    }
}
