<%@ page contentType="text/html; charset=utf-8" language="java" 
	import="java.sql.*" errorPage="" %>
<%--@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"--%>
<!DOCTYPE html>

<%
String qq="735791821";
String wechat="735791821";
String phone_number="18680212182";
String email_address="leizhq5@mail2.sysu.edu.cn";
String self_intro="I<br/>am<br/>Zachary Lei!";
%>
    

<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 

<html class="no-js"> <!--<![endif]-->
    <head>

        <title>个人主页</title>

        <!-- meta -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        
        <!-- stylesheets -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/animate.css">
        <link rel="stylesheet" href="assets/css/style.css">

        
    </head>

    <body>

        <div id="contact-page">


            <jsp:include page="head.jsp" flush="true"/>



            <!-- header begin -->
            <header class="page-head">
                <div class="header-wrapper">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">

                                <ol class="breadcrumb">
                                    <li><a href="index.jsp">首页</a></li>
                                    <li class="active">个人主页</li>
                                </ol> <!-- end of /.breadcrumb -->

                            </div>
                        </div>
                    </div> <!-- /.container -->
                </div> <!-- /.header-wrapper -->
            </header> <!-- /.page-head (header end) -->


            <div class="main-content">
                <div class="container">

                    <p>
                    <br/>
                    </p>



                    <!-- contact adresses section begin -->
                    <section class="contact-address bg-white">
                        <div class="row">

                            <div class="col-md-4 col-xs-12">
                                <div class="address-info">
                                    <div class="row">

                                        <div class="col-md-3 col-xs-3">
                                            <div class="address-info-icon text-center center-block bg-light-gray">
                                                <i class="fa fa-map-marker"></i>
                                            </div> <!-- /.address-info-icon -->
                                        </div>

                                        <div class="col-md-9 col-xs-9 address-info-desc">
                                            <h3>QQ/微信</h3>
                                            <p>
                                                <%= qq %><br/>
                                                <%= wechat %>
                                            </p>
                                        </div> <!-- /.address-info-desc -->

                                    </div>
                                </div> <!-- /.address-info -->
                            </div>

                            <div class="col-md-4 col-xs-12">
                                <div class="address-info">
                                    <div class="row">

                                        <div class="col-md-3 col-xs-3">
                                            <div class="address-info-icon text-center center-block bg-light-gray">
                                                <i class="fa fa-phone"></i>
                                            </div> <!-- /.address-info-icon -->
                                        </div>

                                        <div class="col-md-9 col-xs-9 address-info-desc">
                                            <h3>电话号码</h3>
                                            <p>
                                                <%= phone_number %>
                                            </p>
                                        </div> <!-- /.address-info-desc -->

                                    </div>
                                </div> <!-- /.address-info -->
                            </div>

                            <div class="col-md-4 col-xs-12">
                                <div class="address-info">
                                    <div class="row">

                                        <div class="col-md-3 col-xs-3">
                                            <div class="address-info-icon text-center center-block bg-light-gray">
                                                <i class="fa fa-envelope-o"></i>
                                            </div> <!-- /.address-info-icon -->
                                        </div>

                                        <div class="col-md-9 col-xs-9 address-info-desc">
                                            <h3>邮箱</h3>
                                            <p>
                                                <%= email_address %>
                                            </p>
                                        </div> <!-- /.address-info-desc -->

                                    </div>
                                </div> <!-- /.address-info -->
                            </div>

                        </div>
                    </section> <!-- /.contact-address -->



                    <!-- self introduction -->
                    <section class="contact-form">

                        <!-- call for contact -->
                        <div class="headline text-center">
                            <div class="row">
                                <div class="col-md-6 col-md-offset-3">
                                    <h2 class="section-title">个人介绍</h2>
                                    <p class="section-sub-title">
                                        <%=self_intro %>
                                    </p> <!-- /section-sub-title -->
                                </div>
                            </div>
                        </div> <!-- /.contact-speech -->

                        
                    </section> <!-- /.contact-form -->

                </div> <!-- container -->
            </div>
            <!-- main-content end -->


		<jsp:include page="PC_foot.jsp" flush="true"/>
    </body>
</html>