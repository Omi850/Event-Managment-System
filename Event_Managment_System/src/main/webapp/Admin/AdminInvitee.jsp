<%@page import="com.example.demo.Model.Userdata"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* Base Styles */
.container {
    border-radius: 10px;
    margin: 100px auto;
    max-width: 1400px;
    padding: 20px;
    background-color: #f4f4f4;
}

.search-bar {
    display: flex;
    gap:10px;
    justify-content: space-between;
    margin-bottom: 20px;
}

.search-bar input {
    width: 55%;
    padding: 10px;
    font-size: 1rem;
    border: 1px solid #ddd;
    border-radius: 5px;
}

.button-group {
    display: flex;
    gap: 10px;
}

.button-group button {
    padding: 10px 20px;
    border: none;
    background-color: #47b2e4;
    color: white;
    cursor: pointer;
    border-radius: 5px;
}

.button-group button:hover {
    background-color: #175d69;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

table th, table td {
    padding: 10px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

table th {
    background-color: #175d69;
    color: white;
}

table td {
    background-color: #f9f9f9;
}

.pagination {
    display: flex;
    justify-content: flex-end;
    gap: 10px;
}

.pagination button {
    padding: 10px 15px;
    border: none;
    background-color: #47b2e4;
    color: white;
    cursor: pointer;
    border-radius: 5px;
}

.pagination button:hover {
    background-color: #175d69;
}

.actions button {
    padding: 5px 10px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.actions .update {
    background-color: #47b2e4;
    color: white;
}

.actions .delete {
    background-color: #f44336;
    color: white;
}

@media (max-width: 768px) {
    .container {
        padding: 10px;
        margin: 50px auto;
    }

    .search-bar {
        flex-direction: column;
        align-items: flex-start;
    }

    .search-bar input {
        width: 100%;
    }

    .button-group {
        flex-direction: column;
        width: 100%;
    }

    .button-group button {
        width: 100%;
    }

    .pagination {
        flex-direction: column;
        align-items: center;
    }

    .pagination button {
        width: 100%;
    }

    table th, table td {
        font-size: 0.9rem;
    }
}

@media (max-width: 480px) {
    .search-bar input {
        font-size: 0.875rem; 
    }

    .button-group button {
        font-size: 0.875rem;
    }

    .pagination button {
        padding: 8px 12px;
        font-size: 0.875rem;
    }

    table th, table td {
        font-size: 0.8rem;
    }
}

        .button-group {
            display: flex;
            gap: 10px;
        }

        .button-group button {
            position: relative; 
            padding: 10px 20px;
            border: none;
            background-color: #47b2e4;
            color: white;
            cursor: pointer;
            border-radius: 5px;
        }

        .button-group button:hover {
            background-color: #175d69;
        }
        .update:hover{
            background-color: #175d69;

        }
        .delete:hover{
            background-color: #851e16;
        }
        .badge {
            position: absolute;
            top: -10px; 
            right: -10px; 
            width: 30px; 
            height: 30px; 
            border-radius: 50%;
            background-color: #f44336; 
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.9rem;
            font-weight: bold;
        }
        .profile-image {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    margin-right: 10px;
    vertical-align: middle;
}
td span {
    vertical-align: middle;
}
button.Accepted {
  background-color: #28a745; 
  color: white;           
  border: none;            
  padding: 10px 20px;       
  border-radius: 5px;     
  cursor: pointer;          
}

button.Accepted:hover {
  background-color: #218838; 
}
button.Rejected {
  background-color: #dc3545; 
  color: white;              
  border: none;              
  padding: 10px 20px;       
  border-radius: 5px;     
  cursor: pointer;           
}

button.Rejected:hover {
  background-color: #c82333;
}

</style>
</head>
<body>
            <%@ include file="AdminHeader.jsp" %>
    
  <div class="container">
  <div class="search-bar">
    <input type="text" id="searchInput" placeholder="Search events..." onkeyup="searchTable()">
    <div class="button-group">
    <a href="/ShowPending?id=<%=session.getAttribute("Eventid") %>">
    <button onclick="filterTable('upcoming')">
      <i class="fas fa-calendar-alt"></i> Pending 
      <span class="badge"><%=session.getAttribute("PendingCount") %></span>
    </button>
  </a>
  <a href="/ShowRejected?id=<%=session.getAttribute("Eventid") %>">
    <button onclick="filterTable('upcoming')">
      <i class="fas fa-calendar-alt"></i> Rejected 
      <span class="badge"><%=session.getAttribute("RejectCount") %></span>
    </button>
  </a>
  <a href="/ShowAccepted?id=<%=session.getAttribute("Eventid") %>">
    <button onclick="filterTable('completed')">
      <i class="fas fa-check-circle"></i>Accepted
      <span class="badge"><%=session.getAttribute("AcceptCount") %></span>
    </button>
   </a>
   <a href="/ShowAttended?id=<%=session.getAttribute("Eventid") %>">
    <button onclick="filterTable('all')">
      <i class="fas fa-list"></i> Attended
      <span class="badge"><%=session.getAttribute("attendedCount") %></span>
    </button>
   </a>
  <a href="/ShowEventBook?id=<%=session.getAttribute("Eventid") %>">
    <button onclick="filterTable('all')">
      <i class="fas fa-list"></i> All Invitee 
      <span class="badge"><%=session.getAttribute("Allcount") %></span>
    </button>
  </a>
</div>
  </div>
  <%int i=1; %>
  <table id="eventTable">
    <thead>
      <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Email</th>
        <th>Mobile</th>
        <th>Address</th>
        <th>Actions</th>
      </tr>
    </thead>
    <tbody>
     <c:choose>
        <c:when test="${empty eventBook}">
            <tr>
                <td colspan="6" style="text-align: center;">Data not found</td>
            </tr>
        </c:when>
        <c:otherwise>
            <c:forEach var="std" items="${eventBook}">
                <tr class="upcoming">
                    <td><%=i++ %></td>
                    <td>
                        <img src="./image/${std.user_img}" alt="John Doe" class="profile-image">
                        <span><c:out value="${std.user_name}"/></span>
                    </td>
                    <td><c:out value="${std.user_email}"/></td>
                    <td><c:out value="${std.user_mobile}"/></td>
                    <td><c:out value="${std.user_address}"/></td>
                    <td class="actions">
                       <c:choose>
                           <c:when test="${std.statues == 'Rejected'}">
                               <button class="accepted" onclick="handleInvitee(${std.id})">
                                   <i class="fas fa-check-circle"></i> Accept
                               </button>
                           </c:when>
                           <c:when test="${std.statues == 'accepted'}">
                               <button class="Rejected" onclick="handleUpdate(${std.id})">
                                   <i class="fas fa-times-circle"></i> Reject
                               </button>
                               <button class="accepted" onclick="Present(${std.id})">
                                   <i class="fas fa-calendar-check"></i> Present
                               </button>
                               <button class="accepted" onclick="Qrcode(${std.id})">
                                   <i class="fas fa-qrcode"></i> QR Code
                               </button>
                           </c:when>
                           <c:when test="${std.statues == 'attended'}">
                               <button class="Rejected" onclick="handleInvitee(${std.id})">
                                   <i class="fas fa-times-circle"></i> Absent
                               </button>
                               <button class="accepted" onclick="Qrcode(${std.id})">
                                   <i class="fas fa-qrcode"></i> QR Code
                               </button>
                           </c:when>
                           <c:otherwise>
                               <button class="accepted" onclick="handleInvitee(${std.id})">
                                   <i class="fas fa-check-circle"></i> Accept
                               </button>
                               <button class="Rejected" onclick="handleUpdate(${std.id})">
                                   <i class="fas fa-times-circle"></i> Reject
                               </button>
                           </c:otherwise>
                       </c:choose>
                    </td>
                </tr>
            </c:forEach>
        </c:otherwise>
    </c:choose>
    </tbody>
</table>

  <div class="pagination">
    <button onclick="prevPage()">
      <i class="fas fa-arrow-left"></i> Previous
    </button>
    <button onclick="nextPage()">
      Next <i class="fas fa-arrow-right"></i>
    </button>
  </div>
</div>

    <script>
        // Search function
        function searchTable() {
            const input = document.getElementById("searchInput").value.toLowerCase();
            const rows = document.querySelectorAll("#eventTable tbody tr");
            let matchedRows = 0;

            rows.forEach(row => {
                const eventName = row.cells[1].textContent.toLowerCase();
                if (eventName.includes(input)) {
                    row.style.display = "";
                    matchedRows++;
                } else {
                    row.style.display = "none";
                }
            });

            if (input === "") {
                showPage(currentPage);
            } else {
                rows.forEach(row => row.style.display = row.style.display === "none" ? "none" : "");
                updatePaginationButtons(matchedRows);
            }
        }

        let currentPage = 1;
        const rowsPerPage = 6;

        function showPage(page) {
            const rows = document.querySelectorAll("#eventTable tbody tr");
            const start = (page - 1) * rowsPerPage;
            const end = start + rowsPerPage;

            rows.forEach((row, index) => {
                row.style.display = index >= start && index < end ? "" : "none";
            });

            updatePaginationButtons(rows.length);
        }

        function prevPage() {
            if (currentPage > 1) {
                currentPage--;
                showPage(currentPage);
            }
        }

        function nextPage() {
            const rows = document.querySelectorAll("#eventTable tbody tr");
            if ((currentPage * rowsPerPage) < rows.length) {
                currentPage++;
                showPage(currentPage);
            }
        }

        function updatePaginationButtons(totalRows) {
            const rows = document.querySelectorAll("#eventTable tbody tr");
            const maxPage = Math.ceil(totalRows / rowsPerPage);
            document.querySelector(".pagination button:nth-of-type(1)").disabled = currentPage === 1;
            document.querySelector(".pagination button:nth-of-type(2)").disabled = currentPage === maxPage;
        }

        showPage(currentPage);

        function deleteRow(button) {
            const row = button.closest('tr');
            row.remove();
            showPage(currentPage);
        }
        
        
        function handleUpdate(btn) {
            var isConfirmed = confirm("Are you sure you want to reject this member?");
            if (isConfirmed) {
                window.location.replace("/updateRejected?id=" + btn);
            } else {
                alert("Event update has been canceled.");
            }
        }

        function handleInvitee(btn) {
            var isConfirmed = confirm("Are you sure you want to accept this member?");
            if (isConfirmed) {
                window.location.replace("/updateAcceptData?id=" + btn);
            }
        }

        function Present(btn) {
            var isConfirmed = confirm("Are you sure you want to mark this member as present?");
            if (isConfirmed) {
                window.location.replace("/updatePresent?id=" + btn);
            } 
        }

        function Qrcode(btn) {
            var isConfirmed = confirm("Are you sure you want to view the QR code?");
            if (isConfirmed) {
                window.location.replace("/Qr?id=" + btn);
            } 
        }
        </script>
        <%@ include file="AdminFooter.jsp" %>  
</body>
</html>