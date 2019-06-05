<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>编辑个人信息</title>
</head>
<body>



	<%@ include file="dbconnect.jsp"%>  
	<% request.setCharacterEncoding("UTF-8"); %>
	<% 
	
		String pw_old=request.getParameter("pw_old");
		String pw_new=request.getParameter("pw_new");
		String pw_confirm=request.getParameter("pw_confirm");
		String nickname=request.getParameter("nickname");
		String intro=request.getParameter("intro");
		
		if(pw_old != "" || pw_old != null)
		{
			
			try{
				String sql1 = "select * from User where user_id = " + session.getAttribute("login_id");
			    Statement stmt1 = connect.createStatement();
		        ResultSet rs1=stmt1.executeQuery(sql1); 
		      	int is_matched = 1;
		      	while(rs1.next()) {
		      		if (pw_old.compareTo(rs1.getString(2)) != 0) {
		      			is_matched = 0;
		      			break;
		      		}
		      	}
			    
				if (is_matched == 0) {
					out.println("原密码错误！");
					%>
				    <script type="text/javascript">
				    	window.location.replace("PC_EditInfo.jsp");
				    </script><%
				}
				else {
					String updation="";
					if(pw_new != null && pw_new != "")
					{
						if(pw_new.compareTo(pw_confirm) == 0)
						{
							updation += "password = \""+pw_new+"\",";
						}
						else
						{
							out.println("两次新密码输入不一致！");
						}
					}
					if(nickname != null && nickname != "")
					{
						session.setAttribute("nickname",nickname);
						updation += "nickname = \""+nickname+"\",";
					}
					if(intro != null && intro != "")
					{
						updation += "introduction = \""+intro+"\",";
					}

					if(updation != "")
					{
						updation = updation.substring(0,updation.length() - 1);
						String sql2="update User set "+updation+"where user_id = " + session.getAttribute("login_id");
						PreparedStatement pstmt=connect.prepareStatement(sql2);
					    pstmt.executeUpdate();
					}
						
				    %>
				
				    <script type="text/javascript">
				    	window.location.replace("PC_PersonalCenter.jsp");
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
