<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insertion of Short Note</title>
</head>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*" %>
<body>
<%
try
{
	 response.setContentType("text/html");	
    int courseid = Integer.parseInt(request.getParameter("course"));
    String cdate = request.getParameter("date");
    int stid = Integer.parseInt(request.getParameter("st"));
    
    Context ctx = new InitialContext();
    DataSource ds = (DataSource)ctx.lookup("java:OracleDS");
    Connection con = ds.getConnection();
    
    Statement st = con.createStatement();
    ResultSet rs1 = st.executeQuery("Select * from Short_Note");
  
    int count = 0;
    while(rs1.next()){
     count = count+1;
	  }
    int rid = count+1;
    
    PreparedStatement ps = con.prepareStatement("insert into Short_Note(requestid,stid,courseid,cdate) values(?,?,?,?)");
    ps.setInt(1, rid);
    ps.setInt(2, stid);
    ps.setInt(3,courseid);
    ps.setString(4, cdate);
    
    ps.executeUpdate();	     
    ps.close();
    out.println("Your requestid is:"+rid);}
	catch(NamingException e){
	out.println(e);	
	}
	catch(Exception s){
	out.println(s);	
	}		 %>

<br/><br/><a href="stu_giveassign.html">Go to previous page</a><br/><br/>
<a href="stu_Welcome.html">Go to Homepage</a><br/><br/>
<h3><a href="stu_LOGIN1.html">Logout </a></h3><br/><br/>
</body>
</html>