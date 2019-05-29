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
        
        <style type="text/css">
		.text_content{
		overflow: hidden;
		text-overflow: ellipsis;
		display: -webkit-box;
		-webkit-line-clamp: 1;
		-webkit-box-orient: vertical;
		}
		</style>


    </head>

    <body>
    	<%@ include file="dbconnect.jsp"%>  
	    <% request.setCharacterEncoding("UTF-8"); %>
	    <jsp:include page="head.jsp" flush="true"/>
	    
        <div id="multiple-blog-page">
            <!-- header begin -->
            <header class="page-head">
                <div class="header-wrapper">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">

                                <ol class="breadcrumb">
                                    <li><a href="#">社区</a></li>
                                    <li class="active">热门书评</li>
                                </ol> <!-- end of /.breadcrumb -->

                            </div>
                        </div>
                    </div> <!-- /.container -->
                </div> <!-- /.header-wrapper -->
            </header> <!-- /.page-head (header end) -->


            <section class="blog-content">
                <div class="container">
                    <div class="row">
                        <main class="col-md-9 col-md-push-3" style="display: block;">

							<%
						        Statement stmt1 = connect.createStatement();
						        ResultSet rs1=stmt1.executeQuery("select * from BookComment order by like_number desc;");
						      	while(rs1.next() ) {   
						      		Statement stmt2 = connect.createStatement();
						        	ResultSet rs2=stmt2.executeQuery("select * from User where user_id = " + rs1.getInt(2)  +  ";");
						      		rs2.next();  
						      		Statement stmt3 = connect.createStatement();
						      		ResultSet rs3=stmt3.executeQuery("select * from Book where book_id = " + rs1.getInt(3)  +  ";");
						      		rs3.next();  
						      		
						      		Statement stmt6 = connect.createStatement();
						        	ResultSet rs6=stmt6.executeQuery("select count(*) from BookCommentReply where book_comment_id = " + rs1.getInt(1)  +  ";");
						      		rs6.next();
						      		int comment_num = rs6.getInt(1);
						    %>


                            <article class="blog-item">
                            <!--    <img class="img-responsive center-block" src="assets/img/blog-item1.jpg" alt="blog-item1"> -->
                                <div class="blog-heading">
                                    <h3 class="text-capitalize"><%=rs1.getString(5) %></h3>
                                    
                                    <span><%=rs2.getString(3) %> 评论  <%=rs3.getString(3) %> </span>
                               		<h5></h5>
                                    <span class="date"><%=rs1.getString(4) %></span>
                                    <span><%=rs6.getInt(1) %> comments</span>
                                </div>
                                <p class="text_content">
                                   <%=rs1.getString(6) %>
                                </p>

                                <a href="book_comment_detail.jsp?book_comment_id=<%=rs1.getString(1)%>" class="text-capitalize ">
                                    read more
                                    <span><i class="fa fa-angle-double-right"></i> </span>
                                </a>
                            </article> <!-- /.blog-item -->
                            
                            <%
						      	}
                            %>                    

                            <div class="row">
                                <div class="col-md-12">
                                    <blockquote>
                                        <p>若要生活愉快非得把自己先踩成一块地毯不可，否则总有人来替天行道，挫你的锐气，与其待别人动手，不如自己先打嘴巴，总之将本身毁谤得一钱不值，别人的气也就平了，也不妒忌了</p>
                                        <footer>——《我的前半生》</footer>
                                    </blockquote>
                                </div>
                            </div>

						 <!--  
                            <div class="row">
                                <div class= "col-md-6 col-md-offset-3 text-center">
                                    <ul class="pagination">
                                        <li><a href="#"> < </a></li>
                                        <li class="active">
                                            <a href="#">1 <span class="sr-only">(current)</span></a>
                                        </li>
                                        <li><a href="#">2</a></li>
                                        <li><a href="#">3</a></li>
                                        <li><a href="#">4</a></li>
                                        <li><a href="#">5</a></li>
                                        <li><a href="#"> > </a></li>
                                    </ul> 
                                </div>
                            </div>
                           -->
                        </main>

                        <!-- begin sidebar -->
                        <aside class="col-md-3 col-md-pull-9">
                            <jsp:include page="side_note.jsp" flush="true"/>
                        </aside>
                        <!-- end sidebar -->
                    </div>
                </div>
            </section>


            

		<jsp:include page="PC_foot.jsp" flush="true"/>

        </div> 
        <!-- end of /#multiple-blog-page -->


        <script type="text/javascript" src="assets/js/jquery-2.1.3.min.js"></script>
        <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
        

        <!-- script for FAQ using jquery -->
        
        <script>
            $(".faq-q").click( function () {
              var container = $(this).parents(".faq-c");
              var answer = container.find(".faq-a");
              var trigger = container.find(".faq-t");
              
              answer.slideToggle(200);
              
              if (trigger.hasClass("faq-o")) {
                trigger.removeClass("faq-o");
              }
              else {
                trigger.addClass("faq-o");
              }
            });
        </script>
    </body>
</html>