<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Rooms</title>
    <link rel="stylesheet" href="css/style.css"/>
</head>
<body>
    <h2>Available Rooms</h2>
    <table border="1">
        <tr>
            <th>Room ID</th><th>Number</th><th>Type</th><th>Capacity</th><th>Beds Remaining</th><th>Price</th><th>Hostel</th>
        </tr>
        <c:forEach var="room" items="${rooms}">
            <tr>
                <td>${room.roomId}</td>
                <td>${room.roomNumber}</td>
                <td>${room.roomType}</td>
                <td>${room.capacity}</td>
                <td>${room.capacity - room.occupiedBeds}</td>
                <td>${room.price}</td>
                <td>${room.hostelName}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
