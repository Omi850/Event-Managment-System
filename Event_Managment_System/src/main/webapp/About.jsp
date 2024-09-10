<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>About Us - Event Management System</title>
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
            background: linear-gradient(to bottom, #330c43, #175d69);
        }

        .content {
            margin-top: 200px;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            color: #fff;
            text-align: center;
        }

        h1 {
            font-size: 3rem;
            margin-bottom: 20px;
        }

        p {
            font-size: 1.2rem;
            line-height: 1.8;
            margin-bottom: 30px;
        }

        .team-section {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
        }

        .team-member {
            max-width: 300px;
            margin-bottom: 30px;
        }

        .team-member img {
            border-radius: 50%;
            width: 150px;
            height: 150px;
            object-fit: cover;
            margin-bottom: 15px;
        }

        .team-member h3 {
            font-size: 1.5rem;
            margin-bottom: 10px;
        }

        .team-member p {
            font-size: 1rem;
        }

        .footer {
            background-color: #175d69;
            color: #fff;
            text-align: center;
            padding: 10px 0;
            position: fixed;
            width: 100%;
            bottom: 0;
        }

        @media (max-width: 768px) {
            h1 {
                font-size: 2.5rem;
            }

            .team-member {
                width: 100%;
            }
        }
    </style>
</head>

<body>
            <%@ include file="Loginheader.jsp" %>
    <section class="content">
        <h1>About Us</h1>
        <p>
            Welcome to the Event Management System! We are dedicated to providing an all-in-one platform to help organizers 
            create, manage, and promote their events with ease. Whether you’re planning a small community gathering or a large 
            corporate event, our system ensures everything runs smoothly from start to finish.
        </p>

        <h2>Meet Our Team</h2>
        <div class="team-section">
            <div class="team-member">
                <img src="/Omkar Bharat Yadav.jpg" alt="Team Member 1" />
                <h3>Omkar Yadav</h3>
                <p>Java Developer</p>
            </div>

        </div>
    </section>
            <%@ include file="Loginfooter.jsp" %>
 
</body>

</html>
