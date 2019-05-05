<%@ page contentType="text/html; charset=utf-8" language="java" 
	import="java.sql.*" errorPage="" %>
<%--@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"--%>
<!DOCTYPE html>

    

<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 

<html class="no-js"> <!--<![endif]-->
    <head>

        <title>个人中心</title>

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
                                    <li><a href="PC_PersonalCenter.jsp">个人主页</a></li>
                                    <li class="active">留言</li>
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



                    <!-- contact-form -->
                    <section class="contact-form">

                        <!-- call for contact -->
                        <div class="headline text-center">
                            <div class="row">
                                <div class="col-md-6 col-md-offset-3">
                                    <h2 class="section-title">留言板</h2>
                                    <p class="section-sub-title">
                                        	欢迎在下方为我留言
                                    </p> <!-- /section-sub-title -->
                                </div>
                            </div>
                        </div> <!-- /.contact-speech -->

                        <form method="post" action="PersonalCenter.php">

                            <div class="row">
                                <%--
                                <div class="col-md-4">

                                    <div class="form-group">
                                        <input  name="name" type="text" class="form-control" id="name" required="required" placeholder="Full Name">
                                    </div>

                                    <div class="form-group">
                                        <input name="email" type="email" class="form-control" id="email" required="required" placeholder="Email Address">
                                    </div>

                                    <div class="form-group">
                                        <input name="website" type="url" class="form-control" id="subject" required="required" placeholder="Your Website">
                                    </div>

                                </div>
                                 --%>

                                <div class="col-md-8 col-md-offset-2">
                                    <textarea name="message" type="text" class="form-control" id="message" rows="8" required="required" placeholder="Type here message"></textarea>
                                </div>
                            </div>

                                <button type="submit" id="submit" name="submit" class="btn btn-black">send message</button>
                            
                        </form> <!-- form end -->
                    </section> <!-- /.contact-form -->

                </div> <!-- container -->
            </div>
            <!-- main-content end -->


            <jsp:include page="PC_foot.jsp" flush="true"/>

        </div> <!-- /#contact-page (page end) -->


    </body>
</html>