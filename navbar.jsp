<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

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
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background: #009688!important;">
  <a class="navbar-brand" href="${contextRoot}/">Ursag</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav ml-auto text-uppercase">
      <li class="nav-item active">
        <a class="nav-link" href="${contextRoot}/">Home <span class="sr-only">(current)</span></a>
      </li>
      <security:authorize access="hasAuthority('USER')">
       <li class="nav-item active">
        <a class="nav-link" href="${contextRoot}/verify">${user_login_info.first_name} ${user_login_info.last_name} <span class="sr-only">(current)</span></a>
      </li>
      </security:authorize>
       <security:authorize access="hasAuthority('EMPLOYEE')">
       <li class="nav-item active">
        <a class="nav-link" href="${contextRoot}/employee_profile">${user_login_info.first_name} ${user_login_info.last_name} <span class="sr-only">(current)</span></a>
      </li>
      </security:authorize>
       <security:authorize access="hasAuthority('ADMIN')">
       <li class="nav-item active">
        <a class="nav-link" href="${contextRoot}/employee_profile">${user_login_info.first_name} ${user_login_info.last_name} <span class="sr-only">(current)</span></a>
      </li>
      </security:authorize>
      <security:authorize access="isAnonymous()">
       <li class="nav-item active">
        <a class="nav-link" href="${contextRoot}/login">Login <span class="sr-only">(current)</span></a>
      </li>
       <li class="nav-item active">
        <a class="nav-link" href="${contextRoot}/register">Signup <span class="sr-only">(current)</span></a>
      </li>
      </security:authorize>
       <security:authorize access="isAuthenticated()">
       <li class="nav-item active">
        <a class="nav-link" href="http://localhost:8080/Project/perform-logout">Logout <span class="sr-only">(current)</span></a>
      </li>
      </security:authorize>
    </ul>
  </div>
</nav>
</body>
</html>