<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath }"></c:set>
<spring:url var="css" value="/resources/css"></spring:url>
<spring:url var="js" value="/resources/js"></spring:url>
<spring:url var="images" value="/resources/images"></spring:url>
<!DOCTYPE html>
<html>
<head>
<link href="${css}/style.css" rel="stylesheet">
<meta charset="ISO-8859-1">
<title>Go to Profile</title>

</head>
<body>
<main><section class="emp_reg">

<form action="${contextRoot}/profile_page" method="get">



<input type="submit" value="My Profile" style="background: black;color: white;height: 40px;margin-left: 40%;margin-top: 13%;width: 150px;">
</form>
<form action="${contextRoot}" method="get">



<input type="submit" value="HOME" style="background: black;color: white;height: 40px;margin-left: 40%;margin-top: 10%;width: 150px;">
</form>
</section></main>
</body>
</html>