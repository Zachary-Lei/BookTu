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
                                    <li class="active">在线书店</li>
                                    <li><a href="mall_myorders.jsp">我的订单</a></li>
                                </ol> <!-- end of /.breadcrumb -->

                            </div>
                        </div>
                    </div> <!-- /.container -->
                </div> <!-- /.header-wrapper -->
            </header> <!-- /.page-head (header end) -->

		
            <%@ include file="dbconnect.jsp" %>
			<%
			Statement stmt = connect.createStatement(); 

	    	String isbn = request.getParameter("isbn");
	    	String figure = "assets/img/mall/"+ isbn +".jpg";
	    	String Nowtime="";
	    	
			String bookname="";
			String author="";
			String publishing_house="";
			String price="";
			String introdution="";
			int order_id = 0;
			String str_date1="12";
			
			ResultSet rs=stmt.executeQuery("select * from saleable_books where isbn = "+isbn);
			while(rs.next())
			{
				bookname = rs.getString(2);
				author = rs.getString(3);
				publishing_house = rs.getString(4);
				price = rs.getString(5);
				introdution = rs.getString(6);
			}
			
			ResultSet rs2=stmt.executeQuery("select count(*) from order_records");
			while(rs2.next())
			{
				order_id = Integer.parseInt(rs2.getString(1))+1;
			}
		    %>
		    <% 
				java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				java.util.Date currentTime = new java.util.Date();//得到当前系统时间
				str_date1 = formatter.format(currentTime); //将日期时间格式化 
				String str_date2 = currentTime.toString(); //将Date型日期时间转换成字符串形式 
			%>
		    
		    <div class="form_content">
		    <form id="test" action="mall_ex_ordering.jsp?price=<%=price %>&order=<%=order_id %>&commit=<%=str_date1%>" method="post">
		    
            <fieldset>
		        <legend>商品信息</legend>
            	<img src= <%= figure %> width="300" height="300" class="img-responsive center-block" alt=<%= isbn %>>
		        <div class="form-row">
				<div class="field-label"><label for="field1">书名</label>:</div>
		            <p>
		            	<%= bookname%>
		            </p>
		        </div>
		        
		        <div class="form-row">
		            <div class="field-label"><label for="field2">ISBN</label>:</div>
		            <p>
		            	<%= isbn %>
		            </p>
		        </div>
		          
		        <div class="form-row">
		            <div class="field-label"><label for="field3">作者</label>:</div>
		            <p>
		            	<%= author%>
		            </p>
		        </div>
		        
		        <div class="form-row">
		            <div class="field-label"><label for="field4">出版社</label>:</div>
		            <p>
		            	<%= publishing_house%>
		            </p>
		        </div>
		        
		        <div class="form-row">
		            <div class="field-label"><label for="field5">单价</label>:</div>
		            <p>
		            	<%= price%>
		            </p>
		        </div> 
		        
		        <div class="form-row">
		            <div class="field-label"><label for="field6">简介</label>:</div>
		            <p>
		            	<%= introdution%>
		            </p>
		        </div>
		    </fieldset> 

		    <fieldset>
		        <legend class="optional">订单信息</legend>
		        
		        <div class="form-row">
		            <div class="field-label"><label for="field7">订单号</label>:</div>
		            <p>
		            	<%= order_id%>
		            </p>
		        </div>
		        
		        <div class="form-row">
		            <div class="field-label"><label for="field8">成交时间</label>:</div>
					<p>
						<%= str_date1 %>
					</p>
		        </div>
		    </fieldset>
		    
		    <fieldset>
		        <legend>客户信息</legend>
		        <div class="form-row">
		            <div class="field-label"><label for="field9">收件人</label>:</div>
		            <div class="field-widget"><input name="field9" id="field9" class="required" title="Enter your name" /></div>
		        </div>
		        
		        <div class="form-row">
		            <div class="field-label"><label for="field10">联系方式</label>:</div>
		            <div class="field-widget"><input name="field10" id="field10" class="required" title="Enter your name" /></div>
		        </div>
		        
		        <div class="form-row">
		            <div class="field-label"><label for="field11">买家留言</label>:</div>
		            <div class="field-widget"><textarea name="field11" id="field11" class="required"></textarea></div>
		        </div>
		        
		        <div class="form-row">
		            <div class="field-label"><label for="field12">国家</label>:</div>
		            <div class="field-widget">
		                <select id="field12" name="field12" class="validate-selection" title="Choose your department">
		                	<option>默认</option>
		                    <option>中国</option>
		                    <option>美国</option>
		                    <option>澳大利亚</option>
		                    <option>新加坡</option>
		                </select>
		            </div>
		        </div>
		        
		        <div class="form-row">
		            <div class="field-label"><label for="field13">详细地址(省份/市/区/街道)</label>:</div>
		            <div class="field-widget"><input type="text" name="field13" id="field13" class="required" title="Enter a password greater than 6 characters" /></div>
		        </div>
		    </fieldset>

		    
		    <input type="submit" class="submit" value="提交" />
		    <input class="reset" type="button" value="重置" onclick="javascript:window.location.reload()" />
		    </form>
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
   <%--
   <script type="text/javascript">
            $(function() {

                $('.mall-item > .item-image').each( function() { $(this).hoverdir({
                    hoverDelay : 75
                }); } );

            });
        </script>
    --%>
        

	</body>
</html>