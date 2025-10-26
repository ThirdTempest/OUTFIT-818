<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use App\Mail\OtpMail;

class OtpController extends Controller
{
    public function showVerificationForm(Request $request)
    {
        $email = $request->query('email');

        return view('auth.verify-otp', compact('email'));
    }

    public function verify(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'otp' => 'required|digits:6',
        ]);

        $user = User::where('email', $request->email)->where('otp_code', $request->otp)->first();

        if (!$user) {
            return back()->withErrors(['otp' => 'Invalid OTP.']);
        }

        $user->is_verified = true;
        $user->email_verified_at = now(); // <-- Add this line
        $user->otp_code = null;
        $user->save();


        Auth::login($user);

        return redirect('/')->with('success', 'Email verified successfully.');
    }

    public function resend(Request $request)
    {
        $email = $request->query('email');

        if (!$email) {
            return redirect()->route('login')->withErrors(['email' => 'Email address is required.']);
        }

        $user = User::where('email', $email)->first();

        if (!$user) {
            return redirect()->route('login')->withErrors(['email' => 'We could not find a user with that email address.']);
        }

        // Generate new OTP
        $otp = rand(100000, 999999);

        // Save the OTP in the user record (assuming you have an `otp` column)
        $user->otp_code = $otp;
        $user->save();

        // Send OTP email
        Mail::to($user->email)->send(new OtpMail($otp, $user));

        return redirect()->back()->with('success', 'A new OTP has been sent to your email.');
    }   
}
