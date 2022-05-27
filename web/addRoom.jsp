<%-- 
    Document   : editHotel
    Created on : May 25, 2022, 11:20:18 PM
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
            <title>Add Room</title>
        </head>
        <body>
            <h1>Add new room</h1>
            <form action="addroom" method="post">
                <div class="form-group">
                <label>Name:</label>
                <input type="text" name="add-name"><br>
            </div><br/>

            <div class="form-group">
                <label>Type:</label>
                <input type="text" name="add-type"><br>
            </div><br/>

            <div class="form-group">
                <label>Price:</label>
                <input type="text" name="add-price"><br>
            </div><br/>

            <div class="form-group">
                <label>Description:</label>
                <input type="text" name="add-des"><br>
            </div><br/>
            
            <div class="form-group">
                <label>Image:</label>
                <input type="text" name="add-image"><br>
            </div><br/>

            <div class="form-group">
                <label>Hotel:</label>
                <select name="hotel-id">
                    <c:forEach items="${requestScope.hdata}" var="i">
                        <option value="${i.id}">${i.name}</option>
                    </c:forEach>
                </select>
            </div><br/>

            <label>&nbsp;</label>
            <input type="submit" value="Add room" class="margin_left">&emsp;&emsp;&emsp;&emsp;
            <input type="button" onclick="location.href = 'roommanager';" value="Back" />
        </form>
    </body>
</html>
