<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ page import="java.sql.*,javax.sql.*,javax.naming.*" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int no=Integer.parseInt(request.getParameter("qno"));
String ans=request.getParameter("ans");
String st=request.getParameter("sta");
try
{
Context ctx=new InitialContext();
DataSource ds=(DataSource)ctx.lookup("java:OracleDS");
Connection con=ds.getConnection();
PreparedStatement ps=con.prepareStatement("UPDATE Assign SET answer=?,status=? WHERE QUESTNO=?");
ps.setString(1,ans);
ps.setString(2,st);
ps.setInt(3,no);
ps.executeUpdate();
ps.close();
con.close();
}
catch(Exception s)
{
 out.println(s);
}
%>
<% response.sendRedirect("update_assign.jsp"); %>
</body>
</html>