<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<jsp:include page="/WEB-INF/jsp/navbar.jsp"></jsp:include>
<jsp:include page="/WEB-INF/jsp/sidebar.jsp"></jsp:include>
<c:set var="contextRoot" value="${pageContext.request.contextPath }"></c:set>
<spring:url var="css" value="/resources/css"></spring:url>
<spring:url var="js" value="/resources/js"></spring:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="ISO-8859-1">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link href="${css}/home.css" rel="stylesheet">
<link href="${css}/style.css" rel="stylesheet">
<title>Home</title>
</head>
<body>


   
<div class="content2">
<i onclick="toggleSideBar()" class="fas fa-bars barbtn" style="margin-left: 15px;"></i>
<div style="display: flex;margin: auto!important;justify-content: center!important">
 <h3 align="center" style="padding-top: 20%;color: gray;">Welcome!!!<br>Let's get Started</h3>
</div>

</div>

</body>
<script type="text/javascript">

$(document).ready(function(){
	 
    $(".item").removeClass('active');
    $(".home_link").addClass('active');
 
});

</script>
</html>