<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration data insertion page</title>
</head>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*" %>
<body>
<%
try
{
	 response.setContentType("text/html");	
    
    String STNAME = request.getParameter("name");
    String PASSWORD = request.getParameter("pass");
    String DOB = request.getParameter("dob");
    String ADDRESS = request.getParameter("address");
    int MOBNO = Integer.parseInt(request.getParameter("mobno"));
    String EMAIL = request.getParameter("email");
    int COURSEID = Integer.parseInt(request.getParameter("course"));
   Context ctx = new InitialContext();
    DataSource ds = (DataSource)ctx.lookup("java:OracleDS");
    Connection con = ds.getConnection();
    
    Statement st = con.createStatement();
    ResultSet rs1 = st.executeQuery("Select * from Student_Info");
  
    int count = 0;
    while(rs1.next()){
     count = count+1;
	  }
    int STID = count+1;
    
    PreparedStatement ps = con.prepareStatement("insert into Student_Info values(?,?,?,?,?,?,?,?,?)");
    ps.setInt(1, STID);
    ps.setString(2, STNAME);
    ps.setString(3,PASSWORD);
    ps.setString(4,DOB);
    ps.setString(5,ADDRESS);
    ps.setInt(6,MOBNO);
    ps.setString(7,EMAIL);
    ps.setInt(8,COURSEID);
    ps.setString(9, "active");
	 out.println("Your Student ID is:"+STID);
	 ps.executeUpdate();	     
	 ps.close();
	      
	     PreparedStatement ps1=con.prepareStatement("insert into Batch_Time(STID,COURSEID)values(?,?)");
	     ps1.setInt(1,STID);      
	      ps1.setInt(2,COURSEID);
	         
	 	     ps1.executeUpdate();	     
	 	     ps1.close();
		}
		catch(NamingException e){
		out.println(e);	
		}
		catch(Exception s){
		out.println(s);	
		}		
		
		 %>

		<br/><br/><a href="stu_LOGIN1.html">Go to Login page</a><br/><br/>
        <a href="stu_registration.html">Go to Registration Page</a><br/><br/>
		 </body>
		 </html>  	  	    
