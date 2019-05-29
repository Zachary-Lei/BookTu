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

</head>
<body>
 		<%@ include file="dbconnect.jsp"%>  
	    <% request.setCharacterEncoding("UTF-8"); %>
	    <jsp:include page="head.jsp" flush="true"/>
 
          <%
            String netid1 = session.getAttribute("login_id").toString();
            
	      %>
		<div id="single-blog-page">
	 		<!-- header begin -->
            <header class="page-head">
                <div class="header-wrapper">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">

                                <ol class="breadcrumb">
                                    <li><a href="#">写书评</a></li>
                                    <li class="active">详情</li>
                                </ol> <!-- end of /.breadcrumb -->

                            </div>
                        </div>
                    </div> <!-- /.container -->
                </div> <!-- /.header-wrapper -->
            </header> <!-- /.page-head (header end) -->
         </div>
            
  <div class="content whisper-content leacots-content" style="background-color:rgb(118,107,79); opacity:0.8;" >
    <div class="cont w1000">  
      <div class="whisper-list">
        <div class="item-box">
          <div class="review-version"> 
              <div class="form-box">
                <div class="form">
                  <form class="layui-form" action="" method = "post">
                    <div class="layui-form-item layui-form-text">
                      <div class="layui-input-block" style="background-color:rgb(217,217,216); opacity:0.6;" >
                      
                      	<input type = "text" name="title" placeholder="标题" class="layui-textarea">
                      	<input type = "text" name="book_name" placeholder="书名" class="layui-textarea">
                      	<input type = "text" name="content" placeholder="有感而发，畅所欲言" class="layui-textarea">
                  
                      </div>
                    </div>
                    <div class="layui-form-item"> 
                      <div class="layui-input-block" style="text-align: right;">
                        <input type="submit" class="layui-btn " value = "确定" > 

                      </div>
                    </div>
                  </form>
                  
        <% 
		String title = request.getParameter("title");
        String book_name = request.getParameter("book_name");
        String content = request.getParameter("content");
		String netid = netid1;
		
		
		if((title!=null&&title!="") && (book_name!=null&&book_name!="") && (content!=null&&content!="") )
		{
			/*
			System.out.println(title);
			System.out.println(book_name);
			System.out.println(content); */
			
			Statement stm=connect.createStatement();
			String sqlq="select * from BookComment order by book_comment_id desc limit 1;";
			ResultSet rs=stm.executeQuery(sqlq);
			
			int book_comment_id=1;
			if(rs.next())
			{
				book_comment_id=rs.getInt(1)+1;
			}
			
			
			
			Statement stmt1 = connect.createStatement();
      		ResultSet rs1=stmt1.executeQuery("select * from Book where book_name = \'" + book_name +"\';");
      		rs1.next(); 
		
			String sql="insert into BookComment(book_comment_id,user_id,book_id,time,title,content,like_number,reply_to) values(?,?,?,?,?,?,?,?);";
			PreparedStatement pstmt5=connect.prepareStatement(sql);
			pstmt5.setInt(1, book_comment_id);
		    pstmt5.setInt(2, Integer.parseInt(netid));
		    pstmt5.setInt(3, rs1.getInt(1));  
		    java.util.Date d = new java.util.Date();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String now = df.format(d);   
		    pstmt5.setString(4, now);
		    pstmt5.setString(5, title);
		    pstmt5.setString(6, content);
		    pstmt5.setInt(7,0);  
		    pstmt5.setInt(8,0);  
		    pstmt5.executeUpdate();  
		      
		    %>
			  
		     <script type="text/javascript">
		    	window.location.replace("book_review.jsp");
		    </script>
		    <%   
		}
	%>
                               
                </div>
              </div>
              

          </div>
        </div>
      </div>
    </div>
  </div>
  
  <jsp:include page="PC_foot.jsp" flush="true"/>
  
</body>
</html>