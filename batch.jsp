<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Fetch and display batch details</title>
</head>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*" %>
<body>
<% 
try
{	
	Context ctx = new InitialContext();
    DataSource ds = (DataSource)ctx.lookup("java:OracleDS");
    Connection con = ds.getConnection();
    
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("Select * from Batch_Time where batchid IS NULL");
    
    out.println("<center>");
    out.println("<br><br>");
    out.println("Details of Unfilled Batch");
    
    while(rs.next()){
    	out.println("<form name=batch-update method=post action=update3.jsp>");
        out.println("<font color=green>Student Id:</font><input type=text name=stid value='"+rs.getString(1)+"'readonly><br>");
        out.println("<font color=green>Course Id:</font><input type=text name=courseid value='"+rs.getString(2)+"'readonly><br>");
        out.println("<font color=green>Batch Id:</font><input type=text name=batchid value='"+rs.getString(3)+"'><br>");
        out.println("<font color=green>Batch Time:</font><input type=text name=batchtime value='"+rs.getString(4)+"'><br>");
        out.println("<input type=submit value=Update>");
        out.println("</form>");
    }
    
    ResultSet rs1 = st.executeQuery("Select * from Batch_Time where batchid IS NULL");
    if(rs1.next() == false)
    {
    out.println("<br/><br/>No unfilled batchid");	
    }
    con.close();
	}
	catch(NamingException e){
	out.println(e);	
	}
	catch(Exception s){
	out.println(s);	
	}		
%>
<%@ include file="view7.jsp" %>
<a href="action.html">Go to Homepage</a><br/><br/>
<a href="adminsign.html">Logout</a><br/><br/>
</body>
</html>