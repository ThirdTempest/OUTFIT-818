<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class CustomPasswordResetMail extends Mailable
{
    use Queueable, SerializesModels;

    public $token;
    public $user;

    public function __construct($token, $user)
    {
        $this->token = $token;
        $this->user = $user;
    }

    public function build()
    {
        $url = url(route('password.reset', ['token' => $this->token, 'email' => $this->user->email], false));

        return $this->subject('Reset Your Outfit 818 Password')
                    ->view('emails.custom-password-reset')
                    ->with([
                        'resetUrl' => $url,
                        'user' => $this->user,
                    ]);
    }
}
