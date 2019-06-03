<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>书籍管理</title>
</head>
<body>



	<%@ include file="dbconnect.jsp"%>  
	<% request.setCharacterEncoding("UTF-8"); %>
	<% 
		//delete book
		String cid = request.getParameter("book_id");
		if(cid != "" && cid != null)
		{
			try{
				String sql1="delete from Book where book_id = "+cid;
				PreparedStatement pstmt=connect.prepareStatement(sql1);
			    pstmt.executeUpdate();
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		connect.close();
	%>
	<script type="text/javascript">
    	window.location.replace("PC_BookManagement.jsp");
    </script>


</body>
</html>
