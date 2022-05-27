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
        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("Are you sure to delete room with id = " + id + "?")) {
                    window.location = "deleteroom?id=" + id;
                }
            }
        </script>
        <title>Room Manager</title>
    </head>
    <body>
        <h1>Rooms</h1>
        <c:set var="htid" value="${requestScope.htid}"/>
        <form id="f" action="roommanager">
            Hotel: 
            <select name="hotel-id" onchange="document.getElementById('f').submit()">
                <option value="0">Choose a hotel</option>
                <c:forEach items="${requestScope.hdata}" var="i">
                    <option <c:if test="${i.id==htid}">selected</c:if> value="${i.id}">${i.name}</option>
                </c:forEach>
            </select>
        </form>
        <hr/>
        <table border='1px'>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Type</th> 
                <th>Price</th>
                <th>Description</th>
                <th>Image</th>
                <th>Hotel ID</th>
                <th>Hotel name</th>
                <th>    </th>
                <th>    </th>
            </tr>
            <c:forEach items="${requestScope.rdata}" var="i">
                <tr>
                    <td>${i.id}</td>
                    <td>${i.name}</td>
                    <td>${i.type}</td>
                    <td>${i.price}</td>
                    <td>${i.des}</td>
                    <td>${i.image}</td>
                    <td>${i.hotel.id}</td>
                    <td>${i.hotel.name}</td>
                    <td>
                        &nbsp;<a href="editroom?id=${i.id}">Edit</a>&nbsp;
                    </td>
                    <td>
                        &nbsp;<a href="#" onclick="doDelete('${i.id}')">Delete</a>&nbsp;
                    </td>
                </tr>
            </c:forEach>
        </table><br/>

        <input type="button" onclick="location.href = 'addroom';" value="Add Room" />&emsp;&emsp;&emsp;&emsp;

        <input type="button" onclick="location.href = 'adminView.jsp';" value="Back" />

    </body>
</html>
