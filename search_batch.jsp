<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*,javax.sql.*,javax.naming.*" %>
<%
int id=Integer.parseInt(request.getParameter("t1"));
try
{
Context ctx=new InitialContext();
DataSource ds=(DataSource)ctx.lookup("java:OracleDS");
Connection con=ds.getConnection();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from Batch_Time where STID="+id+"");
while(rs.next())
{
	out.println("<form name=f1 method=post action=update_batch.jsp>");
	out.println("Student ID:<input type=text name=rid value='"+rs.getString(1)+"' readonly><br>");
	out.println("Course ID:<input type=text name=sid value='"+rs.getString(2)+"' readonly><br>");
	out.println("Batch ID:<input type=text name=bid value='"+rs.getString(3)+"' ><br>");
	out.println("Time:<input type=text name=tm  value='"+rs.getString(4)+"' ><br>");
	out.println("<input type=submit value=UpdateBatch>");
	out.println("</form>");
}
ResultSet r=st.executeQuery("select * from Batch_Time where BATCHID IS NULL and BATCHTIME IS NULL");
if(r.next()==false)
{
	out.println("<br>Batch Created Successfully");
}
else
{
out.println("<font color=red>Not a valid Student ID</font>");
}
con.close();
}catch(Exception e)
   {
	out.println(e);
	}
%>
<%@ include file="Batch_disp.jsp" %>
</body>
</html>