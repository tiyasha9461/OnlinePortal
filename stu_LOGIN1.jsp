<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login validation page</title>
</head>
<body>
<%
try
{
 String STID = request.getParameter("id");
 String PASSWORD = request.getParameter("pass");
 String CONPASS = request.getParameter("cpass");
 
 Context ctx = new InitialContext();
 DataSource ds = (DataSource)ctx.lookup("java:OracleDS");
 Connection con = ds.getConnection();
 
 Statement st = con.createStatement();
 ResultSet rs = st.executeQuery("Select * from Student_Info where stid ="+STID+" and password= '"+PASSWORD+"'");

 
 if(rs.next())
 {	 
	 if(PASSWORD.equals(CONPASS))
	 {
		response.sendRedirect("stu_Welcome.html");
	 }
	 else
	 {
		 out.println("<b>Password and confirm password do not match</b><br><br>");
		 out.println("<a href='stu_LOGIN1.html'>Go to Login page</a>");
		 
	 }	
 }	 
 else
 {
%>
    
     <b>Record not found. Incorrect Student ID or/and password</b><br><br>
	 <a href = "stu_LOGIN1.html">Click Here to go to login page</a>
<%
}
 con.close();
}
catch(Exception e){out.println(e);} 
%>
</body>
</html>