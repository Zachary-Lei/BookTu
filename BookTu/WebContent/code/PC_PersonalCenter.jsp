<%@ page contentType="text/html; charset=utf-8" language="java" 
	import="java.sql.*" errorPage="" %>
<%--@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"--%>
<!DOCTYPE html>

<%@ include file="dbconnect.jsp" %>
<%
//--session.setAttribute("login_id", 123);

Statement stmt = connect.createStatement(); 

String nickname="";
String avator="";
String score="";
String self_intro="";

ResultSet rs=stmt.executeQuery("select * from User where user_id = "+session.getAttribute("login_id"));
while(rs.next())
{
	nickname += rs.getString(3);
	avator = rs.getString(4);
	score += rs.getString(5);
	self_intro += rs.getString(6);
}
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

        <div id="about-page">


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


 <%
 if (session.getAttribute("login_id") != null) {
 %>
            <div class="main-content">
                <div class="container">

                    <p>
                    <br/>
                    </p>


<%--
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
                                            <h3>昵称</h3>
                                            <p>
                                                <%= nickname %>
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
                                                <i class="fa fa-map-marker"></i>
                                            </div> <!-- /.address-info-icon -->
                                        </div>

                                        <div class="col-md-9 col-xs-9 address-info-desc">
                                            <h3>头像</h3>
                                            <p>
                                                <%= avator %>
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
                                                <i class="fa fa-map-marker"></i>
                                            </div> <!-- /.address-info-icon -->
                                        </div>

                                        <div class="col-md-9 col-xs-9 address-info-desc">
                                            <h3>积分</h3>
                                            <p>
                                                <%= score %>
                                            </p>
                                        </div> <!-- /.address-info-desc -->

                                    </div>
                                </div> <!-- /.address-info -->
                            </div>

                        </div>
                    </section> <!-- /.contact-address -->
 --%>


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
<% 
}
%>

		<jsp:include page="PC_foot.jsp" flush="true"/>
    </body>
</html>
