<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page language="java" import="java.sql.*,com.jspsmart.upload.*,java.io.File" %>

<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %> 

<jsp:useBean id="mySmartUpload" scope="page" class="com.jspsmart.upload.SmartUpload" />


<HTML>

<%request.setCharacterEncoding("utf-8"); %>

<BODY BGCOLOR="white">


	<%@ include file="dbconnect.jsp"%>
	<% String netid10 = session.getAttribute("login_id").toString(); %>
	<% 
		//文本处理
		// Initialization
		mySmartUpload.initialize(pageContext);
		mySmartUpload.setCharset("utf-8");
		// Upload
		mySmartUpload.setMaxFileSize(1024*1024*10);//10M
		mySmartUpload.upload();
		String uploadPath = getServletContext().getRealPath("/") + File.separator + "/uploadfile";
		File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
		mySmartUpload.save(uploadPath);
		//SmartFile file=mySmartUpload.getFiles().getFile(0);
		//file.saveAs("/upload/1.jpg",SmartUpload.SAVE_VIRTUAL);
		
		String resource_name=mySmartUpload.getRequest().getParameter("material_name");
		String comment=mySmartUpload.getRequest().getParameter("comment");
		int user_id=Integer.parseInt(netid10);


        Statement stm=connect.createStatement();
        String sqlq="select * from Resources order by resource_id desc limit 1;";
        ResultSet rs=stm.executeQuery(sqlq);
        int resource_id=1;
        if(rs.next())
        {
            resource_id=rs.getInt(1)+1;
        }


        String sql="insert into Resources(resource_id,user_id,resource_name,description,time) values(?,?,?,?,?)";
        PreparedStatement pstmt=connect.prepareStatement(sql);
        pstmt.setInt(1, resource_id);
        pstmt.setInt(2, user_id);
        pstmt.setString(3, resource_name);
        pstmt.setString(4, comment);
        
        java.util.Date d = new java.util.Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String now = df.format(d);
		
		pstmt.setString(5,now);
        
        pstmt.executeUpdate();

        //文件处理
        // Variables
        int count=0;
        
        // SQL Request
        Statement stmt = connect.createStatement(ResultSet.TYPE_FORWARD_ONLY ,ResultSet.CONCUR_UPDATABLE);
        ResultSet rs_query = stmt.executeQuery("SELECT * FROM Resources order by resource_id desc limit 1");

        // if the resultset is not null
        if (rs_query.next())
        {
            // upload file in the DB if this file is not missing
            if (!mySmartUpload.getFiles().getFile(0).isMissing())
            {
                try {
                    rs_query.updateString("filename", mySmartUpload.getFiles().getFile(0).getFileName());                  
                    // Update
                    rs_query.updateRow(); 
                
                } catch(Exception e) {
                    out.println("An error occurs : " + e.toString()); 
                } 
            }  
        }
        rs.close();
        rs_query.close();
        pstmt.close();
        stmt.close();
        connect.close();
		
		 
		
		
		    %>
 	   <script type="text/javascript">
            window.location.replace("resource_browse.jsp");
       </script>


</BODY>
</HTML>
