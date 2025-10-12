<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Password Reset</title>
</head>
<body>
    <h2>Hello {{ $user->name }},</h2>
    <p>We received a request to reset your password. Click the button below to choose a new password:</p>

    <p>
        <a href="{{ $resetUrl }}" style="background-color: #4F46E5; color: white; padding: 10px 20px; text-decoration: none; border-radius: 5px;">
            Reset Password
        </a>
    </p>

    <p>This link will expire in 60 minutes. If you didn't request this, you can safely ignore this email.</p>

    <p>Thanks,<br>Outfit 818 Team</p>
</body>
</html>
