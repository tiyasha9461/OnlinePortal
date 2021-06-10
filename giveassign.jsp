<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insertion of Assignments</title>
</head>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*" %>
<body>
<%
try
{
	 response.setContentType("text/html");	
    int courseid = Integer.parseInt(request.getParameter("course"));
    String question = request.getParameter("question");
    int stid = Integer.parseInt(request.getParameter("st"));
    
    Context ctx = new InitialContext();
    DataSource ds = (DataSource)ctx.lookup("java:OracleDS");
    Connection con = ds.getConnection();
    
    Statement st = con.createStatement();
    ResultSet rs1 = st.executeQuery("Select * from Assign");
  
    int count = 0;
    while(rs1.next()){
     count = count+1;
	  }
    int uid = count+1;
    
    PreparedStatement ps = con.prepareStatement("insert into Assign(questno,courseid,question,stid,status) values(?,?,?,?,?)");
    ps.setInt(1, uid);
    ps.setInt(2, courseid);
    ps.setString(3,question);
    ps.setInt(4, stid);
    ps.setString(5, "unanswered");
    
    ps.executeUpdate();	     
    ps.close();}
	catch(NamingException e){
	out.println(e);	
	}
	catch(Exception s){
	out.println(s);	
	}		 %>

<%@ include file="view5.jsp" %>
<br/><br/><a href="giveassign.html">Go to previous page</a><br/><br/>
<a href="action.html">Go to Homepage</a><br/><br/>
<a href="adminsign.html">Logout</a><br/><br/>
</body>
</html>