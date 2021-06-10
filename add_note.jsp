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
try
{
Context ct=new InitialContext();
DataSource ds=(DataSource)ct.lookup("java:OracleDS");
Connection con=ds.getConnection();

String id = request.getParameter("t1");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from Short_Note where REQUESTID="+id+"");

while(rs.next()){
out.println("<form name=f1 method=post action=update4.jsp>");
out.println("<font color=green>Request ID:</font><input type=text name=rid value='"+rs.getString(1)+"' readonly><br>");
out.println("<font color=green>Student ID:<input type=text name=sid value='"+rs.getString(2)+"' readonly><br>");
out.println("<font color=green>Course ID:<input type=text name=cid value='"+rs.getString(3)+"' readonly><br>");
out.println("<font color=green>Date:</font><input type=text name=date value='"+rs.getString(4)+"' readonly><br>");
out.println("<font color=green>Add Note:</font><textarea rows=10 cols=30 name=note value='"+rs.getString(5)+"'<br></textarea><br>  ");
out.println("<input type=submit value=Update>");
out.println("</form>");
}
con.close();
}
catch(Exception e)
{
	out.println(e);
}
%>
<br/><br/><a href="req_note.jsp">Go to previous page</a><br/><br/>
<a href="action.html">Go to Homepage</a><br/><br/>
<a href="adminsign.html">Logout</a><br/><br/>
</body>
</html>