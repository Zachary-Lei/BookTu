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
		//delete message
		String mid = request.getParameter("delete_id");
		if(mid != "" && mid != null)
		{
			try{
				String sql1="delete from Message where message_id = "+mid;
				PreparedStatement pstmt=connect.prepareStatement(sql1);
			    pstmt.executeUpdate();
			    %>
			    <script type="text/javascript">
		    		window.location.replace("PC_MessageLeft.jsp");
		    	</script><%
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		//new message
		String title = request.getParameter("title");
		String time = request.getParameter("time");
		String msg=request.getParameter("message");
		
		out.println(title);
		out.println(time);
		out.println(msg);
		
		if((title != "" && title != null)&&(time != "" && time != null)&&(msg != "" && msg != null))
		{
			
			try{
				String sql="insert into Message(user_id,title,time,content) values(?,?,?,?)";
				PreparedStatement pstmt=connect.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(session.getAttribute("login_id").toString()));
				pstmt.setString(2,title);
				pstmt.setString(3,time);
				pstmt.setString(4,msg);
			    pstmt.executeUpdate();
					
			    %>
			
			    <script type="text/javascript">
			    	window.location.replace("PC_MessageLeft.jsp");
			    </script><%
				
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		connect.close();
	%>
	<script type="text/javascript">
    	window.location.replace("PC_MessageLeft.jsp");
    </script>


</body>
</html>
