<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>校园知声</title>
<link rel="stylesheet" media="screen" href="../../res/css/css.css" />
</head>

<body>

<% 
	session.invalidate();
	response.sendRedirect("index.jsp");
%>
  
</body>
</html>
