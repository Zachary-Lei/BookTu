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

        <title>微日记</title>

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
                                    <li class="active">微日记</li>
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

                    ResultSet rs=stmt.executeQuery("select title,time,content,message_id from Message where user_id = "+session.getAttribute("login_id"));
                    while(rs.next())
                    {
                    	//out.print("<div class=\"headline text-center\"> <p>"+rs.getString(1)+"</p> </div>");
                    	out.println("<div class=\"cmnt-clipboard\"><span class=\"btn-clipboard\"><a href=\"PC_ex_MessageLeft.jsp?delete_id="+rs.getString(4)+"\">删除</a></span></div>");
                    	out.println("<div class=\"well\">");
                    	out.println("<div class=\"row\">");
                    	out.println("<div class=\"col-md-2\">");
                    	out.println("<img src=\"assets/img/showcase7.jpg\" class=\"img-responsive center-block\" alt=\"second-comment\">");
                    	out.println("</div>");
                    	out.println("<div class=\"col-md-10\">");
                    	out.println("<p class=\"comment-info\">");
                    	out.println("<strong>"+rs.getString(1)+"</strong> <span>"+rs.getString(2)+"</span>");
                    	out.println("</p>");
                    	out.print("<p>"+rs.getString(3)+"</p>");
                    	out.println("</div>");
                    	out.println("</div>");
                    	out.println("</div>");
                    }
                    %>
                    

                    <!-- contact-form -->
                    <section class="contact-form">

                        <!-- call for contact -->
                        <div class="headline text-center">
                        <!-- <div class = "comment-post">  -->
                            <div class="row">
                                <div class="col-md-6 col-md-offset-3">
                                    <h2 class="section-title">微日记</h2>
                                    <!--<p class="section-sub-title">
                                        	欢迎在下方为自己留言 -->
                                    </p> <!-- /section-sub-title -->
                                </div>
                            </div>
                        </div> <!-- /.contact-speech -->

                        <form method="post" action="PC_ex_MessageLeft.jsp">

                            <div class="row">
                                
                                <div class="col-md-4 col-md-offset-2">

                                    <div class="form-group">
                                        <input  name="title" type="text" class="form-control" id="title" required="required" placeholder="标题">
                                    </div>

                                    <div class="form-group">
                                        <input name="time" type="text" class="form-control" id="time" required="required" placeholder="时间、天气……">
                                    </div>
									<%--
                                    <div class="form-group">
                                        <input name="website" type="url" class="form-control" id="subject" required="required" placeholder="Your Website">
                                    </div>
									--%>
                                </div>
                                 

                                <div class="col-md-8 col-md-offset-2">
                                    <textarea name="message" type="text" class="form-control" id="message" rows="8" required="required" placeholder="在此输入留言（支持HTML格式）"></textarea>
                                </div>
                            </div>

                                <button type="submit" id="submit" name="submit" class="btn btn-black">提交</button>
                            
                        </form> <!-- form end -->
                    </section> <!-- /.contact-form -->

                </div> <!-- container -->
            </div>
            <!-- main-content end -->
            
            <!-- show messages -->


            <jsp:include page="PC_foot.jsp" flush="true"/>

        </div> <!-- /#contact-page (page end) -->


    </body>
</html>
