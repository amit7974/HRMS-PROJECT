<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath }"></c:set>
<spring:url var="css" value="/resources/css"></spring:url>
<spring:url var="js" value="/resources/js"></spring:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile</title>
<!-- Bootstrap JS Requirements -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link href="${css}/style.css" rel="stylesheet">
</head>
<body>
<main>
<div style="height: 60px;position: absolute;top: 20px;right: 40px;display: inline-flex;">
  <form action="${contextRoot}/" method="get">
  <button type="submit" class="btn btn-light" style="margin-right: 15px;">Home</button>
  </form>
  <security:authorize access="isAuthenticated()">
  <form action="${contextRoot}/perform-logout" method="get">
  <button type="submit" class="btn btn-light">Logout</button>
  </form>
  </security:authorize>
   </div>
   
<br>
<section class="tblbck" style="margin-top: 70px;">
<br>
<h3 align="center">Profile</h3>
<table class="table table-striped table-sm" style="width:100%;">
<thead><tr><th scope="col">
<img id="ItemPreview" src="data:image/png;base64, ${employee_profile.base64Image}"  height="100" width="100" style="position: absolute;left: 310px;top:110px;">
<br><br><br>
<p><b>Basic Information</b>


</p>Field Name</th>
</tr></thead><tbody><tr>
<th scope="row">Name:</th>
<td>${employee_profile.first_name} ${employee_profile.last_name}</td>
</tr>
<tr><th scope="row"style="width:40%;">Email:</th>
<td>${employee_profile.user_name}</td></tr>
<tr><th scope="row">Phone:</th>
<td>${employee_profile.phone}</td></tr>
<tr><th scope="row">Gender:</th>
<td>${employee_profile.gender}</td></tr>
<tr><th scope="row">Date of Birth</th>
<td>${employee_profile.dob}</td></tr>
<tr><th scope="col"><h4 style="margin-top:10px;margin-bottom:2px;">Address</h4></th></tr>
<tr><th scope="row">CurrentAddress</th></tr>
<tr><th scope="row">Address:</th>
<td>${employee_profile.address_line_1}${employee_profile.address_line_2},${employee_profile.city_name},${employee_profile.state_name},${employee_profile.country_name}</td></tr>
<tr><th scope="row">Country:</th><td>${employee_profile.country_name}</td></tr>
<tr><th scope="row">State:</th><td>${employee_profile.state_name}</td></tr>
<tr><th scope="row">City:</th><td>${employee_profile.city_name}</td></tr>
<tr><th scope="row">PinCode:</th><td>${employee_profile.pin_code}</td></tr>
<tr><th scope="col"><p style="margin-top:10px;margin-bottom:2px;">PermanentAddress</p></th>
</tr>
<tr><th scope="row">Address:</th>
<td>${employee_profile.address_line_1p}${employee_profile.address_line_2p},${employee_profile.city_namep},${employee_profile.state_namep},${employee_profile.country_namep}</td></tr>
<tr><th scope="row">Country:</th><td>${employee_profile.country_namep}</td></tr>
<tr><th scope="row">State:</th><td>${employee_profile.state_namep}</td></tr>
<tr><th scope="row">City:</th><td>${employee_profile.city_namep}</td></tr>
<tr><th scope="row">PinCode:</th><td>${employee_profile.pin_codep}</td></tr>
</tbody></table>
<br>
<br>

</section>
</main>
</body>
</html>