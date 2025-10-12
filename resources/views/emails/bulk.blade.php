<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>{{ $subjectLine ?? 'Outfit 818 Newsletter' }}</title>
</head>
<body style="font-family: sans-serif; color: #333; line-height: 1.6;">
    <div style="max-width: 600px; margin: auto;">
        <h2 style="color: #3B5998;">Outfit 818</h2>
        <p>{!! nl2br(e($content)) !!}</p>
        <hr>
        <small style="color: #999;">You’re receiving this email because you subscribed to Outfit 818 updates.</small>
    </div>
</body>
</html>
