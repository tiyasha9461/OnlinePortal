<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page import="java.sql.*,javax.sql.*,javax.naming.*" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Answers form</title>
</head>
<body>
<% 
try
{
Context ct=new InitialContext();
DataSource ds=(DataSource)ct.lookup("java:OracleDS");
Connection con=ds.getConnection();

String num=request.getParameter("t1");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from Assign where QUESTNO="+num+"");

while(rs.next()){
out.println("<form name=f1 method=post action=stu_update_assign2.jsp>");
out.println("<font color=green>Question No:</font><input type=text name=qno value='"+rs.getString(1)+"' readonly><br/>");
out.println("<font color=green>Course ID:</font><input type=text name=cid value='"+rs.getString(2)+"' readonly><br/>");
out.println("<font color=green>Question:</font><input type=text name=ques value='"+rs.getString(3)+"' readonly><br/>");
out.println("<font color=green>Student ID:</font><input type=text name=sid value='"+rs.getString(4)+"' readonly><br/>");
out.println("<font color=green>Correct Answer:</font><input type=text name=ans value='"+rs.getString(5)+"'><br/>");
out.println("<font color=green>Status:</font><select size= 1 name = sta>");
out.println("<option value = unanswered> unanswered </option>");
out.println("<option value = answered> answered </option>");
out.println("<option value = corrected> corrected </option>");
out.println("</select><br/><br/>");
out.println("<input type=submit value=Update>");
out.println("</form>");
}
con.close();
}catch(Exception e)
{
	out.println(e);
}
%>
<a href="stu_assign.html">Go to Form</a><br/><br/>
<a href="stu_Welcome.html">Go to Homepage</a><br/><br/>
<h3><a href="stu_LOGIN1.html">Logout </a></h3><br/><br/>
</body>
</html>