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
<title>Update short note details</title>
</head>
<body>
<sql:setDataSource driver="oracle.jdbc.OracleDriver" url="jdbc:oracle:thin:@localhost:1521:XE" user="system" password="abc123" var="ds" scope="session"/>
<fmt:parseNumber var="rid" type="number" value="${param.rid}"/>
<c:set var="note" value="${param.note}"/>
<sql:update var="Short_Note" dataSource="${ds}">
update Short_Note set subnote = ? where requestid = ${rid}  
<sql:param value="${note}"/>
</sql:update>
<% response.sendRedirect("add_note.jsp"); %>
</body>
</html>