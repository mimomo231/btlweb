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
        
        <title>Bill</title>
    </head>
    <body>
        <h1>Show Bill</h1>

        <table border='1px'>
            <tr>
                <th>ID</th>
                <th>Payment Date</th>
                <th>Payment Method</th> 
                <th>Amount</th>
                <th>Note</th>
                <th>User ID</th>
                <th>User Name</th>
                <th>Action</th>
            </tr>
            <c:forEach items="${requestScope.data}" var="i">
                <tr>
                    <td>${i.id}</td>
                    <td>${i.paymentDate}</td>
                    <td>${i.paymentMethod}</td>
                    <td>${i.amount}</td>
                    <td>${i.note}</td>
                    <td>${i.booking.creator.id}</td>
                    <td>${i.booking.creator.name}</td>
                    <td><c:if test="${i.note == 'Waiting'}"><a href="editbill?id=${i.id}">Accept</a></c:if></td>
                </tr>
            </c:forEach>
        </table><br/>

        <input type="button" onclick="location.href = 'bookingmanager';" value="Oke" />

    </body>
</html>