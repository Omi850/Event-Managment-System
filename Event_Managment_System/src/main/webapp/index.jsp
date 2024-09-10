<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Event Management System</title>
    <link rel="stylesheet" href="style.css" />
    <style>
        body, html {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .login-section {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 80vh;
            padding: 20px;
        }

        .login-container {
            background: transparent;
            color: white;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }

        .login-container h2 {
            margin-bottom: 20px;
            font-size: 2rem;
        }

        .login-container label {
            display: block;
            margin-bottom: 8px;
            font-weight: 400;
        }

        .login-container input {
            width: 100%;
            padding: 12px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1rem;
        }

        .login-container button {
            width: 100%;
            padding: 12px;
            background-color: #47b2e4;
            border: none;
            border-radius: 4px;
            color: #fff;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.2s ease;
        }

        .login-container button:hover {
            background-color: #3394c8;
        }

        .login-container .signup-link {
            text-align: center;
            margin-top: 20px;
        }

        .login-container .signup-link a {
            color: #47b2e4;
            text-decoration: none;
            font-weight: 600;
        }

        .login-container .signup-link a:hover {
            text-decoration: underline;
        }

        .hero-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 60px 15px;
            max-width: 1200px;
            margin: 0 auto;
            height: 100vh;
            color: #fff;
        }

        .hero-section .hero {
            max-width: 50%;
        }

        .hero-section h2 {
            font-size: 2.5rem;
            margin-bottom: 20px;
        }

        .hero-section p {
            font-size: 1.2rem;
            margin-bottom: 30px;
            color: #c9c7c7;
        }

        .hero-section .buttons {
            margin-top: 20px;
        }

        .hero-section .buttons a {
            text-decoration: none;
            color: #fff;
            padding: 12px 24px;
            border-radius: 0.375rem;
            font-weight: 600;
            display: inline-block;
            margin-right: 15px;
        }

        .hero-section .buttons .join {
            background-color: #47b2e4;
        }

        .hero-section .buttons .learn {
            border: 1px solid #fff;
        }

        .login-container {
            width: 100%;
            max-width: 400px;
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            .hero-section {
                flex-direction: column;
                text-align: center;
                height: auto;
                padding: 30px;
            }

            .hero-section .hero {
                max-width: 100%;
            }

            .hero-section h2 {
                font-size: 2rem;
            }

            .hero-section p {
                font-size: 1rem;
            }

            .login-container {
                padding: 20px;
            }
        }

        @media (max-width: 480px) {
            .hero-section h2 {
                font-size: 1.8rem;
            }

            .hero-section p {
                font-size: 0.9rem;
            }

            .login-container {
                padding: 15px;
                width: 90%;
                max-width: 100%;
            }
        }
        
  .captcha-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 15px;
}

.captcha-box {
    background-color: #e0e0e0;
    color: #333;
    padding: 8px;
    border-radius: 4px;
    text-align: center;
    font-size: 1.2rem;
    font-weight: bold;
    cursor: pointer;
    width: 100px;
}

.captcha-container input {
    flex: 1;
    margin-left: 10px;
    padding: 6px;
    border: 1px solid #ddd;
    border-radius: 4px;
}

.captcha-message {
    color: red;
    margin-top: 10px;
    display: none;
}

       
    </style>
</head>
<body>
    <%@ include file="Loginheader.jsp" %>
    <section class="hero-section">
        <div class="hero">
            <h2>Manage Your Events Effortlessly</h2>
            <p>Discover a streamlined platform to create, organize, and manage all your events with ease. From planning to execution, we make event management simple and efficient.</p>
            <div class="buttons">
                <a href="#" class="join">Get Started</a>
                <a href="#" class="learn">Learn More</a>
            </div>
        </div>
        <div class="login-container">
            <h2>Login</h2>
             <form id="loginForm" action="loginuser" onsubmit="return validateCaptcha()">
                <label for="email">Email</label>
                <input type="email" name="email" placeholder="Email here" maxlength="40" required />
                <label for="password">Password</label>
                <input type="password" name="password" placeholder="Password here" maxlength="10" required />

                <!-- CAPTCHA Section -->
                <div class="captcha-container">
                    <div id="generatedCaptcha" class="captcha-box" onclick="regenerateCaptcha()">1234</div>
                    <input type="number" id="captchaInput" placeholder="Enter Captcha"  required />
                </div>
                <div id="captchaMessage" class="captcha-message">Captcha does not match!</div>

                <button type="submit">Log In</button>
                <div class="signup-link">
                    <p>Don't have an account? <a href="Usersignup.jsp">Sign Up</a></p>
                </div>
            </form>
        </div>
    </section>
    <%@ include file="Loginfooter.jsp" %> 

    <script>
        // Generate a random CAPTCHA number between 1000 and 9999
        function generateCaptcha() {
            return Math.floor(1000 + Math.random() * 9000);
        }

        // Display the CAPTCHA when the page loads
        let captcha = generateCaptcha();
        document.getElementById('generatedCaptcha').innerText = captcha;

        // Function to regenerate CAPTCHA when clicked
        function regenerateCaptcha() {
            captcha = generateCaptcha();
            document.getElementById('generatedCaptcha').innerText = captcha;
        }

        // Function to validate CAPTCHA
        function validateCaptcha() {
            const userCaptcha = document.getElementById('captchaInput').value;
            if (userCaptcha != captcha) {
                document.getElementById('captchaMessage').style.display = 'block';
                return false; // Prevent form submission
            }
            document.getElementById('captchaMessage').style.display = 'none';
            return true; // Allow form submission
        }
    </script>
</body>
</html>
