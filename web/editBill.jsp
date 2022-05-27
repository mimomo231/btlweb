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
        <title>Accept Bill</title>
    </head>
    <body>
        <h1>Accept Bill</h1>
        <form action="editbill" method="post">
            <div class="form-group">
                <label>ID:</label>
                <input type="text" name="edit-id" readonly value="${bid}"><br>
            </div><br/>

            <div class="form-group">
                <label>Payment Date:</label>
                <input type="date" name="edit-pd">
            </div><br/>

            <div class="form-group">
                <label>Payment Method:</label>
                <input type="text" name="edit-pm">
            </div><br/>

            <label>&nbsp;</label>
            <input type="submit" value="Accept" class="margin_left">&emsp;&emsp;&emsp;&emsp;
            <input type="button" onclick="location.href = 'bookingmanager';" value="Cancel" />
        </form>
    </body>
</html>
