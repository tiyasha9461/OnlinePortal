<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show short note</title>
</head>
<body>
<%@ page import="java.sql.*,javax.sql.*,javax.naming.*" %>
<% 
int id=Integer.parseInt(request.getParameter("req"));
try
{
Context ct=new InitialContext();
DataSource ds=(DataSource)ct.lookup("java:OracleDS");
Connection con=ds.getConnection();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from Short_Note where Requestid="+id+"");
out.println("<br><br>");
out.println("<center>");
if(rs.next()){
out.println("Details of Answers");
out.println("<table border=2>");
out.println("<tr>");
out.println("<td>"+"REQUESTID"+"</td>");
out.println("<td>"+"STID"+"</td>");
out.println("<td>"+"COURSEID"+"</td>");
out.println("<td>"+"CDATE"+"</td>");
out.println("<td>"+"SUBNOTE"+"</td>");
out.println("<tr>");
out.println("<tr>");
out.println("<td>"+rs.getString(1)+"</td>");
out.println("<td>"+rs.getString(2)+"</td>");
out.println("<td>"+rs.getString(3)+"</td>");
out.println("<td>"+rs.getString(4)+"</td>");
out.println("<td>"+rs.getString(5)+"</td>");
out.println("<tr>");
out.println("</table>");
}
con.close();
}catch(Exception e)
{
	out.println(e);
}
%>
<br/><br/><a href="stu_fetch4.html">Go to previous page</a><br/><br/>
<a href="stu_Welcome.html">Go to Homepage</a><br/><br/>
<h3><a href="stu_LOGIN1.html">Logout </a></h3><br/><br/>
</body>
</html>