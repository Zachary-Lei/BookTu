<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
            <!-- site-navigation start -->  
            <nav id="mainNavigation" class="navbar navbar-dafault main-navigation" role="navigation">
                <div class="container">
                    
                    <div class="navbar-header">
                        
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#main-nav-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        
                        <!-- navbar logo -->
                        <div class="navbar-brand">
                            <span class="sr-only">Avada Pro Agency</span>
                            <a href="index.jsp">
                                <img src="assets/img/main_logo.png" class="img-responsive center-block" alt="logo">
                            </a>
                        </div>
                        <!-- navbar logo -->

                    </div><!-- /.navbar-header -->

                    <!-- nav links -->
                    <div class="collapse navbar-collapse" id="main-nav-collapse">
                        <ul class="nav navbar-nav navbar-left text-uppercase">
                            <li>
                                <a href="index.jsp"><span>主页</span></a>
                            </li>

                           <% if (session.getAttribute("login_id") != null) { %>

                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span>书籍推荐</span></a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a href="service.html">新书速览</a>
                                    </li>
                                    <li>
                                        <a href="service.html">最受欢迎书籍</a>
                                    </li>
                                    <li>
                                        <a href="portfolio.html">....</a>
                                    </li>
                                    <li>
                                        <a href="gallery.html">gallery</a>
                                    </li>
                                    <li>
                                        <a href="404.html">404 page</a>
                                    </li>
                                    <li>
                                        <a href="coming_soon.html">coming soon</a>
                                    </li>
                                </ul>  <!-- end of /.dropdown-menu -->
                            </li> <!-- end of /.dropdown -->

                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span>社区</span></a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a href="book_review.jsp">热门书评</a>
                                    </li>
                                    <li>
                                        <a href="...">话题</a>
                                    </li>
                                    <li>
                                        <a href="single_blog_left_sidebar.html">single with left sidebar</a>
                                    </li>
                                    <li>
                                        <a href="single_blog.html">single with right sidebar</a>
                                    </li>
                                    <li>
                                        <a href="single_blog_full_width.html">single full width</a>
                                    </li>
                                </ul> <!-- end of /.dropdown-menu -->
                            </li> <!-- end of /.dropdown -->

                            <li>
                                <a href="contact.html"><span>contact</span></a>
                            </li>
                            
                            <%--<li>
                                <a href="PersonalCenter.jsp"><span>个人中心</span></a>
                            </li> --%>
                            
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span>个人中心</span></a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a href="PC_PersonalCenter.jsp">个人主页</a>
                                    </li>
                                    <li>
                                        <a href="PC_EditInfo.jsp">编辑个人信息</a>
                                    </li>
                                    <li>
                                        <a href="PC_MessageLeft.jsp">留言</a>
                                    </li>
                                    <li>
                                        <a href="PC_MyFavourite.jsp">我的收藏</a>
                                    </li>
                                </ul> <!-- end of /.dropdown-menu -->
                            </li> <!-- end of /.dropdown -->
                           
                           
                      </ul>
                      <ul class="nav navbar-nav navbar-right text-uppercase">
                            
                            <li class="dropdown"  >	
                              <a href="PC_PersonalCenter.jsp" role="button" >			
                                <span>
                                   用户 ： <%=session.getAttribute("login_id")%> 	
                                </span>      
                              </a>	
                            </li>       

                            <li class="nav navbar-nav navbar-right text-uppercase" >
                                   <a href="logout.jsp"  role="button">注销</a>
                            </li>
                            
                
                           <%} 
											
		  else { 
                           
                           %>
                                      
                            <li class="dropdown" >
                               <a href="register.jsp"  role="button">注册</a>
                            </li>
                            <li class="dropdown" >
                               <a href="login.jsp"  role="button">登录</a>
                            </li>
                            
                           <%} 
                           
                           %>
                            
                        </ul>
                    </div><!-- nav links -->
                    
                </div><!-- /.container -->
            </nav>
            <!-- site-navigation end -->
</body>
</html>
