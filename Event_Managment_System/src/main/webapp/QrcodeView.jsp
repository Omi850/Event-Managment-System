<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event Bill Details</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .bill-container {
            width: 70%;
            background-color: #ffffff;
            border-radius: 12px;
            border: 1px solid #d1d1d1;
            padding: 30px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #444;
            font-size: 28px;
            margin-bottom: 20px;
            border-bottom: 2px solid #eeeeee;
            padding-bottom: 10px;
        }
        p {
            font-size: 16px;
            margin: 10px 0;
            color: #666;
        }
        .details-container {
            display: flex;
            justify-content: space-between;
            margin-bottom: 30px;
        }
        .details-section {
            width: 48%;
        }
        .details-section p {
            margin: 8px 0;
        }
        .details-section strong {
            color: #333;
        }
        .qr-code {
            text-align: center;
            margin-top: 30px;
        }
        .qr-code img {
            margin-top: 20px;
            border: 2px solid #ddd;
            padding: 10px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        @media (max-width: 768px) {
            .details-container {
                flex-direction: column;
            }
            .details-section {
                width: 100%;
                margin-bottom: 20px;
            }
            .bill-container {
                width: 90%;
            }
        }
    </style>
</head>
<body>
    <div class="bill-container">
        <h2>Event & Invitee Details</h2>
        <div class="details-container">
            <div class="details-section">
                <h3>Event Details</h3>
                <p><strong>Organizer Name:</strong> ${organizerName}</p>
                <p><strong>Organizer Email:</strong> ${organizerEmail}</p>
                <p><strong>Event Name:</strong> ${eventName}</p>
                <p><strong>Location:</strong> ${location}</p>
                <p><strong>Start Date:</strong> ${startDate}</p>
            </div>
            <div class="details-section">
                <h3>Invitee Details</h3>
                <p><strong>Invitee Name:</strong> ${inviteeName}</p>
                <p><strong>Email:</strong> ${email}</p>
                <p><strong>Mobile:</strong> ${mobile}</p>
            </div>
        </div>
        <div class="qr-code">
            <h3>QR Code</h3>
            <img src="data:image/png;base64,${qrCode}" alt="QR Code">
        </div>
    </div>
</body>
</html>
