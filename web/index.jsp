<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    User auth = (User) request.getSession().getAttribute("auth");
    String greeting = "";
    if (auth != null) {
        greeting = "Welcome Back, "+auth.getName();
    }
    else {
        greeting = "Hello, What do you need?";
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <link rel="stylesheet" href="css/datepicker.css">
        <link rel="stylesheet" href="css/tooplate-style.css">
        <link rel="Shortcut Icon" href="img/logo-i.png"  type="img/x-icon" /> 

        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">

        <script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    </head>

    <body>
        <section class="banner" id="top">
            <div class="container">
                <div class="row">
                    <div class="col-md-5">
                        <div class="left-side">
                            <div class="logo">
                                <img src="img/logo.png" alt="Hotel N4">
                            </div>
                            <div class="tabs-content">
                                <h4><%=greeting%></h4>
                                <ul class="social-links">
                                    <%
                                        if (auth != null) {
                                    %>
                                    <li><a href="logout">Logout</a></li>
                                    <li><a href="#">Booking Information</a></li>
                                            <%
                                            } else {
                                            %>
                                    <li><a href="loginView.jsp">Login</a></li>
                                    <li><a href="registerView.jsp">Register</a></li>
                                    
                                            <%
                                                }
                                            %>

                                </ul>
                                <br/><br/><br/>
                            </div>
                            <div class="page-direction-button">
                                <a href="contact.html"><i class="fa fa-phone"></i>Contact Us Now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5 col-md-offset-1">
                        <section id="first-tab-group" class="tabgroup">
                            <div id="tab1">
                                <div class="submit-form">
                                    <h4>Tìm:</h4>
                                    <form id="form-submit" action="search" method="get">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <fieldset>
                                                    <label for="addr">Bạn muốn đến đâu?</label>
                                                    <input name="address" type="text" class="form-control input" placeholder="Nhập nơi muốn đến..." required="" onchange='this.form.()'>
                                                </fieldset>
                                            </div>
                                            </br>
                                            </br>
                                            </br>
                                            </br>
                                            </br>
                                            <div class="col-md-6">
                                                <fieldset>
                                                    <label for="c">Ngày nhận phòng:</label>
                                                    <input name="checkin" type="text" class="form-control date" placeholder="Chọn ngày..." required="" onchange='this.form.()'>
                                                </fieldset>
                                            </div>
                                            <div class="col-md-6">
                                                <fieldset>
                                                    <label for="ch">Ngày trả phòng:</label>
                                                    <input name="checkout" type="text" class="form-control date" placeholder="Chọn ngày..." required="" onchange='this.form.()'>
                                                </fieldset>
                                            </div>
                                            
                                            <div class="col-md-6">
                                                <fieldset>
                                                    <button type="submit" id="form-submit" class="btn">Tìm kiếm</button>
                                                </fieldset>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </section>

        <section class="services">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="service-item first-service">
                            <div class="service-icon"></div>
                            <h4>Easy Booking</h4>
                            <p>Dễ dàng booking hotel với những thao tác đơn giản. Chỉ việc xách va-lô lên và đi</p>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="service-item second-service">
                            <div class="service-icon"></div>
                            <h4>Best Hotel</h4>
                            <p>Hệ thống khách sạn pro pro toàn là trai xinh gái đẹp các thứ. Dịch vụ cũng pro pro các kiểu</p>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="service-item third-service">
                            <div class="service-icon"></div>
                            <h4>Save Money</h4>
                            <p>Tiết kiệm thời gian và tiền bạc. </p> </br>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>



        <div class="tabs-content" id="recommended-hotel">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-heading">
                            <h2>Đề xuất khách sạn cho bạn</h2>
                        </div>
                    </div>
                    <div class="wrapper">
                        <div class="col-md-4">
                            <ul class="tabs clearfix" data-tabgroup="third-tab-group">
                                <li><a href="#livingroom" class="active">Quang cảnh<i class="fa fa-angle-right"></i></a></li>
                                <li><a href="#suitroom">Phòng VIP <i class="fa fa-angle-right"></i></a></li>
                                <li><a href="#swimingpool">Hồ bơi <i class="fa fa-angle-right"></i></a></li>
                                <li><a href="#massage">Dịch vụ massage<i class="fa fa-angle-right"></i></a></li>
                                <li><a href="#fitness">Đời sống thể thao<i class="fa fa-angle-right"></i></a></li>
                                <li><a href="#event">Sự kiện về đêm<i class="fa fa-angle-right"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <section id="third-tab-group" class="recommendedgroup">
                            <div id="livingroom">
                                <div class="text-content">
                                    <iframe width="100%" height="400" src="https://www.youtube.com/embed/Au6LqK1UH8g" title="YouTube video player" frameborder="0" allow="accelerometer; 
                                            autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                                </div>
                            </div>
                            <div id="suitroom">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div id="owl-suiteroom" class="owl-carousel owl-theme">
                                            <div class="item">
                                                <div class="suiteroom-item">
                                                    <img src="img/suite-02.jpg" alt="">
                                                    <div class="text-content">
                                                        <h4>Phòng sạch sẽ và thư giãn</h4>
                                                        <span>Khách sạn Hoa cúc</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="suiteroom-item">
                                                    <img src="img/suite-01.jpg" alt="">
                                                    <div class="text-content">
                                                        <h4>Phòng ngủ thượng hạng</h4>
                                                        <span>Khách sạn Hoa Ly</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="suiteroom-item">
                                                    <img src="img/suite-03.jpg" alt="">
                                                    <div class="text-content">
                                                        <h4>Quang cảnh tuyệt đẹp</h4>
                                                        <span>Khách sạn hoa hồng</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="swimingpool">
                                <img src="img/swiming-pool.jpg" alt="">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="text-content">
                                            <h4>Khung cảnh bể bơi tuyệt vời</h4>
                                            <span>Khách sạn Hoa Đào</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="massage">
                                <img src="img/massage-service.jpg" alt="">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="text-content">
                                            <h4>Nơi tuyệt vời để thư giãn</h4>
                                            <span>Khách sạn Biển Đông</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="fitness">
                                <img src="img/fitness-service.jpg" alt="">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="text-content">
                                            <h4>Đời sống lành mạnh</h4>
                                            <span>Khách sạn Biển Tây</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="event">
                                <img src="img/evening-event.jpg" alt="">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="text-content">
                                            <h4>Những loại rượu hảo hạng</h4>
                                            <span>Khách sạn Biển Nam</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    




    <section id="most-visited">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-heading">
                        <h2>Những Khách sạn được ghé thăm nhiều nhất</h2>
                    </div>
                </div>
                <div class="col-md-12">
                    <div id="owl-mostvisited" class="owl-carousel owl-theme">
                        <c:forEach items="${requestScope.hotels}" var="i">
                            <div class="item col-md-12">
                            <div class="visited-item">
                                <a href="inforhotel?hid=${i.id}"><img src="img/${i.image}" alt="Khách sạn ${i.name}"></a>
                                <div class="text-content">
                                    <h4>Khách sạn ${i.star} sao pro pro</h4>
                                    <span>${i.name}</span>
                                </div>
                            </div>
                            </div>
                        </c:forEach>
                        
                    </div>
                </div>
            </div>
        </div>
    </section>



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





    <script src="../../../ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>

    <script src="js/vendor/bootstrap.min.js"></script>

    <script src="js/datepicker.js"></script>
    <script src="js/plugins.js"></script>
    <script src="js/main.js"></script>

    <script src="../../../ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function() {
        // navigation click actions 
        $('.scroll-link').on('click', function(event){
        event.preventDefault();
        var sectionID = $(this).attr("data-id");
        scrollToID('#' + sectionID, 750);
        });
        // scroll to top action
        $('.scroll-top').on('click', function(event) {
        event.preventDefault();
        $('html, body').animate({scrollTop:0}, 'slow');
        });
        // mobile nav toggle
        $('#nav-toggle').on('click', function (event) {
        event.preventDefault();
        $('#main-nav').toggleClass("open");
        });
        });
        // scroll function
        function scrollToID(id, speed){
        var offSet = 0;
        var targetOffset = $(id).offset().top - offSet;
        var mainNav = $('#main-nav');
        $('html,body').animate({scrollTop:targetOffset}, speed);
        if (mainNav.hasClass("open")) {
        mainNav.css("height", "1px").removeClass("in").addClass("collapse");
        mainNav.removeClass("open");
        }
        }
        if (typeof console === "undefined") {
        console = {
        log: function() { }
        };
        }
    </script>
</body>

<!-- Mirrored from www.tooplate.com/templates/2093_flight/ by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 28 May 2018 10:39:55 GMT -->
</html>