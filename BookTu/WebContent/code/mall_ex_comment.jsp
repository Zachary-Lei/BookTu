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
		String isbn = request.getParameter("isbn");
		String score = request.getParameter("score");
		String comment = request.getParameter("comment");
		
		int id = 0;
		double avgscore = 0.0;
		
		Statement stmt = connect.createStatement(); 
		ResultSet rs2=stmt.executeQuery("select count(*) from Saleable_comments");
		while(rs2.next())
		{
			id = Integer.parseInt(rs2.getString(1))+1;
		}
		boolean cond1 =  (isbn != "" && isbn != null) && (score != "" && score != null) && (comment != "" && comment != null);
		
		if(cond1)
		{
			try{
				String sql="insert into Saleable_comments(id,isbn,user_id,score,comments) values(?,?,?,?,?)";
				PreparedStatement pstmt=connect.prepareStatement(sql);
				pstmt.setInt(1, id);
				pstmt.setString(2, isbn);
				pstmt.setInt(3, Integer.parseInt(session.getAttribute("login_id").toString()));
				pstmt.setInt(4, Integer.parseInt(score));
				pstmt.setString(5, comment);
			    pstmt.executeUpdate();
			    

			    //update avgscore in saleable_books
			    String sql2="SELECT AVG(score) from Saleable_comments where isbn = "+isbn;
			    ResultSet res=stmt.executeQuery(sql2);
			    while(res.next())
				{
					avgscore = Double.valueOf(res.getString(1));
				}

			    String sql3="UPDATE Saleable_Books SET score="+avgscore+" where isbn = '"+isbn+"'";
				PreparedStatement pstmt2=connect.prepareStatement(sql3);
			    pstmt2.executeUpdate();

			    %>
			    <script type="text/javascript">
			    	window.location.replace("mall_myorders.jsp");
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
