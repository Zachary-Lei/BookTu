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
		<div id="portfolio-page">
	 		<!-- header begin -->
            <header class="page-head">
                <div class="header-wrapper">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">

                                <ol class="breadcrumb">
                                    <li><a href="#">资源上传</a></li>
                                    <li class="active">详情</li>
                                </ol> <!-- end of /.breadcrumb -->

                            </div>
                        </div>
                    </div> <!-- /.container -->
                </div> <!-- /.header-wrapper -->
            </header> <!-- /.page-head (header end) -->
         </div>
            
  <div class="content whisper-content" style="background-color:rgb(138,139,108);" >
  
    <div class="cont">
      <div class="whisper-list">
      


			<h2 align="center">请完善信息并上传资料</h2>
			<form method="post" action="upload_file.jsp" enctype="multipart/form-data" >
		
			 <div class="card bg-light text-dark" style="width:600px;margin:auto;margin-top:5%; background-color:rgb(217,217,216); opacity:0.6;">
			    <div class="card-body">
			    
				    <div class="input-group mb-3">
				      <input type="text" class="form-control" name="material_name" required="true" placeholder="资源名称">
				    </div>
				    
			    	<div class="input-group mb-3">
				      <input type="text" class="form-control" name="comment" required="true" placeholder="资源描述">
				    </div>
				    
					    
					    
			<div class="input-group mb-3">
		      <input type="file" class="form-control" name="file" required="true">
		      <div class="input-group-append">
		        <span class="input-group-text">资源文件</span>
		      </div>
		    </div>
					    	
				    
				</div>
			  </div>  
		
				<br>
					<div align="center">
				
						<input type="submit" class="btn btn-info" value="提交" style="background-color:rgb(135,126,95);" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="resource_browse.jsp" class="btn btn-info" role="button" style="background-color:rgb(135,126,95);" >返回(不保存)</a>
						 
					</div>
			
			</form>

      
        
            
      </div>

    </div>
  </div>
  
  <jsp:include page="PC_foot.jsp" flush="true"/>
  
  
</body>
</html>