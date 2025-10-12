<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Email; // Assuming you have an Email model
use Illuminate\Support\Facades\Mail;
use App\Mail\AdminBulkEmail;

class EmailController extends Controller
{
    public function index()
    {
        $emails = Email::latest()->get(); // Fetch all subscribed emails
        return view('admin.emails', compact('emails'));
    }

    public function send(Request $request)
    {
        $request->validate([
            'subject' => 'required|string|max:255',
            'message' => 'required|string',
        ]);

        $subscribers = Email::pluck('email')->toArray();

        foreach ($subscribers as $email) {
            Mail::to($email)->queue(new AdminBulkEmail($request->subject, $request->message));
        }

        return redirect()->back()->with('success', 'Email sent to all subscribers.');
    }

    public function destroy(Email $email)
    {
        $email->delete();
        return redirect()->back()->with('success', 'Subscriber deleted.');
    }
}
