<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ page import="java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update batch details</title>
</head>
<body>
<sql:setDataSource driver="oracle.jdbc.OracleDriver" url="jdbc:oracle:thin:@localhost:1521:XE" user="system" password="abc123" var="ds" scope="session"/>
<fmt:parseNumber var="stid" type="number" value="${param.stid}"/>
<fmt:parseNumber var="courseid" type="number" value="${param.courseid}"/>
<fmt:parseNumber var="batchid" type="number" value="${param.batchid}"/>
<c:set var="batchtime" value="${param.batchtime}"/>
<sql:update var="Batch_Time" dataSource="${ds}">
update Batch_Time set batchid = ? where stid = ${stid} and courseid = ${courseid}  
<sql:param value="${batchid}"/>
</sql:update>
<sql:update var="Batch_Time" dataSource="${ds}">
update Batch_Time set batchtime = ? where stid = ${stid} and courseid = ${courseid}
<sql:param value="${batchtime}"/>
</sql:update>
<% response.sendRedirect("batch.jsp"); %>
</body>
</html>