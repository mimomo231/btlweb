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
        <title>Add Hotel</title>
    </head>
    <body>
        <h1>Add new hotel</h1>
        <form action="addhotel" method="post">
            <div class="form-group">
                <label>Name:</label>
                <input type="text" name="add-name"><br>
            </div><br/>
            
            <div class="form-group">
                <label>Address:</label>
                <input type="text" name="add-address"><br>
            </div><br/>

            <div class="form-group">
                <label>Star:</label>
                <input type="text" name="add-star"><br>
            </div><br/>
            
            <div class="form-group">
                <label>Description:</label>
                <input type="text" name="add-des"><br>
            </div><br/>
            
            <div class="form-group">
                <label>Image:</label>
                <input type="text" name="add-image"><br>
            </div><br/>
            
            <label>&nbsp;</label>
            <input type="submit" value="Add hotel" class="margin_left">&emsp;&emsp;&emsp;&emsp;
            <input type="button" onclick="location.href = 'hotelmanager';" value="Back" />
        </form>
    </body>
</html>
