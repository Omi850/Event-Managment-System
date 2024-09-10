<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <title>Event Management System - Admin Dashboard</title>
    <link rel="stylesheet" href="style.css" />
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .dashboard-overview {
            display: flex;
            justify-content: space-around;
            margin: 90px auto 10px auto;
            max-width: 1400px;
            gap: 20px;
            padding: 0 15px;
            flex-wrap: wrap;
        }

        .dashboard-item {
            flex: 1;
            background-color: #fff;
            color: #333;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .dashboard-item h3 {
            font-size: 1.2rem;
            margin-bottom: 10px;
            color: #333;
        }

        .dashboard-item p {
            font-size: 2rem;
            font-weight: bold;
            margin: 0;
            color: #006bff;
        }

        .dashboard-item:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        }

        .user-table-container {
            max-width: 1400px;
            margin: 20px auto;
            padding: 0 15px;
        }

        .user-table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .user-table th,
        .user-table td {
            padding: 12px 15px;
            text-align: left;
            font-size: 0.9rem;
        }

        .user-table th {
            background-color: #006bff;
            color: #fff;
        }

        .user-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .user-table tr:hover {
            background-color: #e1e1e1;
        }

        .status-icon {
            font-size: 1.2em;
            margin-right: 5px;
        }

        .status-icon.upcoming {
            color: #4CAF50; 
        }

        .status-icon.completed {
            color: #f44336; 
        }

        .search-container {
            margin-bottom: 20px;
            text-align: right;
        }

        #searchInput {
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
            width: 100%;
            max-width: 400px;
            box-sizing: border-box;
        }

        #searchInput::placeholder {
            color: #aaa;
        }

        .profile-img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 10px;
            vertical-align: middle;
        }

        .dashboard-icon-title {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .dashboard-icon-title i {
            color: #006bff;
            font-size: 2rem;
        }
    </style>
</head>
<script type="text/javascript">
window.onload = function() {
    var urlParams = new URLSearchParams(window.location.search);
    var message = "${param.message}";
    if (!(message==='null')) {
        alert(message);
        location.replace("/UserHome");
    }
};
</script>
<body>
    <%@ include file="UserHeader.jsp" %>

<section class="dashboard-overview">
    <div class="dashboard-item">
        <div class="dashboard-content">
            <div class="dashboard-icon-title">
                <i class="fas fa-calendar-alt"></i>
                <h3>My Events</h3>
            </div>
            <p><%=session.getAttribute("BookCount") %></p>
        </div>
    </div>
    <div class="dashboard-item">
        <div class="dashboard-content">
            <div class="dashboard-icon-title">
                <i class="fas fa-ticket-alt"></i> 
                <h3>My Bookings</h3>
            </div>
            <p><%=session.getAttribute("accepted") %></p>
        </div>
    </div>
    <div class="dashboard-item">
        <div class="dashboard-content">
            <div class="dashboard-icon-title">
                <i class="fas fa-calendar-check"></i> 
                <h3>Upcoming Events</h3>
            </div>
            <p><%=session.getAttribute("upcoming") %></p>
        </div>
    </div>
    <div class="dashboard-item">
        <div class="dashboard-content">
            <div class="dashboard-icon-title">
                <i class="fas fa-check-circle"></i>
                <h3>Attended Events</h3>
            </div>
            <p><%=session.getAttribute("attend") %></p> 
        </div>
    </div>
</section>


   <section class="user-table-container">
    <h2>My Booked Events</h2>
    <div class="search-container">
        <input type="text" id="searchInput" placeholder="Search events..." />
    </div>
    <table class="user-table">
        <thead>
            <tr>
                <th>Event Name</th>
                <th>Organizer Name</th>
                <th>Organizer Email</th>
                <th>Start Date</th>
                <th>Location</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody id="userTableBody">
            <c:forEach var="event" items="${userEvents}">
                <tr>
                    <td>${event.eventName}</td>
                    <td>${event.name}</td>
                    <td>${event.email}</td>
                    <td>${event.startDate}</td>
                    <td>${event.location}</td>
                    <td>
                            <c:choose>
                                <c:when test="${event.statues == 'pending'}">
                                    <i class="fas fa-hourglass-half status-pending"></i> Pending
                                </c:when>
                                <c:when test="${event.statues == 'accepted'}">
                                    <i class="fas fa-check status-accepted"></i> Accepted
                                </c:when>
                                <c:when test="${event.statues == 'attended'}">
                                    <i class="fas fa-user-check status-attended"></i> Attended
                                </c:when>
                                <c:otherwise>
                                    <i class="fas fa-question-circle"></i> Unknown
                                </c:otherwise>
                            </c:choose>
                        </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</section>


    <script>
        document.getElementById('searchInput').addEventListener('input', function () {
            var searchValue = this.value.toLowerCase();
            var tableRows = document.querySelectorAll('#userTableBody tr');

            tableRows.forEach(function (row) {
                var cells = row.getElementsByTagName('td');
                var matched = false;

                for (var i = 0; i < cells.length; i++) {
                    if (cells[i].textContent.toLowerCase().includes(searchValue)) {
                        matched = true;
                        break;
                    }
                }
                if (matched) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        });
    </script>

    <%@ include file="UserFooter.jsp" %>
</body>
</html>
