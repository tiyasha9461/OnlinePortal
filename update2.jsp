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
<title>Insert title here</title>
</head>
<body>
<sql:setDataSource driver="oracle.jdbc.OracleDriver" url="jdbc:oracle:thin:@localhost:1521:XE" user="system" password="abc123" var="ds" scope="session"/>
<fmt:parseNumber var="suggid" type="number" value="${param.suggid}"/>
<fmt:parseNumber var="stid" type="number" value="${param.stid}"/>
<fmt:parseNumber var="courseid" type="number" value="${param.courseid}"/>
<c:set var="topic" value="${param.topic}"/>
<c:set var="suggestion" value="${param.suggestion}"/>
<sql:update var="Topic_Suggestions" dataSource="${ds}">
update Topic_Suggestions set suggestion = ? where suggid = ${suggid}
<sql:param value="${suggestion}"/>
</sql:update>
<% response.sendRedirect("suggest.jsp"); %>
</body>
</html>