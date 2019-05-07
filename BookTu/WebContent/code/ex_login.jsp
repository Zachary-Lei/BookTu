<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>校园知声</title>
</head>
<body>



	<%@ include file="dbconnect.jsp"%>  
	<% 
		String user_id=request.getParameter("user_id");
		String pass=request.getParameter("passwd");
		if(user_id!=null && user_id != "" && pass != null && pass != "")
		{
			String sql1 = "select * from User where user_id = " + user_id;
			
			
			try{
			    Statement stmt1 = connect.createStatement();
		        ResultSet rs1=stmt1.executeQuery(sql1); 
		      	rs1.next(); 
			    
				String pass1 = rs1.getString(2);
				out.print(pass1);	
				if (pass.compareTo(pass1) == 0) {
					session.setAttribute("login_id",user_id);
					%>
				    <script type="text/javascript">
				    	window.location.replace("index.jsp");
				    </script><%
				}
				
				%>
			    <script type="text/javascript">
			    	window.location.replace("login.jsp");
			    </script><%
				
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		connect.close();
		
	%>



</body>
</html>
