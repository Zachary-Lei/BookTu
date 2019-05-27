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

        <title>编辑个人信息</title>

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
                                    <li class="active">编辑个人信息</li>
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
                                    <h2 class="section-title">编辑个人信息</h2>
                                    <p class="section-sub-title">
                                        	在下方修改您的个人信息
                                    </p> <!-- /section-sub-title -->
                                </div>
                            </div>
                        </div> <!-- /.contact-speech -->

                        <form method="post" action="PC_ex_EditInfo.jsp">

                            <div class="row">
                                
                                <div class="col-md-4 col-md-offset-4">
                                	<div class="form-group">
                                        <input name="pw_old" type="password" class="form-control" id="pw_old" required="required" placeholder="请输入密码"> <!-- check pw before editing -->
                                    </div>
                                    
                                    <div class="form-group">
                                        <input name="pw_new" type="password" class="form-control" id="pw_new" placeholder="请输入新密码（如需修改）">
                                    </div>
                                    
                                    <div class="form-group">
                                        <input name="pw_confirm" type="password" class="form-control" id="pw_confirm" placeholder="请再次输入新密码（如需修改）">
                                    </div>
                                

                                    <div class="form-group">
                                        <input  name="nickname" type="text" class="form-control" id="nickname" placeholder="昵称（如需修改）">
                                    </div>
                                </div>
									
                                <div class="col-md-8 col-md-offset-2">
                                    <textarea name="intro" type="text" class="form-control" id="intro" rows="8" placeholder="个人介绍（如需修改）"></textarea>
                                </div>
	                                                                 

                            </div>

                            <button type="submit" id="submit" name="submit" class="btn btn-black">确认修改</button>
                            
                        </form> <!-- form end -->
                    </section> <!-- /.contact-form -->

                </div> <!-- container -->
            </div>
            <!-- main-content end -->


            <jsp:include page="PC_foot.jsp" flush="true"/>

        </div> <!-- /#contact-page (page end) -->


    </body>
</html>