<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insertion of Assignment</title>
</head>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*" %>
<body>
<%
try
{
	 response.setContentType("text/html");	
	 int STID = Integer.parseInt(request.getParameter("st"));
    int COURSEID = Integer.parseInt(request.getParameter("course"));
    String ANSWER = request.getParameter("ans");
    
    Context ctx = new InitialContext();
    DataSource ds = (DataSource)ctx.lookup("java:OracleDS");
    Connection con = ds.getConnection();
    
    Statement st = con.createStatement();
    ResultSet rs1 = st.executeQuery("Select * from ASSIGN");
  
    int count = 0;
    while(rs1.next()){
     count = count+1;
	  }
    int QUESTNO= count+1;
    
    PreparedStatement ps = con.prepareStatement("insert into ASSIGN(QUESTNO,COURSEID,STID,ANSWER,STATUS) values(?,?,?,?,?)");
    ps.setInt(1, QUESTNO);
    ps.setInt(2,COURSEID);
    ps.setInt(3,STID);
    ps.setString(4,ANSWER);
    ps.setString(5, "Answered");
    ps.executeUpdate();	     
    ps.close();
    out.println("Your Request ID is:"+QUESTNO);}
	catch(NamingException e){
	out.println(e);	
	}
	catch(Exception s){
	out.println(s);	
	}		 %>

<br/><br/><a href="stu_giveanswers.html">Go to previous page</a><br/><br/>
<a href="stu_Welcome.html">Go to Homepage</a><br/><br/>
<h3><a href="stu_LOGIN1.html">Logout </a></h3><br/><br/>
</body>
</html>