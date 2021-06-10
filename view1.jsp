<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ page import="java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Record</title>
</head>
<body>
<center>
<h4><font color=blue>Display All Records of Registered Students</font></h4>
<sql:setDataSource driver="oracle.jdbc.OracleDriver" url="jdbc:oracle:thin:@localhost:1521:XE" user="system" password="abc123" var="ds" scope="session"/>
<sql:query var="stu" dataSource="${ds}">
select stid,stname,password,dob,address,mobno,email,courseid,ststatus from Student_Info
</sql:query>
<table border="2" bgcolor="pink" cellspacing="5">
<tr>
<th>stid</th>
<th>stname</th>
<th>password</th>
<th>dob</th>
<th>address</th>
<th>mobno</th>
<th>email</th>
<th>courseid</th>
<th>ststatus</th>
</tr>
<c:forEach var="row" items="${stu.rows}">
<tr>
<td><c:out value="${row.stid}"/></td>
<td><c:out value="${row.stname}"/></td>
<td><c:out value="${row.password}"/></td>
<td><c:out value="${row.dob}"/></td>
<td><c:out value="${row.address}"/></td>
<td><c:out value="${row.mobno}"/></td>
<td><c:out value="${row.email}"/></td>
<td><c:out value="${row.courseid}"/></td>
<td><c:out value="${row.ststatus}"/></td>
</tr>
</c:forEach>
</table>
<br/><br/>
<a href="action.html">Go to Homepage</a><br/><br/>
<a href="adminsign.html">Logout</a><br/><br/>
</center>
</body>
</html>