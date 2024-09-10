<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Event Management System - Admin Dashboard</title>
    <link rel="stylesheet" href="style.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
@import url("https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;500;600;700&display=swap");

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Open Sans", sans-serif;
}

.event-form-container {
    max-width: 1300px;
    margin: 100px auto;
    padding: 0 12px;
    
}

.event-form {
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
     
}

.event-form h2 {
    font-size: 2rem;
    margin-bottom: 20px;
    color: #175d69;
}

.event-form table {
    width: 100%;
    border-collapse: collapse;
}

.event-form th, .event-form td {
    padding: 2px;
    border: 1px solid #ddd;
    
}

.event-form th {
    background-color: #f4f4f4;
    text-align: left;
}

.event-form tr:hover {
    background-color: #f1f1f1;
}

.event-form label {
    display: block;
    margin-bottom: 8px;
    font-weight: bold;
}

.event-form input,
.event-form select,
.event-form textarea {
    width: 100%;
    padding: 12px;
    border: 1px solid #ddd;
    border-radius: 4px;
}

.event-form button {
    background-color: #47b2e4;
    color: #fff;
    border: none;
    padding: 15px 20px;
    border-radius: 4px;
    cursor: pointer;
    font-size: 1rem;
    transition: background-color 0.2s ease;
    margin-top: 10px;
    display: block;
    width: 100%;
}

.event-form button:hover {
    background-color: #3394c8;
}

/* Top Bar Styles */
.top-bar {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    gap: 20px;
    margin-bottom: 20px;
}

.events-button {
    background-color: #47b2e4;
    color: #fff;
    text-decoration: none;
    padding: 10px 20px;
    border-radius: 4px;
    font-size: 1rem;
    transition: background-color 0.2s ease;
}

.events-button:hover {
    background-color: #3394c8;
}

.event-count {
    font-size: 1.2rem;
    font-weight: bold;
    color: #175d69;
    padding: 10px 20px;
    border: 2px solid #175d69;
    border-radius: 50%;
    width: 50px;
    height: 50px;
    display: flex;
    align-items: center;
    justify-content: center;
}

@media (max-width: 768px) {
    .event-form-container {
        margin: 50px auto;
        padding: 0 8px;
    }

    .event-form h2 {
        font-size: 1.75rem;
    }

    .event-form th, .event-form td {
        padding: 8px;
    }

    .event-form input,
    .event-form select,
    .event-form textarea {
        padding: 10px;
    }

    .event-form button {
        padding: 12px 16px;
    }

    .top-bar {
        flex-direction: column;
        align-items: flex-start;
        gap: 10px;
    }

    .events-button {
        width: 100%;
        text-align: center;
        padding: 12px 0;
    }

    .event-count {
        width: 40px;
        height: 40px;
        font-size: 1rem;
        padding: 8px 12px;
    }
}

@media (max-width: 480px) {
    .event-form-container {
        margin: 30px auto;
        padding: 0 4px;
    }

    .event-form h2 {
        font-size: 1.5rem;
    }

    .event-form table {
        border: none;
    }

    .event-form th, .event-form td {
        display: block;
        width: 100%;
        padding: 6px;
        border: none;
    }

    .event-form input,
    .event-form select,
    .event-form textarea {
        padding: 8px;
    }

    .event-form button {
        padding: 10px 12px;
        font-size: 0.9rem;
    }

    .top-bar {
        flex-direction: column;
        align-items: flex-start;
        gap: 8px;
    }

    .events-button {
        width: 100%;
        text-align: center;
        padding: 10px 0;
    }

    .event-count {
        width: 30px;
        height: 30px;
        font-size: 0.9rem;
        padding: 6px 10px;
    }
}
    </style>
    <script type="text/javascript">
window.onload = function() {
    var message = "${param.message}";
    if (message) {
        alert(message);
        location.replace("Admin/AdminEvent.jsp");
        }
};
</script>
</head>
<body>
           <%@ include file="AdminHeader.jsp" %>
    <main> 
<section class="event-form-container">
    <div class="event-form">
        <h2>Create Event</h2>
        <form action="/createEvent" method="post" enctype="multipart/form-data">
            <div class="top-bar">
                <a href="/ShowEvent" class="events-button">
                    <i class="fas fa-calendar-alt"></i> Upcoming Events
                </a>

                <a href="/ShowEventcomAll" class="events-button">
                    <i class="fas fa-list"></i> All Events
                </a>
                <div class="event-count"><%=session.getAttribute("count") %></div>
            </div>
            <table>
                <tr>
                    <th><label for="eventName">Event Name</label></th>
                    <td><input type="text" id="eventName" name="eventName" placeholder="Event Name Here.." maxlength="100" required /></td>
                    <th><label for="eventStartDate">Start Date</label></th>
                    <td><input type="datetime-local" id="startDate" name="startDate" placeholder="Start date Here.." required /></td>
                </tr>
                <tr>
                    <th><label for="eventEndDate">End Date</label></th>
                    <td><input type="datetime-local" id="endDate" name="endDate" placeholder="End date Here.." required /></td>
                    <th><label for="eventLocation">Location</label></th>
                    <td><input type="text" id="location" name="location" placeholder="Event Location Here.." maxlength="150" required /></td>
                </tr>
                <tr>
                    <th><label for="eventOrganizer">Organizer</label></th>
                    <td><input type="text" id="name" name="name" placeholder="Organizer Name Here.." maxlength="100" required /></td>
                    <th><label for="organizerProfileImage">Organizer Profile Image</label></th>
                    <td><input type="file" id="profileImg" name="profileImg" placeholder="Profile Image Here.." accept="image/*" /></td>
                </tr>
                <tr>
                    <th><label for="functionImage">Function Invitee</label></th>
                    <td><input type="file" id="eventImg" name="eventImg" placeholder="Event Image Here.." accept="file/*" /></td>
                    <th><label for="eventContact">Contact Email</label></th>
                    <td><input type="email" id="email" placeholder="Email Here.." maxlength="100" name="email" /></td>
                </tr>
                <tr>
                    <th><label for="eventType">Event Type</label></th>
                    <td>
                        <select id="eventType" name="eventType" required>
                            <option value="corporate">Corporate</option>
                            <option value="private">Private</option>
                            <option value="charity">Charity</option>
                        </select>
                    </td>
                    <th><label for="status">Status</label></th>
                    <td>
                        <select id="status" name="status" required>
                            <option value="upcoming">Upcoming</option>
                            <option value="completed">Completed</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th><label for="eventDescription">Description</label></th>
                    <td><textarea id="description" name="description" rows="2" placeholder="Event Description Here.." maxlength="500" required></textarea></td>
                </tr>
            </table>
            <button type="submit">Create Event</button>
        </form>
    </div>
</section>
    </main>
            <%@ include file="AdminFooter.jsp" %>
</body>
</html>