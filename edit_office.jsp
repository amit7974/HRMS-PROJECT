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
<title>Add Office</title>
<!-- Bootstrap JS Requirements -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css">

<link href="${css}/style.css" rel="stylesheet">
</head>
<body>
<main>
<div style="height: 60px;position: absolute;top: 20px;right: 40px;display: inline-flex;">
  <form action="${contextRoot}/" method="get">
  <button type="submit" class="btn btn-light" style="margin-right: 15px;">Home</button>
  </form>
  
              <form:form action="${contextRoot}/employee_profile" method="post">
                 <button type="submit" class="btn btn-light" style="margin-right: 10px;"><small>${user_login_info.first_name} ${user_login_info.last_name}</small> </button>
                 </form:form>
             
  <form action="${contextRoot}/perform-logout" method="get">
  <button type="submit" class="btn btn-light">Logout</button>
  </form>
   </div>
<section class="emp_reg">
<form:form action="${contextRoot}/admin/update_office" method="post" modelAttribute="office_details" onsubmit="">
<h3 align="center">Edit Office</h3>
<input type="hidden" name="office_id" value="${office.office_id}" />
<b style="margin-left: 20px;">Office Name:</b>
<form:input path="office_name" value="${office.office_name}" type="text" placeholder="Office Name" style="margin-left: 19px;"/>
<br>
<b style="margin-left: 20px;">Address Line 1:</b>
<form:input path="address_line1" value="${office.address_line1}" type="text" placeholder="Address Line 1" />
<br>
<b style="margin-left: 20px;">Address Line 2:</b>
<form:input path="address_line2" value="${office.address_line2}" type="text" placeholder="Address Line 2" />
<br><br>
<b style="margin-left: 20px;">Country:</b>  
<form:select path="country" style="margin-left: 46px;border-radius:0px;min-width:200px;border: solid;border-width: 0.1px;border-color: rgba(0,0,0,0.1);" id="country" onchange="select_state();">
<form:option value="none">Select Country</form:option>
<option selected="selected" value="${office.country}">${office.country}</option>
<c:forEach items="${country}" var="country">
<form:option value="${country}">${country}</form:option>
</c:forEach>
</form:select>
<br><br>

<b style="margin-left: 20px;">State:</b>  
<form:select path="state" id="state" style="margin-left: 66px;border-radius:0px;min-width:200px;border: solid;border-width: 0.1px;border-color: rgba(0,0,0,0.1);" onchange="select_cities()">
<form:option value="${office.state}">${office.state}</form:option>
</form:select>

<br><br>
<b style="margin-left: 20px;">City:</b> 
<form:select path="city" style="margin-left: 74px;border-radius:0px;min-width:200px;border: solid;border-width: 0.1px;border-color: rgba(0,0,0,0.1);" id="city">
<form:option value="${office.city}">${office.city}</form:option>
</form:select>
<br>
<b style="margin-left: 20px;">Pin Code:</b>
<form:input path="zipcode" type="text" value="${office.zipcode}" placeholder="Zip Code" style="margin-left: 40px;" />
<br><br>
<b style="margin-left: 20px;">Geo Calendar:</b>
<c:if test="${office.geographic_calendar_id}==${cal.geographic_calendar_id}">
<option selected="selected" value="${cal.geographic_calendar_id}">${cal.calendar_year}-- Casual Leave: ${cal.casual_leaves_applicable}, Lop Leave: ${cal.lop_leaves_applicable}, Paid Leave: ${cal.paid_leaves_applicable}, Sick Leave: ${cal.sick_leaves_applicable}</option>
</c:if>

<form:select path="geographic_calendar_id" style="margin-left: 15px;border-radius:0px;min-width:200px;border: solid;border-width: 0.1px;border-color: rgba(0,0,0,0.1);" id="geographic_calendar_id">
<form:option value="${cal.geographic_calendar_id}">${cal.calendar_year}-- Casual Leave: ${cal.casual_leaves_applicable}, Lop Leave: ${cal.lop_leaves_applicable}, Paid Leave: ${cal.paid_leaves_applicable}, Sick Leave: ${cal.sick_leaves_applicable}</form:option>
<c:forEach items="${geo_cal}" var="cal">
<form:option value="${cal.geographic_calendar_id}">${cal.calendar_year}-- Casual Leave: ${cal.casual_leaves_applicable}, Lop Leave: ${cal.lop_leaves_applicable}, Paid Leave: ${cal.paid_leaves_applicable}, Sick Leave: ${cal.sick_leaves_applicable}</form:option>

</c:forEach>


</form:select>
<br><br><br>
<button type="submit" style="margin-left: 125px;background-color: green;color: white;width: 200px;height: 35px;">Add Office</button>
<br><br>
</form:form>
</section>
</main>


<script type="text/javascript">

function select_state()
{
	var country=$('#country').val();
	$.ajax({
		type:'POST',
		url:'${contextRoot}/admin/getStates/'+country,
		success:function(result)
		{
			var s = '<option value="none">Select State</option>';
			for(var i = 0; i < result.length; i++) {
				s += '<option value="' + result[i] + '">' + result[i] + '</option>';
			}
			
			$('#state').html(s);
			select_cities();
		}
		
		
	});
	
		
}

function select_cities()
{
	var state=$('#state').val();
	$.ajax({
		type:'POST',
		url:'${contextRoot}/admin/getCities/'+state,
		success:function(result)
		{
			var s = '<option value="none">Select City</option>';;
			for(var i = 0; i < result.length; i++) {
				s += '<option value="' + result[i] + '">' + result[i] + '</option>';
			}
			
			$('#city').html(s);
		}
		
		
	});
	
	 
}




</script>

</body>
</html>