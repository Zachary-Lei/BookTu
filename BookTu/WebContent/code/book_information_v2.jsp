<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <title>书籍信息</title>
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
   
  <link rel="stylesheet" type="text/css" href="assets/css/layui.css">
  <link rel="stylesheet" type="text/css" href="assets/css/main.css">
  
  <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css" />
    <style type="text/css">
    	a:link, a:visited, a:hover, a:active { text-decoration: none;}
    	#wrapper {
    		width: 1000px;
    		margin: 0 auto;
    		overflow: hidden;
    	}
    	#content {
    		position: relative;
    	}
    	#surface {
    		width: 130px;
    		height: 210px;
    		position: absolute;
    		left: 20px;
    		
    	}
    	#info {
    		position: relative;
    		left: 170px;
    		margin-bottom: 100px;
    		line-height: 1.5em;
    	}
    	#score {
    		position: absolute;
    		right: 120px;
    		top: 0;
    		border-left: solid 1px gray;
    		padding-left: 10px;
    		font-size: 12px;
    		color: gray;
    		width: 180px;
    	}
    	#grade {
    		font-size: 2em;
    		float: left;
    	}
    	#star {
    		float: right;
    	}
    	#star .fa-star {
    		color: orange;
    	}
    	#clear {
    		clear: both;
    	}
    	#star5, #star4, #star3, #star2, #star1 {
    		width: 2.5em;
    		padding-right: 0;
    		border-right: solid pink 100px;
    		margin-top: 2px;
    		display: inline-block;
    	}
    	#interest {
    		margin-left: 15px;
    	}
    	#interest a {
    		font-size: 12px;
    		margin-right: 5px;
    		border: solid 1px black;
    		border-radius: 3px;
    		background-color: pink;
    		color: black;
    	}
    	#operate {
    		margin-left: 15px;
    		margin-top: 20px;
    		position: relative;
    	}
    	#operate a {
    		margin-right: 15px;
    	}
    	#rec {
    		position: absolute;
    		right: 0;
    		color: green;
    		background-color: whitesmoke;
    		border: solid 1px black;
    		border-radius: 3px;

    	}
    	#book_info span, #author_info span {
    		color: red;
    	}
    	#bookreport {
    		text-overflow: ellipsis;
            overflow: hidden;
            white-space: nowrap;
            height: 5.5em;
            width: 1000px;
            padding-left: 5px;
            text-indent: 2em;
    	}
    	#authorreport {
    		text-overflow: ellipsis;
            overflow: hidden;
            white-space: nowrap;
            height: 3em;
            width: 1000px;
            padding-left: 5px;
            text-indent: 2em;
    	}
    </style>
  

</head>
<body>
 		<%@ include file="dbconnect.jsp"%>  
	    <% request.setCharacterEncoding("UTF-8"); %>
	    <jsp:include page="head.jsp" flush="true"/>
 
          <%
            String netid1 = session.getAttribute("login_id").toString();       
          	String book_id = request.getParameter("book_id");
	      %>
		<div id="service-page">
	 		<!-- header begin -->
            <header class="page-head">
                <div class="header-wrapper">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">

                                <ol class="breadcrumb">
                                    <li><a href="#">书籍推荐</a></li>
                                    <li class="active">详情</li>
                                </ol> <!-- end of /.breadcrumb -->

                            </div>
                        </div>
                    </div> <!-- /.container -->
                </div> <!-- /.header-wrapper -->
            </header> <!-- /.page-head (header end) -->
         </div>
         
     <%
		        Statement stmt1 = connect.createStatement();
		        ResultSet rs1=stmt1.executeQuery("select * from Book where book_id = " + book_id  +  ";");
		      	rs1.next();
	      		Statement stmt2 = connect.createStatement();
	        	ResultSet rs2=stmt2.executeQuery("select * from User where user_id = " + rs1.getInt("user_id")  +  ";");
	      		rs2.next();  
	      		
	      		
      %> 
        
            
	<div id="wrapper">
		<h1><%=rs1.getString(3) %></h1>
		<div id="content">
			<div>
				<img src="sakura.jpg" id="surface">
				<div id="info">
					<span>作者：</span><a href="#"><span id="author"><%=rs1.getString("author") %></span></a><br>
					<span>出版社：</span><span id="press"><%=rs1.getString("publishing_house") %></span><br>
					<span>页数：</span><span id="page"><%=rs1.getString("pages_num") %></span><br>
					<span>定价：</span><span id="price"><%=rs1.getString("price") %></span><br>
					<span>装帧:</span><span id="layout"><%=rs1.getString("layout") %></span><br>
					<span>ISBN:</span><span id="isbn"><%=rs1.getString("isbn") %></span><br>
				</div>
				
				
				
				<div id="operate">
					<a href="#"><i class ="fa fa-pencil fa-1g"></i>写笔记</a>
					<a href="write_book_comment?book_name=<%=rs1.getString(3)%>"><i class ="fa fa-pencil fa-1g"></i>写书评</a>
					<a href="#"><i class ="fa fa-cny fa-1g"></i>加入购书单</a>
					<a href="#">分享到<i class ="fa fa-caret-down fa-1g"></i></a>
					<a href="#" id="rec">推荐</a>
				</div>
				<div id="book_info">
					<h2><span>内容简介······</span></h2>
					<div id="bookreport" style="font-size:1.25em;"><%=rs1.getString("introduction") %><br></div>
				</div>
				<div id="author_info">
					<h2><span>作者简介······</span></h2>
					<div id="authorreport" style="font-size:1.25em;"><%=rs1.getString("author")%><br></div>
				</div>
				<div id="shorcomment">
					<h2><span>短评·····</span></h2>
					<div id="shortcommentwindow">
						<%
							Statement stmt3 = connect.createStatement();
					        ResultSet rs3=stmt3.executeQuery("select * from bookcomment where book_id = "+book_id+";");
					      	while(rs3.next() ) {   
					      		
					    %>
				        
				        
				            <%
						         
					      		Statement stmt4 = connect.createStatement();
					        	ResultSet rs4=stmt2.executeQuery("select * from User where user_id = " + rs3.getInt(2)  +  ";");
					      		rs4.next();  
					      	
					      		
					      		Statement stmt5 = connect.createStatement();
					        	ResultSet rs5=stmt5.executeQuery("select count(*) from BookCommentReply where book_comment_id = " + rs1.getInt(1)  +  ";");
					      		rs5.next();
					      		int comment_num = rs5.getInt(1);
						    %>


                            <article class="blog-item" style="border:1px solid gray;padding:5px;">
                            <!--    <img class="img-responsive center-block" src="assets/img/blog-item1.jpg" alt="blog-item1"> -->
                                <div class="blog-heading">
                                    <h3 class="text-capitalize"><%=rs3.getString(5) %></h3>
                                    
                                    <span><%=rs4.getString(3) %> 评论  <%=rs1.getString(3) %> </span>
                               		<h5></h5>
                                    <span class="date"><%=rs3.getString(4) %></span>
                                    <span><%=rs5.getInt(1) %> comments</span>
                                </div>
                                <p class="text_content">
                                   <%=rs3.getString(6) %>
                                </p>

                                <a href="book_comment_detail.jsp?book_comment_id=<%=rs3.getString(1)%>" class="text-capitalize ">
                                    read more
                                    <span><i class="fa fa-angle-double-right"></i> </span>
                                </a>
                            </article> <!-- /.blog-item -->
                            
                           
				            
				        <%
				        	}
					      	%>
					</div>
				</div>
			</div>
		</div>
	</div>
	

  
  <jsp:include page="PC_foot.jsp" flush="true"/>
  
</body>
</html>