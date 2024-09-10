<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Event Management System</title>
    <link rel="stylesheet" href="style.css" />
    <style>

        .login-container {
    align-items: center;
    background: transparent;
    color: white;
    padding: 30px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    max-width: 400px;
    height: 550px;
    width: 100%;
    box-shadow: 0 2px 4px rgba(247, 247, 247, 0.2);         
}

.login-container h2 {
    margin-bottom: 20px;
    font-size: 1.5rem; 
}

.login-container label {
    display: block;
    margin-bottom: 8px;
    font-weight: 300;
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
    font-weight: 400;
}

.login-container .signup-link a:hover {
    text-decoration: underline;
}


        @media screen and (max-width: 768px) {
            .login-container {
                padding: 20px;
            }
        }

        .buttons .join {
            background-color: #47b2e4;
        }

        .hero-section .buttons .learn {
            border: 1px solid #fff;
            border-radius: 0.375rem;
        }

        .hero-section .buttons a:hover {
            background-color: #47b2e4;
        }

       
        #menu-toggle {
            display: none;
        }

        #hamburger-btn {
            font-size: 1.8rem;
            color: #fff;
            cursor: pointer;
            display: none;
            order: 1;
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
    position: relative;
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
    transition: background-color 0.3s ease;
    display: inline-block;
    margin-right: 15px;
}

.hero-section .buttons .join {
    background-color: #47b2e4;
}

.hero-section .buttons .learn {
    border: 1px solid #fff;
}

.hero-section .buttons a:hover {
    background-color: #3394c8;
}

.hero-section .img {
    display: none; 
}

@media screen and (max-width: 768px) {
    .hero-section {
        flex-direction: column;
        align-items: center;
        height: auto;
        padding: 30px 15px;
    }

    .hero-section .hero {
        max-width: 90%;
        text-align: center;
    }

    .hero-section h2 {
        font-size: 2rem;
    }

    .hero-section p {
        font-size: 1rem;
    }

    .hero-section .buttons a {
        margin: 10px 0;
    }

    .hero-section .img {
        display: block;
        max-width: 100%;
        margin-top: 20px;
    }
}

    </style>
</head>
<body>
    <%@ include file="Loginheader.jsp" %>
    <section class="hero-section">
        <div class="hero">
            <h2>Manage Your Events Effortlessly</h2>
            <p>
                Discover a streamlined platform to create, organize, and manage all your events with ease. 
                From planning to execution, we make event management simple and efficient.
            </p>
            <div class="buttons">
                <a href="#" class="join">Get Started</a>
                <a href="#" class="learn">Learn More</a>
            </div>
        </div>
           <div class="login-container">
    <h2>Registration</h2>
   <form action="/userinsert" method="post" enctype="multipart/form-data" onsubmit="return confirmSubmission()">
    <table>
        <tr>
            <td><label for="username">Username</label></td>
            <td><input type="text" id="username" name="user" placeholder="Username here" maxlength="40" required /></td>
        </tr>
        <tr>
            <td><label for="email">Email</label></td>
            <td><input type="email" id="email" name="email" placeholder="Email here" maxlength="40" required /></td>
        </tr>
        <tr>
            <td><label for="mobile">Mobile Number</label></td>
            <td><input type="text" id="mobile" name="mobile" placeholder="Mobile Number here" maxlength="10" required /></td>
        </tr>
        <tr>
            <td><label for="address">Address</label></td>
            <td><input type="text" id="address" name="address" placeholder="Address Here.." maxlength="40" required /></td>
        </tr>
        <tr>
            <td><label for="password">Password</label></td>
            <td><input type="password" id="password" name="password" placeholder="Password here" maxlength="10" required /></td>
        </tr>
        <tr>
            <td><label for="img">Profile Img</label></td>
            <td><input type="file" id="img" name="img" required /></td>
        </tr>
        <tr>
            <td colspan="2"><button type="submit">Sign Up</button></td>
        </tr>
        <tr>
            <td colspan="2" class="signup-link">
                <p>Don't have an account? <a href="index.jsp">Log In</a></p>
            </td>
        </tr>
    </table>
</form>

     <script>
        function clearForm() {
        	
        	 alert("data");
           document.getElementById("userForm").reset();
        }
        
        function confirmSubmission() {
            return confirm("Are you sure all the details are correct? Make sure your email is right.");
        }
    </script>
</div>
           </section>
   
    </section>
   <%@ include file="Loginfooter.jsp" %>
</body>
</html>
