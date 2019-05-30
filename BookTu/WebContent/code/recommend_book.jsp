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
        * { margin: 0; padding: 0;  line-height: 1.2em; }
        *, a:link, a:visited, a:hover, a:active { text-decoration: none; font-size: 12px; font-family: 宋体;  }
        a {color: #369;}
        .switch {
            float: right;
            color: gray;
            cursor: pointer;
        }
        .f1 {
            top: 5px;
            right: 6px;
            position: relative;
        }
        .fa-circle, .fa-circle-o {
            margin-bottom: px;
        }
        .clear { clear: both;  }

        .board, .recommendwindow { 
            width: 620px; 
            
        }
        .board {
            margin: 50px auto;
        }

        .boardmenu {  height: 18px; border-bottom: 1px solid whitesmoke; padding-bottom: 7px; margin: 5px;padding-bottom: 15px;}
        .boardmenu .title { display: inline-block;}
        .boardmenu .title span {font-weight: bold; font-family: 黑体; font-size: 2em;}
        .boardmenu .more { display: inline-block;}
        .boardmenu .more a { font-size: 13px;font-family: sans-serif;  }
        .recommendwindow li {
            width: 19%;
            height: 50%;
            
            list-style-type: none;  
            display: inline-block;
        }
        .recommendwindow img {
            height: 80%;
            width: 100%;
            margin: 0 auto;
        }
        .recommendwindow span {
            display: block;
            height: 10%;
            text-overflow: ellipsis;
            overflow: hidden;
            white-space: nowrap;
        }
        .recommendwindow {
            height: 400px;
            margin-left: 4px;
        } 
        

        #tag {
            height: 200px;
           
        }
        li {list-style-type:none; }
       
        #nav>li {
           float: left;
           position: relative;
           width:100px;
           height: 27px; 
           display: block; 
           text-align: center; 
           top: 10px;
           background-color: green;
           
        }
         #nav>li span {
            font-size: 2em;
         }
        #nav {
           width:100%;
           display: inline-block;

        }
        #nav li ul {
           width: 100px;
           position: absolute; 
           text-align: center;

        }
        #nav li:hover {
            background-color: yellow;
        }

  	</style>
  
  

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
                                    <li><a href="#">书籍推荐</a></li>
                                    <li class="active">详情</li>
                                </ol> <!-- end of /.breadcrumb -->

                            </div>
                        </div>
                    </div> <!-- /.container -->
                </div> <!-- /.header-wrapper -->
            </header> <!-- /.page-head (header end) -->
         </div>
            
	 <div id="tag" class="board">
        <div class="boardmenu">
            <div class="title">
                <span>热门标签</span>
            </div>
            <div class="more"><a href="#">所有热门标签</a></div>

            <ul id="nav">
                 
                 <li><span>文学</span>
                     <ul> <li><a href="#">小说</a></li>
                          <li><a href="#">随笔</a></li>
                          <li><a href="#">日本文学</a></li>
                          <li><a href="#">散文</a></li>
                          <li><a href="#">诗歌</a></li>
                          <li><a href="#">童话</a></li>
                          <li><a href="#">名著</a></li>
                          <li><a href="#">港台</a></li>
                          <li><a href="#" class="more" style="color: gray">更多&#8250;&#8250;</a></li>
                    </ul>
                 </li>
                 
                 <li><span>流行</span>
                    <ul>
                       <li><a href="#">漫画</a></li>
                          <li><a href="#">推理</a></li>
                          <li><a href="#">绘本</a></li>
                          <li><a href="#">青春</a></li>
                          <li><a href="#">科幻</a></li>
                          <li><a href="#">言情</a></li>
                          <li><a href="#">奇幻</a></li>
                          <li><a href="#">武侠</a></li>
                          <li><a href="#" class="more" style="color: gray">更多&#8250;&#8250;</a></li>
                    </ul>
                 </li>
                 <li><span>文化</span>
                    <ul>
                       <li><a href="#">历史</a></li>
                          <li><a href="#">哲学</a></li>
                          <li><a href="#">传记</a></li>
                          <li><a href="#">设计</a></li>
                          <li><a href="#">建筑</a></li>
                          <li><a href="#">电影</a></li>
                          <li><a href="#">回忆录</a></li>
                          <li><a href="#">音乐</a></li>
                          <li><a href="#" class="more" style="color: gray">更多&#8250;&#8250;</a></li>
                    </ul>
                 </li>
                 <li><span>生活</span>
                    <ul>
                      <li><a href="#">旅行</a></li>
                          <li><a href="#">励志</a></li>
                          <li><a href="#">教育</a></li>
                          <li><a href="#">职场</a></li>
                          <li><a href="#">美食</a></li>
                          <li><a href="#">灵修</a></li>
                          <li><a href="#">健康</a></li>
                          <li><a href="#">家居</a></li>
                          <li><a href="#" class="more" style="color: gray">更多&#8250;&#8250;</a></li>
                    </ul>
                 </li>
                 <li><span>经管</span>
                    <ul>
                      <li><a href="#">经济学</a></li>
                          <li><a href="#">管理</a></li>
                          <li><a href="#">商业</a></li>
                          <li><a href="#">金融</a></li>
                          <li><a href="#">营销</a></li>
                          <li><a href="#">理财</a></li>
                          <li><a href="#">股票</a></li>
                          <li><a href="#">企业史</a></li>
                          <li><a href="#" class="more" style="color: gray">更多&#8250;&#8250;</a></li>
                    </ul>
                 </li>
                 <li><span>科技</span>
                     <ul>
                      <li><a href="#">科普</a></li>
                          <li><a href="#">互联网</a></li>
                          <li><a href="#">编程</a></li>
                          <li><a href="#">交互设计</a></li>
                          <li><a href="#">算法</a></li>
                          <li><a href="#">通信</a></li>
                          <li><a href="#">神经网络</a></li>
                          <li><a href="#" class="more" style="color: gray">更多&#8250;&#8250;</a></li>
                     </ul>
                 </li>
                </ul>
            

            
        </div>
    </div>
    
    <div id="board1" class="board">
       
        <ul class="recommendwindow">
        
        <%
	        Statement stmt1 = connect.createStatement();
	        ResultSet rs1=stmt1.executeQuery("select * from Book order by book_id desc;");
	      	while(rs1.next() ) {   
	      		Statement stmt2 = connect.createStatement();
	        	ResultSet rs2=stmt2.executeQuery("select * from User where user_id = " + rs1.getInt(2)  +  ";");
	      		rs2.next();  	
	      		
	    %>
        
        
            <li>
                <a href="book_information.jsp?book_id=<%=rs1.getString(1)%>">
                    <img src="sakura.jpg">
                    <span><%=rs1.getString(3) %></span>
                </a>
                <span><%=rs1.getString(5) %></span>
            </li>
            
        <%
        	}
	      	%>
            
        </ul>
        <div class="clear"></div>
        
    </div>
  
  <jsp:include page="PC_foot.jsp" flush="true"/>
  
</body>
</html>