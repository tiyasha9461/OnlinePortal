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
<h4><font color=blue>Display All Records of Assignment</font></h4>
<sql:setDataSource driver="oracle.jdbc.OracleDriver" url="jdbc:oracle:thin:@localhost:1521:XE" user="system" password="abc123" var="ds" scope="session"/>
<sql:query var="asg" dataSource="${ds}">
select * from Assign
</sql:query>
<table border="2" bgcolor="pink" cellspacing="5">
<tr>
<th>Question No</th>
<th>Course ID</th>
<th>Question</th>
<th>Student ID</th>
<th>Answer</th>
<th>Status</th>
</tr>
<c:forEach var="row" items="${asg.rows}">
<tr>
<td><c:out value="${row.QUESTNO}"/></td>
<td><c:out value="${row.COURSEID}"/></td>
<td><c:out value="${row.QUESTION}"/></td>
<td><c:out value="${row.STID}"/></td>
<td><c:out value="${row.ANSWER}"/></td>
<td><c:out value="${row.STATUS}"/></td>
</tr>
</c:forEach>
</table>
<br/><br/>
</body>
</html>