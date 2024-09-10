<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Open Sans", sans-serif;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: #f4f4f4;
        }

        .profile-container {
            background-color: #fff;
            padding: 20px;
            width: 100%;
            max-width: 900px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            margin: 20px;
        }

        .profile-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 20px;
            flex-wrap: wrap;
            text-align: center;
        }

        .profile-header-left {
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
        }

        .profile-img-data {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 10px;
            border: 3px solid #47b2e4;
        }

        .upload-btn-wrapper {
            position: relative;
            overflow: hidden;
            display: inline-block;
            margin-top: 10px;
        }

        .upload-btn {
            background-color: #47b2e4;
            color: white;
            padding: 8px 15px;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
        }

        .upload-btn:hover {
            background-color: #175d69;
        }

        .upload-btn-wrapper input[type=file] {
            font-size: 100px;
            position: absolute;
            left: 0;
            top: 0;
            opacity: 0;
        }

        .profile-header-right {
            flex: 1;
            text-align: left;
            margin-left: 20px;
        }

        .profile-header-right h2 {
            font-size: 1.8rem;
            font-weight: 600;
            color: #333;
            margin-bottom: 5px;
        }

        .profile-header-right p {
            font-size: 1rem;
            color: #777;
            margin-bottom: 10px;
        }

        table {
            width: 100%;
            margin-top: 20px;
        }

        table td {
            padding: 10px;
        }

        table input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
        }

        table input[type="submit"] {
            background-color: #47b2e4;
            color: #fff;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        table input[type="submit"]:hover {
            background-color: #175d69;
        }

        .profile-details i {
            margin-right: 8px;
            color: #47b2e4;
        }

        @media screen and (max-width: 768px) {
            .profile-header {
                flex-direction: column;
            }

            .profile-header-left {
                margin-bottom: 15px;
            }

            .profile-header-right {
                text-align: center;
                margin-left: 0;
            }
        }
    </style>
</script>
</head>
<body>
    <%@ include file="UserHeader.jsp" %>
    <div class="profile-container">
 <form action="/UpdateUserProfile" method="post" enctype="multipart/form-data" onsubmit="return confirmUpdate()">    
         <div class="profile-header">
            <div class="profile-header-left">
                <img src="./image/${data.img}" alt="Profile Image" class="profile-img-data">
                <div class="upload-btn-wrapper">
                    <button class="upload-btn"><i class="fas fa-camera"></i> Change Picture</button>
                    <input type="file" name="img" accept="image/*">
                </div>
            </div>
            <div class="profile-header-right">
                <h2>${data.user}</h2>
                <p>Email: ${data.email}</p>
            </div>
        </div>

        <div class="profile-details">
            <table>
                <tr>
                    <td><label for="mobile"><i class="fas fa-mobile-alt" ></i> Mobile</label></td>
                    <td><label for="email"><i class="fas fa-envelope"></i> Email</label></td>
                </tr>
                <tr>
                    <td><input type="text" id="mobile" name="mobile" placeholder="Enter your mobile number" value="${data.mobile}" required="required"></td>
                    <td><input type="email" id="email" name="email" placeholder="Enter your email" value="${data.email}" required="required"></td>
                </tr>
                <tr>
                    <td><label for="address"><i class="fas fa-home"></i> Address</label></td>
                    <td><label for="password"><i class="fas fa-lock"></i> Password</label></td>
                </tr>
                <tr>
                    <td><input type="text" id="address" name="address" placeholder="Enter your address" value="${data.address}" required="required"></td>
                    <td><input type="text" id="password" name="password" value="${data.password}" placeholder="Enter your password" required="required"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="Update Profile">
                    </td>
                </tr>
            </table>
        </div>
        </form>
        <script>
  function confirmUpdate() {
    return confirm("Are you sure you want to update your profile?");
  }
</script>
    </div>
  <%@ include file="UserFooter.jsp" %>
</body>
</html>