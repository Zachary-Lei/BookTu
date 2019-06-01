<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<!DOCTYPE html>
    
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 

<html class="no-js"> <!--<![endif]-->
    <head>

        <title>在线书店</title>

        <!-- meta -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        
        <!-- stylesheets -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/animate.css">
        <link rel="stylesheet" href="assets/css/style.css">


        <!-- scripts -->
        <script type="text/javascript" src="assets/js/modernizr.custom.97074.js"></script>

    </head>

    <body>
 <%
 if (session.getAttribute("login_id") != null) {
 %>
        <div id="mall-page">


            <jsp:include page="head.jsp" flush="true"/>
            
            <!-- header begin -->
            <header class="page-head">
                <div class="header-wrapper">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">

                                <ol class="breadcrumb">
                                    <li><a href="index.jsp">首页</a></li>
                                    <li class="active">在线书店</li>
                                    <li><a href="mall_myorders.jsp">我的订单</a></li>
                                </ol> <!-- end of /.breadcrumb -->

                            </div>
                        </div>
                    </div> <!-- /.container -->
                </div> <!-- /.header-wrapper -->
            </header> <!-- /.page-head (header end) -->



            <div class="main-content">

                <!--  begin mall section  -->
                <section class="bg-light-gray">
                    <div class="container">

                        <div class="headline text-center">
                            <div class="row">
                                <div class="col-md-6 col-md-offset-3">
                                    <h2 class="section-title">加入您的购物车</h2>
                                    <p class="section-sub-title">
                                        	享受阅读的乐趣 
                                    </p> <!-- /.section-sub-title -->
                                </div>
                            </div>
                        </div> <!-- /.headline -->

                        <div class="mall-item-list">
                            <div class="row">

							<%@ include file="dbconnect.jsp" %>
							<%
							Statement stmt = connect.createStatement(); 
							
							String isbn="";
							String bookname="";
							String author="";
							String publishing_house="";
							String price="";
							String introdution="";
							String figure = "";
							
							ResultSet rs=stmt.executeQuery("select * from saleable_books");
							while(rs.next())
							{
								isbn = rs.getString(1);
								bookname = rs.getString(2);
								author = rs.getString(3);
								publishing_house = rs.getString(4);
								price = rs.getString(5);
								introdution = rs.getString(6);
								
								figure = "assets/img/mall/"+ isbn +".jpg";
								%>
								<div class="col-md-3 col-sm-6">
                                    <div class="mall-item">
                                        <div class="item-image">
                                            <a href="mall_ordering.jsp?isbn=<%= isbn %>">
                                                <img src= <%= figure %> width="200" height="200" class="img-responsive center-block" alt=<%= isbn %>>
                                                <div>
                                                <span><i class="fa fa-plus"></i></span>
                                                </div>
                                            </a>
                                        </div>

                                        <div class="item-description">
                                            <div class="row">
                                                <div class="col-xs-6">
                                                    <span class="item-name">
                                                        <%= bookname %>
                                                    </span>
                                                    <span>
                                                       	<%= author %>
                                                    </span>
                                                </div>
                                                <div class="col-xs-6">
                                                    <span class="like">
                                                        <i class="fa fa-heart-o"></i>
                                                        <%= price %>
                                                    </span>
                                                </div>
                                            </div>
                                        </div> <!-- end of /.item-description -->
                                    </div> <!-- end of /.mall-item -->
                                </div>
							<%
							}
							%>

                            </div>
                        </div> <!-- end of mall-item-list -->

                        <div id="moremall"></div>
                        <div class="text-center">
                            <a id="loadmall" class="hidden-xs btn btn-white">
                                Load More <span class="caret"></span>
                            </a>
                        </div>
                            
                    </div>
                </section> 
                <!--   end of mall section  -->

            </div> <!-- end of /.main-content -->
<% 
}
%>

            <footer>
                <div class="container">
                    <div class="row">

                        <!-- useful links -->
                        <div class="col-md-3 col-sm-6 col-xs-6 footer-widget">
                            <h4>Useful Links</h4>
                            <ul class="row footer-links">
                                <div class="col-md-6 col-sm-6 col-xs-6">
                                    <li><a href="#">关于我们</a></li>
                                </div>
                            </ul>
                        </div>

                    </div>
                </div>
            </footer>


            <!-- footer-navigation start -->  
            <nav class="hidden-xs hidden-sm navbar footer-nav" role="navigation">
                <div class="container">
                    
                    <div class="navbar-header">
                        
                        <!-- navbar logo -->
                        <div class="navbar-brand">
                            <span class="sr-only">&copy;THEMEWAGON</span>
                            <a href="index.jsp">
                                &copy;THEMEWAGON
                            </a>
                        </div>
                        <!-- navbar logo -->

                    </div><!-- /.navbar-header -->

                    <!-- nav links -->
                    <div class="collapse navbar-collapse" id="main-nav-collapse">
                        <ul class="nav navbar-nav navbar-right text-capitalize">
                            <li><a href="#about">
                                <span>home</span>
                            </a></li>

                            <li><a href="#services">
                                <span>pages</span>
                            </a></li>

                            <li><a href="#mall">
                                <span>features</span>
                            </a></li>

                            <li><a href="#team">
                                <span>mall</span>
                            </a></li>

                            <li><a href="#pricing">
                                <span>blog</span>
                            </a></li>

                            <li><a href="#blog">
                                <span>shop</span>
                            </a></li>

                            <li><a href="#contact">
                                <span>contact</span>
                            </a></li>
                        </ul>
                    </div><!-- nav links -->
                    
                </div><!-- /.container -->
            </nav>
            <!-- footer-navigation end -->
            
        </div> <!-- end of /#home-page -->

        <!--  Necessary scripts  -->

        <script type="text/javascript" src="assets/js/jquery-2.1.3.min.js"></script>
        <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="assets/js/jquery.hoverdir.js"></script>
        <script type="text/javascript" src="assets/js/script.js"></script>


        <script type="text/javascript">
            $(function() {

                $('.mall-item > .item-image').each( function() { $(this).hoverdir({
                    hoverDelay : 75
                }); } );

            });
        </script>


    </body>
</html>