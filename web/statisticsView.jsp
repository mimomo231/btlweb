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
        <style>
            body {
                font - family: Arial, Helvetica, sans - serif;
                font - size: 11pt;
                margin - left: 2em;
                margin - right: 2em;
            }
            label {
                float: left;
                width: 6em;
                margin - bottom: 0.5em;
            }
            input[type = "text"], input[type = "email"] {
                width: 15em;
                margin - left: 0.5em;
                margin - bottom: 0.5em;
            }
            br {
                clear: both;
            }
            #submit {
                margin - left: 0.5em; }
            </style>
            <title>Statistics</title>
        </head>
        <body>
            <h1>Statistics</h1>
            <form action="showstatistics">
                <div class="form-group">
                <label>Payment Date: </label>
                <input type="date" name="date1">&nbsp;&nbsp;to&nbsp;
                <input type="date" name="date2">
                <input type="submit" value="Search" class="margin_left">
            </div><br/>
        </form>

        <hr/>
        <table border='1px'>
            <tr>
                <th>ID</th>
                <th>Payment Date</th>
                <th>Payment Method</th> 
                <th>Amount</th>
                <th>Note</th>
                <th>User ID</th>
                <th>User Name</th>
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
                </tr>
            </c:forEach>
        </table><br/>
        <hr/>
        
        <div>
            <label>Total amount:</label>${requestScope.total_amount} VNĐ
        </div><br/>
        <input type="button" onclick="location.href = 'adminView.jsp';" value="Oke" />

    </body>
</html>