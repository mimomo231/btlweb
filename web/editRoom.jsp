<%-- 
    Document   : editHotel
    Created on : May 26, 2022, 1:06:10 AM
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
            <title>Edit Room</title>
        </head>
        <body>
            <h1>Edit room</h1>
            <form action="editroom" method="post">
                <div class="form-group">
                <label>ID:</label>
                <input type="text" name="edit-id" readonly value="${data.id}"><br>
            </div><br/>

            <div class="form-group">
                <label>Name:</label>
                <input type="text" name="edit-name" value="${data.name}">
            </div><br/>

            <div class="form-group">
                <label>Type:</label>
                <input type="text" name="edit-type" value="${data.type}">
            </div><br/>

            <div class="form-group">
                <label>Price:</label>
                <input type="text" name="edit-price" value="${data.price}">
            </div><br/>

            <div class="form-group">
                <label>Description:</label>
                <input type="text" name="edit-des" value="${data.des}">
            </div><br/>
            
            <div class="form-group">
                <label>Image:</label>
                <input type="text" name="edit-image" value="${data.image}">
            </div><br/>

            <c:set var="htid" value="${requestScope.htid}"/>
            <div class="form-group">
                <label>Hotel:</label>
                <select name="hotel-id">
                    <c:forEach items="${requestScope.hdata}" var="i">
                        <option <c:if test="${i.id==htid}">selected</c:if> value="${i.id}">${i.name}</option>
                    </c:forEach>
                </select>
            </div><br/>

            <label>&nbsp;</label>
            <input type="submit" value="Update hotel" class="margin_left">&emsp;&emsp;&emsp;&emsp;
            <input type="button" onclick="location.href = 'roommanager';" value="Back" />
        </form>
    </body>
</html>
