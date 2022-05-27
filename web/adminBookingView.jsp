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

        <title>Booking Manager</title>
    </head>
    <body>
        <h1>Booking Room</h1>
        
        <form action="bookingmanager">
            <label>Search by email:</label>
            <input type="text" name="search">
            <input type="submit" value="Search" class="margin_left">
        </form>
        <hr/>

        <table border='1px'>
            <tr>
                <th>ID</th>
                <th>Booking Date</th>
                <th>Note</th> 
                <th>User ID</th>
                <th>User Name</th>
                <th>User Email</th>
                <th>    </th>
                <th>    </th>
            </tr>
            <c:forEach items="${requestScope.data}" var="i">
                <tr>
                    <td>${i.id}</td>
                    <td>${i.bookingDate}</td>
                    <td>${i.note}</td>
                    <td>${i.creator.id}</td>
                    <td>${i.creator.name}</td>
                    <td>${i.creator.email}</td>

                    <td>
                        &nbsp;<a href="checkbookedroom?id=${i.id}">Check Booked Room</a>&nbsp;
                    </td>
                    <td>
                        &nbsp;<a href="checkbill?id=${i.id}">Check Bill</a>&nbsp;
                    </td>
                </tr>
            </c:forEach>
        </table><br/>

        <input type="button" onclick="location.href = 'adminView.jsp';" value="Back" />

    </body>
</html>