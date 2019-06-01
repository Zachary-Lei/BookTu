<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*,java.text.*" errorPage="" %>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>

<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 

<html xmlns="http://www.w3.org/1999/xhtml"><!--<![endif]-->
	<head>

        <title>在线书店</title>

        <!-- meta -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        
        <!-- stylesheets -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/animate.css">
        <link rel="stylesheet" href="assets/css/style.css">
		<link title="style1" rel="stylesheet" href="assets/css/mall_style1.css" type="text/css" />

		
        <!-- scripts -->
        <script type="text/javascript" src="assets/js/modernizr.custom.97074.js"></script>
		<script src="scriptaculous/lib/prototype.js" type="text/javascript"></script>
		<script src="scriptaculous/src/effects.js" type="text/javascript"></script>
		<script type="text/javascript" src="assets/js/mall_validation.js"></script>
		<script type="text/javascript"></script>

    </head>

    <body>
 <%
 if (session.getAttribute("login_id") != null) {
 %>

        <div id="mall-page">
            
			<jsp:include page="head.jsp" flush="true"/>

            <!-- header begin -->
            <header class="page-head">
                <div class="header-wrapper">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">

                                <ol class="breadcrumb">
                                    <li><a href="index.jsp">首页</a></li>
                                    <li><a href="mall.jsp">在线书店</a></li>
                                    <li class="active">我的订单</li>
                                </ol> <!-- end of /.breadcrumb -->

                            </div>
                        </div>
                    </div> <!-- /.container -->
                </div> <!-- /.header-wrapper -->
            </header> <!-- /.page-head (header end) -->

		
            <%@ include file="dbconnect.jsp" %>
			<% request.setCharacterEncoding("UTF-8"); %>
			<%
				Statement stmt = connect.createStatement(); 
							
				String order_id="";
				String commitdate="";
				String totalprice="";
				String reciever="";
				String phone="";
				String message="";
				String country = "";
				String address = "";
							
				String user_id = session.getAttribute("login_id").toString();
				String sql = "select * from order_records where user_id = "+user_id+" order by commitdate desc";
				ResultSet rs=stmt.executeQuery(sql);
				while(rs.next())
				{
					order_id = rs.getString(1);
					commitdate = rs.getString(3);
					totalprice = rs.getString(4);
					reciever = rs.getString(5);
					phone = rs.getString(6);
					message = rs.getString(7);
					country = rs.getString(8);
					address = rs.getString(9);
			%>
								
			<div class="form_content">
			 <fieldset>
		        <legend>订单信息</legend>
		        <div class="form-row">
				<div class="field-label"><label for="field1">订单号</label>:</div>
		            <p><%= order_id%></p>
		        </div>
		        
		        <div class="form-row">
		            <div class="field-label"><label for="field2">成交日期</label>:</div>
		            <p><%= commitdate %></p>
		        </div>
		          
		        <div class="form-row">
		            <div class="field-label"><label for="field3">订单总价</label>:</div>
		            <p><%= totalprice%></p>
		        </div>
		        
		        <div class="form-row">
		            <div class="field-label"><label for="field4">收件人</label>:</div>
		            <p><%= reciever%></p>
		        </div>
		        
		        <div class="form-row">
		            <div class="field-label"><label for="field5">联系方式</label>:</div>
		            <p><%= phone%></p>
		        </div> 
		        
		        <div class="form-row">
		            <div class="field-label"><label for="field6">买家留言</label>:</div>
		            <p><%= message%></p>
		        </div>
		        
		        <div class="form-row">
		            <div class="field-label"><label for="field6">国家</label>:</div>
		            <p><%= country%></p>
		        </div>
		        
		        <div class="form-row">
		            <div class="field-label"><label for="field6">详细地址</label>:</div>
		            <p><%= address%></p>
		        </div>
		    </fieldset> 
		    
            </div> <!-- end of /.main-content -->
		    <%
				}
		    %>
		    </div><!-- form_content -->
		    
<% 
}
%>
            <footer>
                <div class="container">
                    <div class="row">

                        <!-- useful links -->
                        <div class="col-md-3 col-sm-6 col-xs-6 footer-widget">
                            <h4>Useful Links</h4>
                            <ul class="row footer-links">
                                <div class="col-md-6 col-sm-6 col-xs-6">
                                    <li><a href="#">关于我们</a></li>
                                </div>
                            </ul>
                        </div>

                    </div>
                </div>
            </footer>


            <!-- footer-navigation start -->  
            <nav class="hidden-xs hidden-sm navbar footer-nav" role="navigation">
                <div class="container">
                    
                    <div class="navbar-header">
                        
                        <!-- navbar logo -->
                        <div class="navbar-brand">
                            <span class="sr-only">&copy;THEMEWAGON</span>
                            <a href="index.jsp">
                                &copy;THEMEWAGON
                            </a>
                        </div>
                        <!-- navbar logo -->

                    </div><!-- /.navbar-header -->

                    <!-- nav links -->
                    <div class="collapse navbar-collapse" id="main-nav-collapse">
                        <ul class="nav navbar-nav navbar-right text-capitalize">
                            <li><a href="#about">
                                <span>home</span>
                            </a></li>

                            <li><a href="#services">
                                <span>pages</span>
                            </a></li>

                            <li><a href="#mall">
                                <span>features</span>
                            </a></li>

                            <li><a href="#team">
                                <span>mall</span>
                            </a></li>

                            <li><a href="#pricing">
                                <span>blog</span>
                            </a></li>

                            <li><a href="#blog">
                                <span>shop</span>
                            </a></li>

                            <li><a href="#contact">
                                <span>contact</span>
                            </a></li>
                        </ul>
                    </div><!-- nav links -->
                    
                </div><!-- /.container -->
            </nav>
            <!-- footer-navigation end -->
            
        </div> <!-- end of /mall-page -->


        <!--  Necessary scripts  -->

        <script type="text/javascript" src="assets/js/jquery-2.1.3.min.js"></script>
        <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="assets/js/jquery.hoverdir.js"></script>
        <script type="text/javascript" src="assets/js/script.js"></script>

	    <script type="text/javascript">
	        function formCallback(result, form) {
	            window.status = "valiation callback for form '" + form.id + "': result = " + result;
	        }
	        
	        var valid = new Validation('test', {immediate : true, onFormValidate : formCallback});
	        Validation.addAllThese([
	            ['validate-password', '> 6 characters', {
	                minLength : 7,
	                notOneOf : ['password','PASSWORD','1234567','0123456'],
	                notEqualToField : 'field1'
	            }],
	            ['validate-password-confirm', 'please try again.', {
	                equalToField : 'field8'
	            }]
	        ]);
	        
	        $(function() {

                $('.mall-item > .item-image').each( function() { $(this).hoverdir({
                    hoverDelay : 75
                }); } );

            });
	    </script>
        

	</body>
</html>