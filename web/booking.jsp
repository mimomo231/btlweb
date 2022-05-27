<%-- 
    Document   : booking
    Created on : May 27, 2022, 8:07:08 PM
    Author     : Sao Viet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
         <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <title>N4-Hotel.com</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.html">

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/fontAwesome.css">
        <link rel="stylesheet" href="css/hero-slider.css">
        <link rel="stylesheet" href="css/owl-carousel.css">
        <link rel="stylesheet" href="css/tooplate-style.css">

        <link href="https://fonts.googleapis.com/css?family=Spectral:200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">

        <script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    </head>
    <body>
        <section class="page-heading" id="top">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="logo">
                        <img src="img/favicon.png" alt="Flight Template">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="page-direction-button">
                        <a href="welcome"><i class="fa fa-home"></i>Go Back Home</a>
                    </div>
                </div>
            </div>
        </div>
        </section>
        <h1 style="text-align: center">Xin chào ${sessionScope.auth.name}!</h1>
        <h4>Chúc mừng bạn booking phòng thành công</h4>
        <br/><br/><br/><br/><br/><br/>
        <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="primary-button">
                        <a href="#" class="scroll-top">Quay đầu là bờ</a>
                    </div>
                </div>
                <div class="col-md-12">
                    <ul class="social-icons">
                        <li><a href="https://www.facebook.com/momonodono" target="_blank"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="https://www.facebook.com/momonodono" target="_blank"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="https://www.facebook.com/momonodono" target="_blank"><i class="fa fa-linkedin"></i></a></li>
                        <li><a href="https://www.facebook.com/momonodono" target="_blank"><i class="fa fa-rss"></i></a></li>
                        <li><a href="https://www.facebook.com/momonodono" target="_blank"><i class="fa fa-behance"></i></a></li>
                    </ul>
                </div>
                <div class="col-md-12">
                    <p>Copyright &copy; Hotel 2022 pro 13 max</p>
                    <a href="#">Login</a> &nbsp; <a href="#">Register</a>
                </div>
            </div>
        </div>
        </footer>
    </body>
</html>
