<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%
if(session == null){
	response.sendRedirect("./index.jsp");
}
%>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Event Management System - Admin Dashboard</title>
    <link rel="stylesheet" href="style.css" />
    <style>
        /* Your existing styles here */
        @import url("https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;500;600;700&display=swap");

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Open Sans", sans-serif;
        }

        body {
            flex-direction: column;
            min-height: 100vh;
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
            padding: 16px 15px;
        }

        .navbar .logo {
            display: flex;
            align-items: center;
        }

        .navbar .logo img {
            height: 50px; 
            margin-right: 10px; 
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
       .navbar {
    display: flex;
    align-items: center;
    justify-content: space-between;
    max-width: 1200px;
    margin: 0 auto;
    padding: 16px 15px;
}

.logo {
    display: flex;
    align-items: center;
}

.logo-img {
    height: 50px;
    margin-right: 10px;
}

.profile {
    display: flex;
    align-items: center;
    margin-left: 0px; /* Adjust spacing if needed */
}

.profile-img {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    margin-right: 10px;
}

.profile-name {
    color: #fff;
    font-size: 1.2rem;
    font-weight: 500;
}
        
    </style>
</head>
<body>
<header class="header">
    <nav class="navbar">
         <div class="profile">
            <img src="./image/<%=session.getAttribute("userImagedata") %>" alt="Profile Image" class="profile-img" />
            <span class="profile-name">Hi,<%=session.getAttribute("userNameData") %></span>
        </div>
        <input type="checkbox" id="menu-toggle" />
        <label for="menu-toggle" id="hamburger-btn">
            <svg xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24">
                <path d="M3 12h18M3 6h18M3 18h18" stroke="currentColor" stroke-width="2" stroke-linecap="round" />
            </svg>
        </label>
        <ul class="links">
            <li><a href="/UserHome"><i class="fas fa-home"></i> Home</a></li>
            <li class="dropdown">
                <a href="#"><i class="fas fa-calendar-alt"></i> Events</a>
                <div class="dropdown-content">
                    <a href="/MyEvent"><i class="fas fa-calendar-alt"></i> My Events</a>
                    <a href="/BookEvent"><i class="fas fa-ticket-alt"></i> Book Event</a>
                </div>
            </li>
            <li><a href="/MyEventQrCode"><i class="fas fa-ticket-alt"></i> My Tickets (QR Codes)</a></li>
            <li class="dropdown">
                <a href="#"><i class="fas fa-cogs"></i> Settings</a>
                <div class="dropdown-content">
                    <a href="/profile"><i class="fas fa-user"></i> Profile</a>
                    <a href="/logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
                </div>
            </li>
        </ul>

        <div class="buttons">
            <a href="/logout" class="signup"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>
    </nav>
</header>
</body>

</html>
