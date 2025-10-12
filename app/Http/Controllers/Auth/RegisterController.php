<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;

class RegisterController extends Controller
{
    public function showRegistrationForm()
    {
        return view('auth.register');
    }

    public function register(Request $request)
    {
        $request->validate([
        'name' => 'required|string|max:255',

        'email' => 'required|string|email|max:255|unique:users',

        'phone' => [
            'required',
            'regex:/^[0-9]{10}$/',
            'unique:users',
        ],

        'profile_picture' => 'nullable|image|mimes:jpeg,png,jpg|max:2048',

        'address' => 'nullable|string|max:500',

        'dob' => 'nullable|date|before:today',

        'gender' => 'nullable|in:male,female,other',

        'bio' => 'nullable|string|max:1000',

        'password' => [
            'required',
            'string',
            'min:8',
            'max:255',
            'confirmed',
            'regex:/[a-z]/',      // At least one lowercase letter
            'regex:/[A-Z]/',      // At least one uppercase letter
            'regex:/[0-9]/',      // At least one digit
            // 'regex:/[@$!%*#?&]/' // Optional: at least one special character
        ],
    ], [
        'email.unique' => 'An account with this email already exists.',
        'phone.unique' => 'This phone number is already registered.',
        'phone.regex' => 'Phone must be 10 digits.',
        'dob.before' => 'Date of birth must be before today.',
        'password.confirmed' => 'Passwords do not match.',
        'password.regex' => 'Password must contain at least 1 uppercase letter, 1 lowercase letter, and 1 number.',
    ]);


        $otp = rand(100000, 999999); // 6-digit OTP

        // Handle profile picture upload
        $profilePicturePath = null;
        if ($request->hasFile('profile_picture')) {
            $profilePicturePath = $request->file('profile_picture')->store('profile_pictures', 'public');
        }

        $user = User::create([
            'name'              => $request->name,
            'email'             => $request->email,
            'phone'             => $request->phone,
            'profile_picture'   => $profilePicturePath,
            'address'           => $request->address,
            'dob'               => $request->dob,
            'gender'            => $request->gender,
            'password'          => bcrypt($request->password),
            'otp_code'          => $otp,
            'is_verified'       => false,
            'user_type'         => 'user',
        ]);

        // Send OTP via mail
        Mail::to($user->email)->send(new \App\Mail\OtpMail($otp, $user));

        return redirect()->route('otp.verify.form', ['email' => $user->email]);
    }
}
