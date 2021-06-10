<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Fetching the details of answers</title>
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
    
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("Select * from Assign where status='answered'");
    
    out.println("<center>");
    out.println("<br><br>");
    out.println("Details of Assignment");
    %>
    
    <form name=assign-update method=get action=update_assign.jsp>
    <br><b>Select Question No:</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <select size= 1 name = "t1">
    
    <% 
    while(rs.next()){
    String f1 =rs.getString(1);
    out.println("<option value = "+f1+">"+f1+"</option>");
    }
    %>
    
    </select><br/><br/>
    <input type=submit value=Update>
    </form>
    
    <% ResultSet rs1 = st.executeQuery("Select * from Assign where status='answered'");
    if(rs1.next() == false)
    {
    out.println("<br/><br/>All assignments are corrected");	
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
<%@ include file="view5.jsp"%><br/><br/>
<a href="action.html">Go to Homepage</a><br/><br/>
<a href="adminsign.html">Logout</a><br/><br/>
</body>
</html>