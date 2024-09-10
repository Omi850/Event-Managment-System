<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
    body {
        font-family: "Open Sans", sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }
    .container {
        max-width: 400px;
        margin: 100px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    }
    h2 {
        margin-bottom: 20px;
        color: #333;
    }
    .form-group {
        margin-bottom: 15px;
    }
    .form-group label {
        display: block;
        margin-bottom: 5px;
        color: #333;
    }
    .form-group input {
        width: 100%;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 4px;
        font-size: 16px;
    }
    .form-group button {
        background-color: #47b2e4;
        color: #fff;
        border: none;
        padding: 10px 20px;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
    }
    .form-group button:hover {
        background-color: #3690c4;
    }
    .timer {
        font-size: 18px;
        color: #ff0000;
        margin-top: 20px;
    }
</style>
<meta charset="UTF-8">
<title>Verification Page</title>
</head>
<body>
    <div class="container">
        <%@ include file="UserHeader.jsp" %>
        <h2>Code Sent Successfully to Your Email!</h2>
           <form action="/verification" method="post" onsubmit="return validateForm(event)">
        <div class="form-group">
            <label for="verificationCode">Email Verification Code</label>
            <input type="hidden"  name="eventId" value="${eventId}" required />
            <input type="hidden"  name="userId" value="<%=session.getAttribute("userId") %>" required />
            <input type="hidden" id="hiddenVerificationCode" name="number" value="${code}" required />
            <input type="number" id="verificationCode" name="verificationCode" maxlength="5" required />
        </div>
        <div class="form-group">
            <button type="submit">Verify Code</button>
        </div>
    </form>
        <div class="timer">
            <p id="countdown">01:00</p>
        </div>
    </div>
    <%@ include file="UserFooter.jsp" %>
    <script>
        function validateForm(event) {
            var verificationCode = document.getElementById("verificationCode").value;
            var hiddenCode = document.getElementById("hiddenVerificationCode").value;

            if (verificationCode !== hiddenCode) {
                event.preventDefault(); 
                alert("Verification code does not match.");
                return false;
            }
            return true;
        }
    </script>
    <script>
        function startTimer(duration, display) {
            var timer = duration, minutes, seconds;
            var interval = setInterval(function () {
                minutes = parseInt(timer / 60, 10);
                seconds = parseInt(timer % 60, 10);

                minutes = minutes < 10 ? "0" + minutes : minutes;
                seconds = seconds < 10 ? "0" + seconds : seconds;

                display.textContent = minutes + ":" + seconds;

                if (--timer < 0) {
                    clearInterval(interval); 
                    display.textContent = "00:00";
                    window.location.href = "/BookEvent"; 
                }
            }, 1000);
        }
        window.onload = function () {
            var oneMinute = 60 * 1, 
                display = document.querySelector('#countdown');
            startTimer(oneMinute, display);
        };
    </script>
</body>
</html>
