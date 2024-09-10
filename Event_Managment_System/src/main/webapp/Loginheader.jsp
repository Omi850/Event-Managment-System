<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Event Management System</title>
    <link rel="stylesheet" href="style.css" />
    <style>
        @import url("https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;500;600;700&display=swap");

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Open Sans", sans-serif;
        }
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            background: linear-gradient(to bottom, #175d69 23%, #330c43 95%);
        }

        .header,
        .footer {
            background-color: #175d69;
            color: #fff;
        }

        .header {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1000;
        }

        .navbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px 15px;
        }

        .navbar .logo a {
            font-size: 1.8rem;
            text-decoration: none;
            color: #fff;
        }

        .navbar .links {
            display: flex;
            align-items: center;
            list-style: none;
            gap: 35px;
        }

        .navbar .links a {
            font-weight: 500;
            text-decoration: none;
            color: #fff;
            padding: 10px 0;
            transition: 0.2s ease;
        }

        .navbar .links a:hover {
            color: #47b2e4;
        }

        .navbar .buttons a {
            text-decoration: none;
            color: #fff;
            font-size: 1rem;
            padding: 15px 0;
            transition: 0.2s ease;
        }
        .navbar .buttons a:not(:last-child) {
            margin-right: 30px;
        }

        .navbar .buttons .signin:hover {
            color: #47b2e4;
        }
        .navbar .buttons .signup {
            border: 1px solid #fff;
            padding: 10px 20px;
            border-radius: 0.375rem;
            text-align: center;
            transition: 0.2s ease;
        }

        .navbar .buttons .signup:hover {
            background-color: #47b2e4;
            color: #fff;
        }   
        .buttons .join {
            background-color: #47b2e4;
        }


        /* Hamburger menu styles */
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

        @media screen and (max-width: 1023px) {
            .navbar .logo a {
                font-size: 1.5rem;
            }

            .links {
                position: fixed;
                left: -100%;
                top: 75px;
                width: 100%;
                height: 100vh;
                padding-top: 50px;
                background: #175d69;
                flex-direction: column;
                transition: 0.3s ease;
            }

            .navbar #menu-toggle:checked~.links {
                left: 0;
            }

            .navbar #hamburger-btn {
                display: block;
            }

            .header .buttons {
                display: none;
            }

            .hero-section .hero {
                max-width: 100%;
                text-align: center;
            }

            .hero-section img {
                display: none;
            }
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
                .dropdown {
            position: relative;
        }

        .dropdown > a {
            text-decoration: none;
            color: #fff;
            padding: 10px 15px;
            display: block;
            transition: background-color 0.2s ease;
        }

        .dropdown > a:hover {
            background-color: #47b2e4;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #175d69;
            min-width: 160px;
            text-align: center;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }

        .dropdown-content a {
            color: #fff;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            transition: background-color 0.2s ease;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .dropdown-content {
            right: 0;
        }
    </style>
</head>
<body>
    <header class="header">
        <nav class="navbar">
            <h2 class="logo"><a href="#">Event Management</a></h2>
            <input type="checkbox" id="menu-toggle" />
            <label for="menu-toggle" id="hamburger-btn">
                <svg xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24">
                    <path d="M3 12h18M3 6h18M3 18h18" stroke="currentColor" stroke-width="2" stroke-linecap="round" />
                </svg>
            </label>
            <ul class="links">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="About.jsp">About Us</a></li>
                  <li class="dropdown">
                    <a href="#"><i class="fas fa-calendar-alt"></i> Setting</a>
                    <div class="dropdown-content">
                 <a href="Usersignup.jsp" class="signup">Sign Up</a>
                <a href="index.jsp" class="signup">Sign In</a>
                <a href="AdminLogin.jsp" class="signin">Admin</a>
                    </div>
                </li>
            </ul>
            <div class="buttons">
                <a href="Usersignup.jsp" class="signup">Sign Up</a>
                <a href="index.jsp" class="signup">Sign In</a>
                <a href="AdminLogin.jsp" class="signin">Admin</a>
            </div>
        </nav>
    </header>
</body>
</html>