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
        body, html {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        /* Footer Styling */
        .footer {
            padding: 20px 0;
            text-align: center;
            margin-top: auto;
            background-color: #175d69;
            color: #fff;
        }

        .footer-content {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 15px;
        }

        .footer p {
            margin-bottom: 10px;
        }

        .footer-links {
            list-style: none;
            display: flex;
            justify-content: center;
            gap: 20px;
            padding: 0;
            margin: 0;
        }

        .footer-links a {
            color: #fff;
            text-decoration: none;
            transition: color 0.2s ease;
        }

        .footer-links a:hover {
            color: #47b2e4;
        }

        /* Hero Section Styling */
        .hero-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 60px 15px;
            max-width: 1200px;
            margin: 0 auto;
            color: #fff;
            position: relative;
            background: url('your-image.jpg') no-repeat center center;
            background-size: cover;
            min-height: 100vh;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .hero-section {
                flex-direction: column;
                justify-content: center;
                text-align: center;
                padding: 30px 15px;
            }

            .footer-links {
                flex-direction: column;
                gap: 10px;
            }

            .footer p {
                font-size: 14px;
            }
        }

        @media (max-width: 480px) {
            .hero-section {
                padding: 20px 10px;
            }

            .footer-links a {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <section class="hero-section">
        <!-- Content for the hero section -->
    </section>

    <footer class="footer">
        <div class="footer-content">
            <p>&copy; 2024 Event Management System. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
