<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <!--
        
        Template 2093 Flight
        
        http://www.tooplate.com/view/2093-flight
        
        -->
        <title>Reset Password</title>
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
                            <img src="img/logo.png" alt="Flight Template">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="page-direction-button">
                            <a href="index.jsp"><i class="fa fa-home"></i>Go Back Home</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>



        <section class="contact-us">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-heading">
                            <h2>Reset your password</h2><br/>
                        </div>
                    </div>
                    <div class="col-md-6 col-md-offset-3">
                        <form action="resetpass" method="post">
                            <div class="row">                               
                                <div class="col-md-12">
                                    <fieldset>
                                        <input name="reset-email" type="email" class="form-control" placeholder="Your email..." required="">
                                    </fieldset>
                                </div>

                                <div class="col-md-12">
                                    <fieldset>
                                        <input name="reset-password" type="password" class="form-control" placeholder="Your new password..." required="">
                                    </fieldset>
                                    <span style="color: red">${requestScope.error}</span>
                                </div>
                                
                                <div class="col-md-12">
                                    <fieldset>
                                        <div class="col-md-24 text-center"><button type="submit" id="form-submit" class="mx-auto btn">Reset Password</button></div>
                                    </fieldset>
                                </div>
                            </div>
                        </form>
                        <p> <br/></p>
                    </div>
                </div>
            </div>
        </section>

        <footer>
            <div class="container">
                <div class="row">

                    <div class="col-md-12">
                        <ul class="social-icons">
                            <li><a href="https://www.facebook.com/tooplate"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                            <li><a href="#"><i class="fa fa-rss"></i></a></li>
                            <li><a href="#"><i class="fa fa-behance"></i></a></li>
                        </ul>
                    </div>
                    <div class="col-md-12">
                        <p>Copyright &copy; 2018 Flight Tour and Travel Company</p>
                    </div>
                </div>
            </div>
        </footer>





        <script src="../../../ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>

        <script src="js/vendor/bootstrap.min.js"></script>

        <script src="js/plugins.js"></script>
        <script src="js/main.js"></script>

        <script src="../../../ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                // navigation click actions 
                $('.scroll-link').on('click', function (event) {
                    event.preventDefault();
                    var sectionID = $(this).attr("data-id");
                    scrollToID('#' + sectionID, 750);
                });
                // scroll to top action
                $('.scroll-top').on('click', function (event) {
                    event.preventDefault();
                    $('html, body').animate({scrollTop: 0}, 'slow');
                });
                // mobile nav toggle
                $('#nav-toggle').on('click', function (event) {
                    event.preventDefault();
                    $('#main-nav').toggleClass("open");
                });
            });
            // scroll function
            function scrollToID(id, speed) {
                var offSet = 0;
                var targetOffset = $(id).offset().top - offSet;
                var mainNav = $('#main-nav');
                $('html,body').animate({scrollTop: targetOffset}, speed);
                if (mainNav.hasClass("open")) {
                    mainNav.css("height", "1px").removeClass("in").addClass("collapse");
                    mainNav.removeClass("open");
                }
            }
            if (typeof console === "undefined") {
                console = {
                    log: function () { }
                };
            }
        </script>
    </body>

    <!-- Mirrored from www.tooplate.com/templates/2093_flight/contact.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 28 May 2018 11:20:28 GMT -->
</html>