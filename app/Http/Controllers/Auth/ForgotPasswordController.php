<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;
use Illuminate\Support\Carbon;
use App\Models\User;
use App\Mail\CustomPasswordResetMail;

class ForgotPasswordController extends Controller
{
    public function showLinkRequestForm()
    {
        return view('auth.forgot-password');
    }

    public function sendResetLinkEmail(Request $request)
    {
        $request->validate([
            'email' => ['required', 'email', 'max:255'],
        ], [
            'email.required' => 'Email is required.',
            'email.email' => 'Enter a valid email address.',
            'email.max' => 'Email cannot exceed 255 characters.',
        ]);

        $user = User::where('email', $request->email)->first();

        if (!$user) {
            return back()->withErrors([
                'email' => 'We couldn’t find an account with that email.',
            ]);
        }

        if (!$user->is_verified) {
            return back()->withErrors([
                'email' => 'This email is not verified. Please verify your account before resetting the password.',
            ]);
        }

        // Generate reset token
        $token = Str::random(64);

        // Store or update in password_reset_tokens table
        DB::table('password_reset_tokens')->updateOrInsert(
            ['email' => $user->email],
            [
                'token' => bcrypt($token),
                'created_at' => Carbon::now()
            ]
        );

        // Send custom reset email
        Mail::to($user->email)->send(new CustomPasswordResetMail($token, $user));

        return back()->with('status', 'We have emailed your password reset link!');
    }
}
