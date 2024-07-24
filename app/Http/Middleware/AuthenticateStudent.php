<?php

namespace App\Http\Middleware;

use Illuminate\Auth\Middleware\Authenticate as Middleware;

class AuthenticateStudent extends Middleware
{
    /**
     * Get the path the student should be redirected to when they are not authenticated.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return string|null
     */
    protected function redirectTo($request)
    {   
        if (auth()->check() && auth()->user()->trang_thai == 0) {
            return route('studentlogin');
        }
        if (! $request->expectsJson()) {
            return route('studentlogin');
        }
    }
}
