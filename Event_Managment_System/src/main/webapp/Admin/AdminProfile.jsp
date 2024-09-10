<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Event Management System - Update Profile</title>
    <link rel="stylesheet" href="style.css" />
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .profile-form-container {
            max-width: 600px;
            margin: 100px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }

        .profile-form-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
            font-size: 24px;
            font-weight: 600;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
            color: #555;
        }

        .form-group input[type="text"],
        .form-group input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .form-group i {
            margin-right: 10px;
            color: #006bff;
            font-size: 1.2rem;
        }

        .profile-form-container button {
            width: 100%;
            padding: 12px;
            background-color: #175d69;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
        }

        .profile-form-container button:hover {
            background-color: #47b2e4;
        }

        .error {
            color: red;
            margin-bottom: 10px;
            font-weight: bold;
        }

        .status {
            font-weight: bold;
            padding: 5px;
            border-radius: 4px;
            color: #fff;
        }

        .status.active {
            background-color: #28a745; 
        }

        .status.inactive {
            background-color: #dc3545; 
        }

        .status.pending {
            background-color: #ffc107; 
            color: #333;
        }
    </style>
</head>
<body>
    <%@ include file="AdminHeader.jsp" %>

    <div class="profile-form-container">
        <h2>Update Profile</h2>
    
        <form action="/resetPassword" method="post" onsubmit="return validatePasswords() && confirmUpdate()">
            <div class="form-group">
                <i class="fas fa-user"></i>
                <label for="username">Username</label>
                <input type="text" id="username" name="username" value="<%=session.getAttribute("adminEmail") %>" readonly required>
            </div>
            <div class="form-group">
                <i class="fas fa-lock"></i>
                <label for="currentPassword">Current Password</label>
                <input type="text" id="currentPassword" name="currentPassword" value="<%=session.getAttribute("adminpass") %>" readonly required>
            </div>
            <div class="form-group">
                <i class="fas fa-key"></i>
                <label for="newPassword">New Password</label>
                <input type="password" id="newPassword" name="newPassword" placeholder="New password here..." required>
            </div>
            <div class="form-group">
                <i class="fas fa-key"></i>
                <label for="confirmPassword">Confirm New Password</label>
                <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm password here..." required>
            </div>
            <div id="error-message" class="error"></div>
            <button type="submit">Update Profile</button>
        </form>
    
        <script>
            function validatePasswords() {
                var newPassword = document.getElementById("newPassword").value;
                var confirmPassword = document.getElementById("confirmPassword").value;
                var errorMessage = document.getElementById("error-message");
                
                errorMessage.textContent = "";
                
                if (newPassword !== confirmPassword) {
                    errorMessage.textContent = "Passwords do not match!";
                    return false; 
                }
                return true; 
            }

            function confirmUpdate() {
                return confirm("Are you sure you want to update your password?");
            }
        </script>
    </div>
    
    <%@ include file="AdminFooter.jsp" %>
</body>
</html>
