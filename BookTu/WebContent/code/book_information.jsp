<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
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
	        	ResultSet rs2=stmt2.executeQuery("select * from User where user_id = " + rs1.getInt(2)  +  ";");
	      		rs2.next();  
	      		
	      		
      %> 
        
            
	<div id="wrapper">
		<h1><%=rs1.getString(3) %></h1>
		<div id="content">
			<div>
				<img src="sakura.jpg" id="surface">
				<div id="info">
					<span>作者：</span><a href="#"><span id="author"><%=rs1.getString(4) %></span></a><br>
					<span>出版社：</span><span id="press"><%=rs1.getString(8) %></span><br>
					<span>页数：</span><span id="page">-1</span><br>
					<span>定价：</span><span id="price">白给</span><br>
					<span>装帧:</span><span id="layout">只有封面</span><br>
					<span>ISBN:</span><span id="isbn">20195222114</span><br>
				</div>
				<div id="score">
					<span>评分</span><br>
					<div id="grade"><%=rs1.getString(6) %></div>
					<div id="star">
						<i class ="fa fa-star fa-1g"></i>
						<i class ="fa fa-star fa-1g"></i>
						<i class ="fa fa-star fa-1g"></i>
						<i class ="fa fa-star fa-1g"></i>
						<i class ="fa fa-star fa-1g"></i>
						<span id="people">5人评价</span>
					</div>
					<div id="clear"></div>
					<div id="bar">
						<div>
							<div id="star5">五星</div><span>100%</span>
						</div>
						<div>
							<div id="star4">四星</div><span>100%</span>
						</div>
						<div>
							<div id="star3">三星</div><span>100%</span>
						</div>
						<div>
							<div id="star2">二星</div><span>100%</span>
						</div>
						<div>
							<div id="star1">一星</div><span>100%</span>
						</div>
					</div>
				</div>
				
				<div id="interest">
					<a href="#" id="do">想读</a>
					<a href="#" id="doing">在读</a>
					<a href="#" id="done">读过</a>
					<span>评价：</span>
					<i class ="fa fa-star-o fa-1g"></i>
					<i class ="fa fa-star-o fa-1g"></i>
					<i class ="fa fa-star-o fa-1g"></i>
					<i class ="fa fa-star-o fa-1g"></i>
					<i class ="fa fa-star-o fa-1g"></i>
				</div>
				<div id="operate">
					<a href="#"><i class ="fa fa-pencil fa-1g"></i>写笔记</a>
					<a href="#"><i class ="fa fa-pencil fa-1g"></i>写书评</a>
					<a href="#"><i class ="fa fa-cny fa-1g"></i>加入购书单</a>
					<a href="#">分享到<i class ="fa fa-caret-down fa-1g"></i></a>
					<a href="#" id="rec">推荐</a>
				</div>
				<div id="book_info">
					<h2><span>内容简介······</span></h2>
					<div id="bookreport"><%=rs1.getString(5) %><br>
				</div>
				<div id="author_info">
					<h2><span>作者简介······</span></h2>
					<div id="authorreport">佚名简介<br>简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介</div>
				</div>
				<div id="shorcomment">
					<h2><span>短评·····</span></h2>
				</div>
			</div>
		</div>
	</div>

  
  <jsp:include page="PC_foot.jsp" flush="true"/>
  
</body>
</html>