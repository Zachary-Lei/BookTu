<%@ page contentType="text/html; charset=utf-8" language="java" 
	import="java.sql.*" errorPage="" %>
<%--@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"--%>
<!DOCTYPE html>

    
<%@ include file="dbconnect.jsp" %>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 

<html class="no-js"> <!--<![endif]-->
    <head>

        <title>我的收藏</title>

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

        <div id="service-page">


            <jsp:include page="head.jsp" flush="true"/>



            <!-- header begin -->
            <header class="page-head">
                <div class="header-wrapper">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">

                                <ol class="breadcrumb">
                                    <li><a href="PC_PersonalCenter.jsp">个人主页</a></li>
                                    <li class="active">我的收藏</li>
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

					
                    <%
                    Statement stmt = connect.createStatement(); 

                    ResultSet rs=stmt.executeQuery("select link_name,link,collection_id from CollectedLink where user_id = "+session.getAttribute("login_id"));
                    while(rs.next())
                    {
                    	out.println("<div class=\"cmnt-clipboard\"><span class=\"btn-clipboard\"><a href=\"PC_ex_MyFavourite.jsp?delete_id="+rs.getString(3)+"\">取消收藏</a></span></div>");
                    	out.println("<div class=\"well\">");
                    	out.println("<div class=\"row\">");
                    	out.println("<div class=\"col-md-2\">");
                    	//out.println("<img src=\"assets/img/showcase7.jpg\" class=\"img-responsive center-block\" alt=\"second-comment\">");
                    	out.println("</div>");
                    	out.println("<div class=\"col-md-10\">");
                    	out.println("<p class=\"comment-info\">");
                    	//out.println("<strong>"+rs.getString(1)+"</strong> <span>"+rs.getString(2)+"</span>");
                    	out.println("</p>");
                    	out.print("<p> <a href=\""+rs.getString(2)+"\">"+rs.getString(1)+"</a></p>");
                    	out.println("</div>");
                    	out.println("</div>");
                    	out.println("</div>");
                    }
                    %>
                    
                    
				</div> <!-- container -->
            </div>
                    
            <jsp:include page="PC_foot.jsp" flush="true"/>

        </div> <!-- /#contact-page (page end) -->


    </body>
</html>