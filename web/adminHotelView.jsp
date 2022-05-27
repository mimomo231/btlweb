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
                if (confirm("Are you sure to delete hotel with id = " + id + "?")) {
                    window.location = "deletehotel?id=" + id;
                }
            }
        </script>
        <title>Hotel Manager</title>
    </head>
    <body>
        <h1>Hotels</h1>

        <table border='1px'>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Address</th> 
                <th>Star</th>
                <th>Description</th>
                <th>Image</th>
                <th>    </th>
                <th>    </th>
            </tr>
            <c:forEach items="${requestScope.data}" var="i">
                <tr>
                    <td>${i.id}</td>
                    <td>${i.name}</td>
                    <td>${i.address}</td>
                    <td>${i.star}</td>
                    <td>${i.des}</td>
                    <td>${i.image}</td>
                    <td>
                        &nbsp;<a href="edithotel?id=${i.id}">Edit</a>&nbsp;
                    </td>
                    <td>
                        &nbsp;<a href="#" onclick="doDelete('${i.id}')">Delete</a>&nbsp;
                    </td>
                </tr>
            </c:forEach>
        </table><br/>

        <input type="button" onclick="location.href = 'addHotel.jsp';" value="Add Hotel" />&emsp;&emsp;&emsp;&emsp;

        <input type="button" onclick="location.href = 'adminView.jsp';" value="Back" />

    </body>
</html>
