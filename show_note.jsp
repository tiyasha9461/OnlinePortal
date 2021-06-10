<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*,javax.sql.*,javax.naming.*" %>
<%
try
	{
	Context ct=new InitialContext();
	DataSource ds=(DataSource)ct.lookup("java:OracleDS");
	Connection con=ds.getConnection();
	
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from Short_Note");
	%>
	<table border=3 bgcolor=lightyellow><tr><th>Request ID</th><th>Student ID</th><th>Course ID</th><th>Date</th><th>Sub Note</th></tr>
	<% 
	while(rs.next())
	{
		String rid=rs.getString(1);
		String sid=rs.getString(2);
		String cid=rs.getString(3);
		String dt=rs.getString(4);
		String nt=rs.getString(5);
		%>
		<tr>
		<td><%=rid %></td>
		<td><%=sid %></td>
		<td><%=cid %></td>
		<td><%=dt %></td>
		<td><%=nt %></td></tr>
		<%
	}
	%>
	</table>
	<% 
}catch(NamingException n)
{
	out.println(n);
}
catch(Exception e)
{
	out.println(e);
}
%>
</body>
</html>