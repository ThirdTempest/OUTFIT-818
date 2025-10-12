<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>OTP Verification</title>
</head>
<body style="font-family: Arial, sans-serif; padding: 20px;">
    <h2>Hello {{ $user->name }},</h2>
    <p>Thank you for registering with <strong>Outfit 818</strong>.</p>
    <p>Your One-Time Password (OTP) for email verification is:</p>

    <div style="font-size: 28px; font-weight: bold; margin: 20px 0;">
        {{ $otp }}
    </div>

    <p>This code is valid for a short time. Please enter it on the verification page to activate your account.</p>

    <p>If you didn’t create this account, you can ignore this message.</p>

    <br><br>
    <p>— Outfit 818 Team</p>
</body>
</html>
