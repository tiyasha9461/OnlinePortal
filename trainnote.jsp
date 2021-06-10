<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insertion of Training Notes</title>
</head>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*" %>
<body>
<%
try
{
	 response.setContentType("text/html");	
    int courseid = Integer.parseInt(request.getParameter("course"));
    String trainnote = request.getParameter("note");
    
    Context ctx = new InitialContext();
    DataSource ds = (DataSource)ctx.lookup("java:OracleDS");
    Connection con = ds.getConnection();

    
    PreparedStatement ps = con.prepareStatement("insert into Train_Note(courseid,trainnote) values(?,?)");
    ps.setInt(1, courseid);
    ps.setString(2,trainnote);
    
    ps.executeUpdate();	     
    ps.close();}
	catch(NamingException e){
	out.println(e);	
	}
	catch(Exception s){
	out.println(s);	
	}		 %>

<%@ include file="view6.jsp" %>
<a href="train.html">Go to previous page</a><br/><br/>
<a href="action.html">Go to Homepage</a><br/><br/>
<a href="adminsign.html">Logout</a><br/><br/>
</body>
</html>