<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adding suggestions</title>
</head>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<body>

<% 
try
{	
	Context ctx = new InitialContext();
    DataSource ds = (DataSource)ctx.lookup("java:OracleDS");
    Connection con = ds.getConnection();
  
    String sid = request.getParameter("t1");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("Select * from Topic_Suggestions where suggid="+sid+"");
    
    
    out.println("<br><br>");
    
    while(rs.next()){
    out.println("<form name=suggestion-update method=post action=update2.jsp>");
    out.println("<font color=green>Suggestion Id:</font><input type=text name=suggid value='"+rs.getString(1)+"'readonly><br>");
    out.println("<font color=green>Student Id:</font><input type=text name=stid value='"+rs.getString(2)+"'readonly><br>");
    out.println("<font color=green>Course Id:</font><input type=text name=courseid value='"+rs.getString(3)+"'readonly><br>");
    out.println("<font color=green>Topic:</font><input type=text name=topic value='"+rs.getString(4)+"'readonly><br>");
    out.println("<font color=green>Suggestion:</font><textarea rows=10 cols=30 name=suggestion ></textarea><br>");
    out.println("<input type=submit value=Update>");
    out.println("</form>");
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
<br/><br/><a href="suggview.jsp">Go to previous page</a><br/><br/>
<a href="action.html">Go to Homepage</a><br/><br/>
<a href="adminsign.html">Logout</a><br/><br/>
</body>
</html>