<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>留言处理中</title>
</head>
<body>

	<%@ include file="dbconnect.jsp"%> 
	<% request.setCharacterEncoding("UTF-8"); %>
	<% 
		//new order
		String price = request.getParameter("price");
		String order_id = request.getParameter("order");
		String nowtime = request.getParameter("commit");
		
		String reciever = request.getParameter("field9");
		String phone = request.getParameter("field10");
		String message = request.getParameter("field11");
		String country = request.getParameter("field12");
		String address = request.getParameter("field13");

		boolean cond1 =  (order_id != "" && order_id != null) && (price != "" && price != null) && (nowtime != "" && nowtime != null);
		boolean cond2 = (reciever!="" && reciever!=null) && (phone != "" && phone != null) && (message != "" && message != null);
		boolean cond3 = (country != "" && country!= null) && (address != "" && address!= null);
		
		if(cond1 && cond2 && cond3)
		{
			try{
				String sql="insert into order_records(order_id,user_id,commitdate,totalprice,reciever,phone,message,country,rec_address) values(?,?,?,?,?,?,?,?,?)";
				PreparedStatement pstmt=connect.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(order_id));
				pstmt.setInt(2, Integer.parseInt(session.getAttribute("login_id").toString()));
				pstmt.setString(3, nowtime);
				pstmt.setInt(4, Integer.parseInt(price));
				pstmt.setString(5, reciever);
				pstmt.setString(6, phone);
				pstmt.setString(7, message);
				pstmt.setString(8, country);
				pstmt.setString(9, address);
			    pstmt.executeUpdate();

			    %>
			    <script type="text/javascript">
			    	window.location.replace("mall_myordes.jsp");
			    </script><%
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		connect.close();
		%>
		

	<script type="text/javascript">
    	window.location.replace("mall_myorders.jsp");
    </script>
		


</body>
</html>
