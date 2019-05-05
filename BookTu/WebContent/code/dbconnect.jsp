<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BookTu</title>
</head>
<body>
  <%Class.forName("com.mysql.cj.jdbc.Driver"); %>
  <%!		
  	
	String url="jdbc:mysql://localhost:3306/booktu?serverTimezone=GMT%2B8";
	String user="root";
	String pwd="123456";
	Connection connect;
	%>
	<%connect=DriverManager.getConnection(url,user,pwd); %>
	
	
</body>
</html>