<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.container {
    width: 80%;
    border-radius: 20px;
    margin: 90px auto; 
    padding: 20px;
    background-color: #f4f4f4;
}

.header-search {
    text-align: left;
    margin-bottom: 20px;
    gap:60px;
    display: flex; 
}

h1 {
    font-size: 1.9em;
    font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
    margin: 0;
    color: #333;
}

.search-container {
    margin-top: 10px;
}

#search {
    width: 100%;
    padding: 10px;
    font-size: 1em;
    border: 2px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    outline: none;
}

#search:focus {
    border-color: #007bff;
    box-shadow: 0 2px 4px rgba(0, 123, 255, 0.2);
}

.card-container {
    display: grid;
    grid-template-columns: repeat(4, 1fr); 
    gap: 20px;
    padding: 0;
    list-style-type: none;
}

.card {
    background-color: #fff;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s, box-shadow 0.3s;
    position: relative; 
    display: flex;
    flex-direction: column; 
}

.card img {
    width: 100%;
    height: auto;
    display: block;
}

.card-content {
    flex: 1; 
    padding: 20px;
    display: flex;
    flex-direction: column;
}

.card-title {
    font-size: 1.3em;
    margin: 0 0 10px;
    color: #333;
}

.card-description {
    font-size: 1em;
    color: #555;
    margin: 0;
}

.card-date, .card-location {
    font-size: 0.9em;
    color: #777;
    margin: 5px 0;
}

.card:hover {
    transform: translateY(-5px);
    box-shadow: 0 12px 24px rgba(0, 0, 0, 0.2);
}

.request-form {
    margin-top: auto; 
}

.request-button {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 10px 20px;
    cursor: pointer;
    border-radius: 5px;
    font-size: 16px;
    width: 100%; 
    text-align: center;
}

.request-button:hover {
    background-color: #0056b3;
}


@media (max-width: 1000px) {
    .card-container {
        grid-template-columns: repeat(3, 1fr);
    }
}

@media (max-width: 900px) {
    .card-container {
        grid-template-columns: repeat(2, 1fr); 
    }
}

@media (max-width: 600px) {
    .card-container {
        grid-template-columns: 1fr; 
    }
}

.pagination {
    display: flex;
    justify-content: center;
    margin-top: 20px;
}

.pagination button {
    padding: 10px 20px;
    margin: 0 5px;
    border: none;
    background-color: #007bff;
    color: white;
    border-radius: 5px;
    cursor: pointer;
}

.pagination button:disabled {
    background-color: #ddd;
    cursor: not-allowed;
}

.pagination button:hover:not(:disabled) {
    background-color: #0056b3;
}

</style>
 <script>
        window.onload = function() {
            // Check if the message parameter exists
            var message = "${param.message}";
            if (message) {
                alert(message);
                location.replace("/BookEvent");
                }
        };
    </script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <%@ include file="UserHeader.jsp" %>
 <div class="container">
    <header class="header-search">
        <h1>Upcoming Events</h1>
        <div class="search-container">
            <input type="text" id="search" placeholder="Search events...">
        </div>
    </header>

<div class="card-container">
    <c:forEach var="std" items="${event}">
    <div class="card">
        <img src="./image/${std.eventImg}" alt="Event Image">
        <div class="card-content">
            <h2 class="card-title">${std.eventName}</h2>
            <p class="card-description">${std.description}</p>
            <p class="card-date">Date: ${std.startDate}</p>
            <p class="card-location">Location: ${std.location}</p>
            <form action="/requestJoinEvent" method="post" class="request-form">
                <input type="hidden" name="eventId" value="${std.id}" />
                <input type="hidden" name="email" value="${std.email}" /> 
                <input type="hidden" name="userId" value="<%=session.getAttribute("userId") %>" /> 
                <button type="submit" class="request-button">Send Request</button>
            </form>
        </div>
    </div>
    </c:forEach>
</div>



<div class="pagination">
    <button id="prevBtn" disabled><i class="fas fa-chevron-left"></i> Previous</button>
    <button id="nextBtn">Next <i class="fas fa-chevron-right"></i></button>
</div>

</div>
<script>
document.addEventListener('DOMContentLoaded', () => {
    const searchInput = document.getElementById('search');
    const cards = Array.from(document.querySelectorAll('.card'));
    const prevBtn = document.getElementById('prevBtn');
    const nextBtn = document.getElementById('nextBtn');

    let currentPage = 1;
    const cardsPerPage = 4;

    function showPage(page) {
        const filteredCards = cards.filter(card => {
            const title = card.querySelector('.card-title').textContent.toLowerCase();
            const description = card.querySelector('.card-description').textContent.toLowerCase();
            const query = searchInput.value.toLowerCase();
            return title.includes(query) || description.includes(query);
        });

        const start = (page - 1) * cardsPerPage;
        const end = start + cardsPerPage;

        cards.forEach((card, index) => {
            card.style.display = (index >= start && index < end && filteredCards.includes(card)) ? '' : 'none';
        });

        prevBtn.disabled = page === 1;
        nextBtn.disabled = end >= filteredCards.length;
    }


    showPage(currentPage);

  
    prevBtn.addEventListener('click', () => {
        if (currentPage > 1) {
            currentPage--;
            showPage(currentPage);
        }
    });

    nextBtn.addEventListener('click', () => {
        if (currentPage * cardsPerPage < cards.filter(card => {
            const title = card.querySelector('.card-title').textContent.toLowerCase();
            const description = card.querySelector('.card-description').textContent.toLowerCase();
            const query = searchInput.value.toLowerCase();
            return title.includes(query) || description.includes(query);
        }).length) {
            currentPage++;
            showPage(currentPage);
        }
    });

    searchInput.addEventListener('input', () => {
        currentPage = 1; 
        showPage(currentPage);
    });

    document.querySelectorAll('.delete-button').forEach(button => {
        button.addEventListener('click', (e) => {
            e.target.closest('.card').remove();
            showPage(currentPage); 
        });
    });
});

</script>
  <%@ include file="UserFooter.jsp" %>

</body>
</html>