<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
 <script>
        window.onload = function() {
            // Check if the message parameter exists
            var message = "${param.message}";
            if (message) {
                alert(message);
                location.replace("UserHome.jsp?email=${param.email}&password=${param.password}");

                }
        };
    </script>
<body>
<h1>Welcome To User Pannel</h1>
     <h1>All Users and Images</h1>
   <table>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Email</th>
        <th>City</th>
        <th>Password</th>

    </tr>
    <c:forEach var="std" items="${data}">
        <tr>
            <td>${std.id}</td>
            <td>${std.user}</td>
            <td>${std.email}</td>
            <td>${std.mobile}</td>
            <td></td>

        </tr>
    </c:forEach>
</table>
</html>