<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <title>搜索结果</title>
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
  

</head>
	<body>
		<%@ include file="dbconnect.jsp"%>  
	    <% request.setCharacterEncoding("UTF-8"); %>
	    <jsp:include page="head.jsp" flush="true"/>
	
	      <%
	           String netid1 = session.getAttribute("login_id").toString();           
	      %>
		<div id="service-page">
	 		<!-- header begin -->
	           <header class="page-head">
	               <div class="header-wrapper">
	                   <div class="container">
	                       <div class="row">
	                           <div class="col-md-12">
	
	                               <ol class="breadcrumb">
	                                   <li><span>书籍推荐</span></li>
	                                   <li class="active">标签搜索</li>
	                               </ol> <!-- end of /.breadcrumb -->
	
	                           </div>
	                       </div>
	                   </div> <!-- /.container -->
	               </div> <!-- /.header-wrapper -->
	           </header> <!-- /.page-head (header end) -->
	        </div>
	        <div style="width:1000px;margin:50px auto;">
	        	<h1>
	        		搜索<%=request.getParameter("searchFor")%>
	        		结果共<% 
	        		String searchFor = request.getParameter("searchFor");
	        		ResultSet rs1 = connect.createStatement().executeQuery("select count(*) totalCount from Book where tag like \"%"+searchFor+"%\";");
	        		if (rs1 != null){
	        			rs1.next();
	        			out.print(rs1.getInt(1));
	        		}
	        		else out.print("0");
	        		%>项
	        	</h1>
	        	<div id="resList">
	        		<%
	        		Statement stmt1 = connect.createStatement();
			        rs1=stmt1.executeQuery("select * from Book where tag like \'%"+request.getParameter("searchFor")+"%\';");
			      	while(rs1.next()) {
	        		%>
	        		<div>
	        			<div style="width:1000px;height:122px;border-top:1px solid black;padding:10px;margin-bottom:20px;">
	        				<img alt="picture" src="assets/img/book_surface/<%= rs1.getString("book_name")%>.jpg" style="width:61.8px;height:100px;float:left;">
	        				<div style="font-size:2em;font-weight:bold;margin-left:70px;"><%=rs1.getString("book_name") %></div>
	        				<div style="margin-left:80px;"><%=rs1.getString("author") %></div>
	        				<div style="margin-left:80px;"><%=rs1.getString("introduction") %></div>
	        			</div>
	        		</div>
	        		<%} %>
	        	</div>
	        </div>
            
	 
        
   
  
  <jsp:include page="PC_foot.jsp" flush="true"/>
  
</body>
</html>