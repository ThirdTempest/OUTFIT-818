<!DOCTYPE html>
<html>
<head>
    <title>Redirecting to Cashfree...</title>
    <script src="https://sdk.cashfree.com/js/v3/cashfree.js"></script>
</head>
<body>
    <p style="text-align:center; margin-top: 2rem;">Redirecting to Cashfree...</p>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            if (typeof Cashfree === 'undefined') {
                alert("❌ Cashfree SDK not loaded. Check internet connection or SDK URL.");
                return;
            }

            const cashfree = Cashfree({ mode: "sandbox" }); // or "production" for live mode

            if (typeof cashfree.checkout === 'function') {
                cashfree.checkout({
                    paymentSessionId: "{{ $sessionId }}",
                    redirectTarget: "_self" // or "_blank"
                });
            } else {
                alert("❌ 'checkout' method not available on Cashfree SDK.");
                console.error("Cashfree SDK Object:", cashfree);
            }
        });
    </script>
</body>
</html>
