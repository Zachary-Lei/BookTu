<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>校园知声</title>
</head>
<body>



	<%@ include file="dbconnect.jsp"%>  
	<% request.setCharacterEncoding("UTF-8"); %>
	<% 
	
		String user_id=request.getParameter("user_id");
		String nickname=request.getParameter("nickname");
		int user_type= 1;
		String pass=request.getParameter("passwd");
		String cpass=request.getParameter("cpasswd");
		
		if(user_id!=null && user_id != "" && pass != null && pass != "")
		{
			
			try{
				String sql1 = "select * from User where user_id = " + user_id;
			    Statement stmt1 = connect.createStatement();
		        ResultSet rs1=stmt1.executeQuery(sql1); 
		      	int is_exist = 0;
		      	while(rs1.next()) {
		      		if (rs1.getInt(1) == Integer.parseInt(user_id) ) {
		      			is_exist = 1;
		      			break;
		      		}
		      	}
			    
				if (is_exist == 1 || pass.compareTo(cpass) != 0) {
					%>
				    <script type="text/javascript">
				    	window.location.replace("register.jsp");
				    </script><%
				}
				else {
					String sql2="insert into user(user_id,password,nickname,avatar,score,introduction,user_type) values(?,?,?,?,?,?,?)";
					PreparedStatement pstmt=connect.prepareStatement(sql2);
					pstmt.setInt(1, Integer.parseInt(user_id));
				    pstmt.setString(2, pass);
				    pstmt.setString(3, nickname);
				    pstmt.setString(4,"");
				    pstmt.setInt(5, 0);
				    pstmt.setString(6, "");
				    pstmt.setInt(7, 1);
				    pstmt.executeUpdate();
				    %>
				
				    <script type="text/javascript">
				    	window.location.replace("login.jsp");
				    </script><%
				}
				
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		connect.close();
	%>



</body>
</html>
