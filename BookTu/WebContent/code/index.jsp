<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 

<html class="no-js"> <!--<![endif]-->
    <head>

        <title>BookTu</title>

        <!-- meta -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        
        <!-- stylesheets -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/animate.css">
        <link rel="stylesheet" href="assets/css/owl.carousel.css">
        <link rel="stylesheet" href="assets/css/owl.theme.css">
        <link rel="stylesheet" href="assets/css/style.css">


        <!-- scripts -->
        <script type="text/javascript" src="assets/js/modernizr.custom.97074.js"></script>

    </head>

    <body>

        <div id="home-page">

			<jsp:include page="head.jsp" flush="true"/>


            <!-- header start -->
            <header id="header" class="header-wrapper home-parallax home-fade">
                <div class="header-overlay"></div>
                <div class="header-wrapper-inner">
                    <div class="container">

                        <div class="welcome-speech">
                            <h1>欢迎来到书途</h1>
                            <p>在这里你可以找到一切你想要的</p>
                            
                        </div><!-- /.intro -->
                        
                    </div><!-- /.container -->

                </div><!-- /.header-wrapper-inner -->
            </header>
            <!-- /#header -->

		</div>
        
        <jsp:include page="PC_foot.jsp" flush="true"/>

        <!--  Necessary scripts  -->

        <script type="text/javascript" src="assets/js/jquery-2.1.3.min.js"></script>
        <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="assets/js/owl.carousel.js"></script>
        <script type="text/javascript" src="assets/js/jquery.hoverdir.js"></script>


        <!-- script for portfolio section using hoverdirection -->
        <script type="text/javascript">
            $(function() {

                $('.portfolio-item > .item-image').each( function() { $(this).hoverdir({
                    hoverDelay : 75
                }); } );

            });
        </script>


        <!-- script for twitter-feed using owl carousel-->
        <script type="text/javascript">
            $(document).ready(function() {
 
                $("#twit").owlCarousel({
                 
                    navigation : true, // Show next and prev buttons
                    slideSpeed : 100,
                    paginationSpeed : 400,
                    navigationText : false,
                    singleItem: true,
                    autoPlay: true,
                    pagination: false
                });
 
            });
        </script>


        <!-- script for testimonial section using owl carousel -->
        <script type="text/javascript">
            $(document).ready(function() {
 
                $("#client-speech").owlCarousel({
                 
                    autoPlay: 5000, //Set AutoPlay to 3 seconds
                    stopOnHover: true,
                    singleItem:true
                });
 
            });
        </script>


    </body>
</html>
