<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ page import="java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>
<h4><font color=blue>Display of Training Notes</font></h4>
<sql:setDataSource driver="oracle.jdbc.OracleDriver" url="jdbc:oracle:thin:@localhost:1521:XE" user="system" password="abc123" var="ds" scope="session"/>
<sql:query var="stu" dataSource="${ds}">
select courseid,trainnote from Train_Note
</sql:query>
<table border="2" bgcolor="pink" cellspacing="5">
<tr>
<th>courseid</th>
<th>train note</th>
</tr>
<c:forEach var="row" items="${stu.rows}">
<tr>
<td><c:out value="${row.courseid}"/></td>
<td><c:out value="${row.trainnote}"/></td>
</tr>
</c:forEach>
</table>
</center>
<br/><br/>
</body>
</html>