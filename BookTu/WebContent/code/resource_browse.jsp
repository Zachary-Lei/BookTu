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
		<div id="service-page">
	 		<!-- header begin -->
            <header class="page-head">
                <div class="header-wrapper">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">

                                <ol class="breadcrumb">
                                    <li><a href="#">资源浏览</a></li>
                                    <li class="active">详情</li>
                                </ol> <!-- end of /.breadcrumb -->

                            </div>
                        </div>
                    </div> <!-- /.container -->
                </div> <!-- /.header-wrapper -->
            </header> <!-- /.page-head (header end) -->
         </div>
            
  <div class="content whisper-content" style="background-color:rgb(127,97,53);" >
  
  	<div class="container" style="text-align:right">
		 <a href="resource_upload.jsp" class="btn btn-info" role="button" style="background-color:rgb(135,126,95);">我要上传资源</a>
	</div>
  
    <div class="cont">
      <div class="whisper-list">
      

      
      <%
      	Statement stmt = connect.createStatement(); 
      	ResultSet rs=stmt.executeQuery("select * from Resources order by resource_id desc;");
      %>
      <%
      	while(rs.next())
      	{%>
	      	<div class="item-box" style="background-color:rgb(135,126,95); opacity:0.9;" >
	          <div class="item">
	            <div class="whisper-title">
	            
	            
	              <i class="layui-icon layui-icon-date"></i><span class="date"><%=rs.getString(6) %></span>
	            </div>
	            
	            <p class="bg-success text-white" style="text-align:center;font-size:30px"><%=rs.getString(3) %></p>
				
	            <p class="bg-secondary text-white" style="text-align:center"><%=rs.getString(4) %></p>
    			
    			<div style="text-align:center">
					
	    			<%String filelink="../uploadfile/"+rs.getString(5); %>
	    			<a href="<%=filelink %>" download="<%=rs.getString(5) %>">下载</a>
				
				</div>
	            

	          </div>
	          
	        </div>	
      	<%}
      %>
        
        
        
        
        
      </div>

    </div>
  </div>
  
  <jsp:include page="PC_foot.jsp" flush="true"/>
  
</body>
</html>