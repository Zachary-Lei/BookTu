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
		<div id="multiple-blog-page">
	 		<!-- header begin -->
            <header class="page-head">
                <div class="header-wrapper">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">

                                <ol class="breadcrumb">
                                    <li><a href="#">写书籍推荐</a></li>
                                    <li class="active">详情</li>
                                </ol> <!-- end of /.breadcrumb -->

                            </div>
                        </div>
                    </div> <!-- /.container -->
                </div> <!-- /.header-wrapper -->
            </header> <!-- /.page-head (header end) -->
         </div>
            
  <div class="content whisper-content leacots-content" style="background-color:rgb(114,105,88); opacity:0.8;" >
    <div class="cont w1000">  
      <div class="whisper-list">
        <div class="item-box">
          <div class="review-version"> 
              <div class="form-box">
                <div class="form">
                  <form class="layui-form" action="" method = "post">
                    <div class="layui-form-item layui-form-text">
                      <div class="layui-input-block" style="background-color:rgb(217,217,216); opacity:0.6;" >
                      
                      	
                      	<input type = "text" name="book_name" placeholder="书名" class="layui-textarea">
                      	<input type = "text" name="author" placeholder="作者" class="layui-textarea">
                      	<input type = "text" name="introduction" placeholder="简介" class="layui-textarea">
                      	<input type = "text" name="score" placeholder="评分" class="layui-textarea">
                      	<input type = "text" name="type" placeholder="类型" class="layui-textarea">
                      	<input type = "text" name="publishing_house" placeholder="出版社" class="layui-textarea">
                  
                      </div>
                    </div>
                    <div class="layui-form-item"> 
                      <div class="layui-input-block" style="text-align: right;">
                        <input type="submit" class="layui-btn " value = "确定" > 

                      </div>
                    </div>
                  </form>
                  
        <% 
        String book_name = request.getParameter("book_name");
        String author = request.getParameter("author");
        String introduction = request.getParameter("introduction");
        String score = request.getParameter("score");
        String type = request.getParameter("type");
        String publishing_house = request.getParameter("publishing_house");
		String netid = netid1;
		
		
		if((book_name!=null&&book_name!="") && (author!=null&&author!="") && (introduction!=null&&introduction!="") && (score!=null&&score!="") && (type!=null&&type!="") && (publishing_house!=null&&publishing_house!="") )
		{
			
			
			
			Statement stm=connect.createStatement();
			String sqlq="select * from Book order by book_id desc limit 1;";
			ResultSet rs=stm.executeQuery(sqlq);
			
			int book_id=1;
			if(rs.next())
			{
				book_id=rs.getInt(1)+1;
			}
			
		
			String sql="insert into Book(book_id,user_id,book_name,author,introduction,score,type,publishing_house) values(?,?,?,?,?,?,?,?);";
			PreparedStatement pstmt5=connect.prepareStatement(sql);
			pstmt5.setInt(1, book_id);
		    pstmt5.setInt(2, Integer.parseInt(netid));
		    pstmt5.setString(3, book_name);    
		    pstmt5.setString(4, author);
		    pstmt5.setString(5, introduction);
		    pstmt5.setInt(6, Integer.parseInt(score));
		    pstmt5.setInt(7,Integer.parseInt(type));  
		    pstmt5.setString(8,publishing_house);  
		    pstmt5.executeUpdate();  
		      
		    %>
			  
		     <script type="text/javascript">
		    	window.location.replace("index.jsp");  
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