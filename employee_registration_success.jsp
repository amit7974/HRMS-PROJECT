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
<meta charset="ISO-8859-1">
<title>Registration Success</title>

<!-- Bootstrap JS Requirements -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="${css}/style.css" rel="stylesheet">
</head>
<body>
<main>
<section class="emp_reg"><br>
<h3 style="margin-left: 20px;'">Your Registration is Successful. Wait for admin to approve.</h3>
<br>
<button onclick="location.href='${contextRoot}/'"
						class="registerbtn" style="margin-left: 25px;" type="button">Home</button>

</section>

</main>
</body>
</html>