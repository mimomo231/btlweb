<%-- 
    Document   : hotel
    Created on : May 27, 2022, 3:31:36 PM
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
        <br/>
        <h4 style="text-align: center">Chúng tôi rất chuyên nghiệp</h4>
        <table style="width:100%; border: 10px solid white;">
            <tr>
                
                <td style=" width:30%;background-color: #CCFFFF;border-radius: 10px;border-color: #CCFFFF">
                    <section style="text-align: left">
                    <h3>${requestScope.hotel.name}</h3>
                    <h4>Địa chỉ: ${requestScope.hotel.address}</h4>
                    <h4>${requestScope.hotel.des}</h4></section>
                </td>
                <td style="width:60%;background-color: #009999;text-align: center;border-radius: 10px;border-color: #CCFFFF">
                    <sectoin style="text-align: center;"><a" href="#" ><img src="img/bg.jpg" alt="Khách sạn ${requestScope.hotel.name}" width="100%" height="500"></a></sectoin>
                </td>
                 <td style="width:10%;background-color: #009999;text-align: center;border-radius: 10px;border-color: #CCFFFF">
                                    <a href="#"><button>+12 ảnh</button></a></td>
            </tr>
          </table>
        
        <pre>        Bạn đủ điều kiện nhận giảm giá Genius tại ${requestScope.hotel.name}! 
        Để tiết kiệm tại chỗ nghỉ này, bạn chỉ cần đăng nhập.Chỗ nghỉ này cách bãi biển 1 phút đi bộ.
        Located just 50 metres from An Bang Beach, KA Villa Hoi An offers accommodation in Cam An Ward in Hoi An.
        It features free WiFi access, a tour desk and concierge services. Staff on site can arrange airport transfers.
        All non-smoking, air-conditioned rooms include a 32-inch flat-screen TV with cable channels, black-out curtains and a desk.
        An electric kettle, a minibar and personal safe are available. En suite bathroom comes with either a bathtub or shower, bathrobes and slippers. 
        Ironing facilities can be requested.</pre>
        <br/>
        <hr/>
        <br/>
        <h3 style="text-align: center"><b>Phòng trống</b></h3>
        <h4 style="text-align: center">Từ ngày: ${sessionScope.cii}</h4>
        <h4 style="text-align: center">Đến ngày: ${sessionScope.coo}</h4> <br/>
        <div style="text-align: center"><h4>Chỉ cần đăng nhập</h4>
            <h4><b>Bạn có thể Đặt phòng không cần thanh toán trước</b></h4></div>
       
        <br/><br/>
        <section style="text-align: center">
            <table style="width:80%; border: 5px solid black; border-radius: 2px;border-collapse: collapse;" border='1px' bgcolor="#96D4D4">
            <tr style="height:50px;background-color: #87CEFA; border-collapse: collapse;border: 2px solid white;border-radius: 10px;border-color: #87CEFA">
                <th >
                    Loại phòng</th>
                  <th >
                       Giá cả hôm nay </th>
                  <th >
                      Ưu Đãi và Dịch vụ </th>
                   <th>
                      Chọn phòng </th>
            </tr>
            <c:forEach items="${requestScope.rooms}" var="i">
            <tr style="height:60px">
                <td style="width:30%; text-align: center;">${i.type}</td>
                <td style=" width:30%;text-align: center;background-color: #CCFFFF;border-radius: 10px;border-color: #CCFFFF">
                    ${i.price}</td>
                <td style="width:30%;text-align: center;background-color: #009999;text-align: center;border-radius: 10px;border-color: #CCFFFF">
                    ${i.des}, <h4>WiFi miễn phí</h4> Phòng tắm riêng trong phòng</td>
                <td style="width:10%;text-align: center;">
                    <a href="booking?rid=${i.id}"><button style="background-color: #5beb94; color: black;border-radius: 5px;">Đặt ngay</button></a>
            </tr>
            </c:forEach>
          </table>
          
        </section>
        
        <br/>
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
