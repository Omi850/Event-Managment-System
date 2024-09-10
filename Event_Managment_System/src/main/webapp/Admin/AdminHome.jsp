<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    if (message && message !== 'null') {
        alert(message);
        location.replace("/AdminHome");
    }
};
</script>

<body>
    <%@ include file="AdminHeader.jsp" %>
    <section class="dashboard-overview">
        <div class="dashboard-item">
            <div class="dashboard-content">
                <div class="dashboard-icon-title">
                    <i class="fas fa-calendar-alt"></i> 
                    <h3>Events</h3>
                </div>
                <p><%=session.getAttribute("count") %></p>
            </div>
        </div>
        <div class="dashboard-item">
            <div class="dashboard-content">
                <div class="dashboard-icon-title">
                    <i class="fas fa-users"></i> 
                    <h3>Users</h3>
                </div>
                <p><%=session.getAttribute("usercount") %></p>
            </div>
        </div>
        <div class="dashboard-item">
            <div class="dashboard-content">
                <div class="dashboard-icon-title">
                    <i class="fas fa-ticket-alt"></i> 
                    <h3>Bookings</h3>
                </div>
                <p><%=session.getAttribute("userBooking") %></p>
            </div>
        </div>
        <div class="dashboard-item">
    <div class="dashboard-content">
        <div class="dashboard-icon-title">
            <i class="fas fa-calendar-check"></i> 
            <h3>Attended</h3>
        </div>
        <p><%=session.getAttribute("userAttend") %></p>
     </div>
   </div>
    </section>
    <section class="user-table-container">
        <h2>Recent Organizers</h2>
        <div class="search-container">
            <input type="text" id="searchInput" placeholder="Search users..." />
        </div>
        <table class="user-table">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Profile</th>
                    <th>Event Name</th>
                    <th>Organizer Email</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Location</th>
                    <th>Status</th>
                </tr>
                <%int i=1; %>
            </thead>
            <tbody id="userTableBody">
                <c:forEach var="std" items="${Eventdata}">
                    <tr>
                        <td><%=i++ %></td>
                        <td><img src="./image/${std.profileImg}" alt="Profile Image" class="profile-img">${std.name}</td>
                        <td>${std.eventName}</td>
                        <td>${std.email}</td>
                        <td>${std.startDate}</td>
                        <td>${std.endDate}</td>
                        <td>${std.location}</td>
                        <td class="status">
                            <i class="status-icon fas ${std.status == 'Upcoming' ? 'fa-calendar-check upcoming' : 'fa-calendar-times completed'}"></i> ${std.status}
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
    <%@ include file="AdminFooter.jsp" %>
</body>
</html>
