<?php

namespace App\Http\Controllers;

use App\Models\Email;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class EmailSubscriptionController extends Controller
{
    public function store(Request $request)
    {
        $user = Auth::user();

        if (!$user) {
            return redirect()->back()->with('error', 'You must be logged in to subscribe.');
        }

        if (!$user->is_verified) {
            return redirect()->back()->with('error', 'Your email must be verified before subscribing.');
        }

        // ✅ Only allow user's actual verified email
        if ($request->email !== $user->email) {
            return redirect()->back()->with('error', 'Invalid email submission.');
        }

        // ✅ Check if already subscribed
        if (Email::where('email', $user->email)->exists()) {
            return redirect()->back()
                ->with('info', 'You are already subscribed.')
                ->with('subscribed', true);
        }

        // ✅ Save subscription
        Email::create([
            'user_id' => $user->id,
            'email' => $user->email,
        ]);

        return redirect()->back()
            ->with('success', 'Thank you for subscribing!')
            ->with('subscribed', true);
    }

    public function destroy(Request $request)
    {
        $user = Auth::user();

        $subscription = Email::where('user_id', $user->id)->first();

        if ($subscription) {
            $subscription->delete();
            return redirect()->back()->with('success', 'You have been unsubscribed successfully.');
        }

        return redirect()->back()->with('error', 'No active subscription found.');
    }
}
