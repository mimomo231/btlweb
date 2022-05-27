<%-- 
    Document   : adminView
    Created on : May 25, 2022, 4:51:59 PM
    Author     : Computer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <title>Administrator</title>
    </head>
    <body>
        <div class="container">
            <div class="card w-50 mx-auto my-5">
                <div class="card-header text-center">Admin's Home</div>
                <div class="card-body">
                    <form action="hotelmanager" method="post">
                        <div class="text-center card">
                            <button type="submit" class="btn btn-primary">Hotel Manager</button>
                        </div>
                    </form><br/>
                    
                    <form action="roommanager" method="post">
                        <div class="text-center card">
                            <button type="submit" class="btn btn-primary">Room Manager</button>
                        </div>
                    </form><br/>
                    
                    <form action="bookingmanager" method="post">
                        <div class="text-center card">
                            <button type="submit" class="btn btn-primary">Booking Manager</button>
                        </div>
                    </form><br/>
                    
                    <form action="showstatistics" method="post">
                        <div class="text-center card">
                            <button type="submit" class="btn btn-primary">Statistics</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>
</html>
