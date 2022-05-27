<%-- 
    Document   : searchresult
    Created on : May 26, 2022, 10:56:35 PM
    Author     : Sao Viet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>N4.com</title>
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
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                        <a href="welcome"><i class="fa fa-home"></i>Go Back Home</a>
                    </div>
                </div>
            </div>
        </div>
        </section>
        <table style="width:100%; height:50px; border-radius: 10px;border-collapse: collapse;" border='1px' bgcolor="#96D4D4" >
          <tr>
              <th style=" background-color: #87CEFA; border-collapse: collapse;border: 1px solid black;border-radius: 10px;border-color: #87CEFA"><a href="#">&nbsp;Sap xep theo gia &nbsp; </a></th>
                <th style=" background-color: #87CEFA;border-collapse: collapse;border: 1px solid black;border-radius: 10px;border-color: #87CEFA"><a href="#">&nbsp;Sắp xếp theo số sao &nbsp;</a>  </th>
                <th style=" background-color: #87CEFA;border-collapse: collapse;border: 1px solid black;border-radius: 10px;border-color: #87CEFA"><a href="#">&nbsp;Sap xep theo abc  &nbsp; </a> </th> 
          </tr>
        </table>
        
        <section id="most-visited">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-heading">
                            <h2>${requestScope.ad} tìm thấy ${requestScope.hotel.size()} chỗ nghỉ: </h2>
                        </div>
                    </div>
                    <c:forEach items="${requestScope.hotel}" var="i">
                        <table style="width:100%; border: 10px solid white;">
                            <tr>
                                <td style="width:20%;"><a href="#"><img src="img/${i.image}" alt="Khách sạn ${i.name}" width="200" height="200"></a></td>
                                <td style="width:70%;background-color: #CCFFFF;border-radius: 10px;border-color: #CCFFFF">
                                    <a href="#" target="_blank" style="color: green;" ><h3>${i.name}</h3></a>
                                    <h4>Địa chỉ: ${i.address}</h4>
                                    <h4>${i.des}</h4>
                                    
                                </td>
                                <td style="width:10%;background-color: #009999;text-align: center;border-radius: 10px;border-color: #CCFFFF">
                                    <a href="inforhotel?hid=${i.id}"><button>Đặt ngay</button></a></td>
                            </tr>
                          </table>
                    </c:forEach>
                       
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
    </body>
</html>
