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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<title>Profile Page</title>
<!-- Latest compiled and minified CSS -->
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
<h3 style="text-align: center;margin-top: 10px;margin-left:40%; display:inline-block;">My Profile</h3>

<div style="margin-left:3%;margin-top: 2%;">
<table class="table table-striped table-sm" style=" width: 100%;">
<thead>
<tr>

<th scope="col"><p><b>Basic Information</b><a style="margin-right: 0px;margin-left: 25px;" href="${contextRoot}/user_back">edit</a></p>Field Name</th>

</tr>
</thead>
<tbody>

<tr>
<th scope="row">Name:</th>
<td>${ulist.first_name} ${ulist.middle_name} ${ulist.last_name}</td>
</tr>



<tr>
<th scope="row" style="width: 40%;">Email:</th>
<td>${us}</td>
</tr>



<tr>
<th scope="row">Phone:</th>
<td>${ulist.phone}</td>
</tr>
<tr>
<th scope="row">Gender:</th>
<td>${ulist.gender}</td>
</tr>

<tr>
<th scope="row">Date of Birth</th>
<td>${ulist.dob}</td>
</tr>
<th scope="col"><p style="margin-top: 10px;margin-bottom: 2px;"><h4>Address</h4></p></th>

<tr>
<th scope="row">Current Address<a style="margin-right: 0px;margin-left: 25px;" href="${contextRoot}/user_back">edit</a></th>

</tr>


<tr>
<th scope="row">Address:</th>
<td>${ulist.current_Address.address_line_1} ${ulist.current_Address.address_line_2},${ulist.current_Address.city_name},${ulist.current_Address.state_name},${ulist.current_Address.country_name}</td>
</tr>

<tr>
<th scope="row">Country:</th>
<td>${ulist.current_Address.country_name}</td>
</tr>

<tr>
<th scope="row">State:</th>
<td>${ulist.current_Address.state_name}</td>
</tr>

<tr>
<th scope="row">City:</th>
<td>${ulist.current_Address.city_name}</td>
</tr>

<tr>
<th scope="row">PinCode:</th>
<td>${ulist.current_Address.pin_code}</td>
</tr>
<th scope="col"><p style="margin-top: 10px;margin-bottom: 2px;">Permanent Address<a style="margin-right: 0px;margin-left: 25px;" href="${contextRoot}/user_back">edit</a></p></th>

<tr>
<th scope="row">Address:</th>
<td>${ulist.permanent_Address.addressp} ${ulist.permanent_Address.address2p},${ulist.permanent_Address.city_namep},${ulist.permanent_Address.state_namep},${ulist.permanent_Address.country_namep}</td>
</tr>

<tr>
<th scope="row">Country:</th>
<td>${ulist.permanent_Address.country_namep}</td>
</tr>

<tr>
<th scope="row">State:</th>
<td>${ulist.permanent_Address.state_namep}</td>
</tr>

<tr>
<th scope="row">City:</th>
<td>${ulist.permanent_Address.city_namep}</td>
</tr>

<tr>
<th scope="row">PinCode:</th>
<td>${ulist.permanent_Address.pin_codep}</td>
</tr>












</tbody>




</table>





</div>
<br><br>
<table class="table table-striped table-sm" style="width: 97%;margin-left: 3%;">
<thead>

<tr>
<th>
<p><b>Qualification Details</b> <a style="margin-right: 0px;margin-left: 25px;" href="${contextRoot}/qual_back">edit</a></p>
Field Name
</th>

</tr>




</thead>
<tbody>
<tr>
<th>Qualification Name</th>
<c:forEach items="${qinfo.qualification_name}"  var="qual">
<td>
${qual}
</td>
</c:forEach>
</tr>

<tr>
<th>Qualification Info</th>
<c:forEach items="${qinfo.qualification_Description}"  var="qual">
<td>
${qual}
</td>
</c:forEach>
</tr>

<tr>
<th>Marks</th>
<c:forEach items="${qinfo.marks_Detail}"  var="qual">
<td>
${qual}
</td>
</c:forEach>
</tr>

</tbody>
</table>

<br>
<br>
<table class="table table-striped table-sm" style="width: 97%;margin-left: 3%">
<thead>


<tr>
<th>
<p><b style="margin-right: 50px;">Skills Details</b> <a style="margin-left: 25px;" href="${contextRoot}/skill_back">edit</a></p>
Field Name
</th>

</tr>




</thead>
<tbody>
<tr>
<th>Skill Name</th>
<c:forEach items="${sinfo.skill_name}"  var="skill">
<td>
${skill}
</td>
</c:forEach>
</tr>

<tr>
<th>Experience</th>
<c:forEach items="${sinfo.experience_in_month}"  var="skill">
<td>
${skill}
</td>
</c:forEach>
</tr>



</tbody>
</table>
<br>
<br>
</section>
</main>
</body>
</html>