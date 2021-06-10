<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%@ page import="java.sql.*,javax.sql.*,javax.naming.*" %>
<body>
<%
int id=Integer.parseInt(request.getParameter("rid"));
String nt=request.getParameter("note");
try
{
Context ctx=new InitialContext();
DataSource ds=(DataSource)ctx.lookup("java:OracleDS");
Connection con=ds.getConnection();
PreparedStatement ps=con.prepareStatement("UPDATE Short_Note SET SUBNOTE=? WHERE REQUESTID='"+id+"'");
ps.setString(1,nt);
ps.executeUpdate(); 
ps.close();
con.close();
}
catch(Exception s)
{
 out.println(s);
}
%>
<%response.sendRedirect("add_note.jsp");%>
</body>
</html>