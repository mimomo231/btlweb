<%-- 
    Document   : adminHotelView
    Created on : May 25, 2022, 9:12:54 PM
    Author     : Computer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

        <title>Booked Room</title>
    </head>
    <body>
        <h1>Show Booked Room</h1>

        <table border='1px'>
            <tr>
                <th>ID</th>
                <th>Check In</th>
                <th>Check out</th> 
                <th>Price</th>
                <th>Room ID</th>
                <th>Room Name</th>
            </tr>
            <c:forEach items="${requestScope.data}" var="i">
                <tr>
                    <td>${i.id}</td>
                    <td>${i.checkin}</td>
                    <td>${i.checkout}</td>
                    <td>${i.price}</td>
                    <td>${i.room.id}</td>
                    <td>${i.room.name}</td>
                </tr>
            </c:forEach>
        </table><br/>

        <input type="button" onclick="location.href = 'bookingmanager';" value="Oke" />
        
        <input type="button" onclick="location.href = 'checkbill?id=${requestScope.bkid}';" value="Check Bill" />

    </body>
</html>