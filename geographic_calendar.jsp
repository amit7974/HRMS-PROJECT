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
<title>Geographic Calendar</title>

<!-- Bootstrap JS Requirements -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link href="${css}/style.css" rel="stylesheet">
<link href="${css}/modal.css" rel="stylesheet">
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
<form:form action="${contextRoot}/admin/save_geographic_calendar" method="post" modelAttribute="geographic_calendar" onsubmit="return validateForm()">
<br>
<h3 style="margin-left: 20px;">Geographic Calendar:</h3><br>
<b style="margin-left: 20px;">Calendar Year:</b>
<select name="calendar_year" id="calendar_year" onchange="setDateRange();holiday_data();">
</select>
<br> <br>
<b style="margin-left: 20px;">Select Holiday Calendar:</b>
<select id="region" name="holiday_calendar_id" style="display: inline;width: 260px;">

</select>

</select><br> <br>
<b style="margin-left: 20px;">Casual Leaves_Applicable:</b>
<form:input type="input" path="casual_leaves_applicable" style="width:50px;" placeholder="Days" /><br><br>
<b style="margin-left: 20px;">Sick Leaves Applicable:</b>
<form:input type="input" path="sick_leaves_applicable" style="width:50px;" placeholder="Days" /><br><br>
<b style="margin-left: 20px;">Paid Leaves Applicable:</b>
<form:input type="input" path="paid_leaves_applicable" style="width:50px;" placeholder="Days" /><br><br>
<b style="margin-left: 20px;">LOP Leaves Applicable:</b>
<form:input type="input" path="lop_leaves_applicable" style="width:50px;" placeholder="Days" /><br><br>

<button type="submit" style="margin-left: 20px;background-color: green;color: white;">Add Calendar</button>
<br><br>
</form:form>
</section>
</main>
<script type="text/javascript">
setDateRange();
function setDateRange()
{
	var val=$("#calendar_year").val();
	$("#date").val("");
	$("#date").attr('min',''+val+'-01-01');
	$("#date").attr('max',''+val+'-12-31');
}

addYear();
function addYear() {
	   var currentYear = new Date().getFullYear();  
	   
	    for (var i = 1; i <= 5; i++ ) {
	        $("#calendar_year").append(
	            
	            $("<option></option>")
	                .attr("value", currentYear)
	                .text(currentYear)
	            
	        );
	        currentYear++;
	    }
	}
	
function holiday_data()
{
	
var year=$("#calendar_year").val();
$.ajax({
	type:"POST",
	url: "${contextRoot}/admin/cal_year/"+year,
	success:function(result)
	{
		$(".reg").remove();
		$("#region").append('<option class="reg" value="">select calendar</option>');
		for(var i=0;i<result.length;i++)
			{
		$("#region").append("<option class='reg sss' value="+result[i].holiday_calendar_id+">"+result[i].calendar_year+" -- "+result[i].city+", "+result[i].state+", "+result[i].country+"  "+"</option>");
			}
		
			}
});
}
holiday_data();

$(document).ready(function(){
	 
    $(".item").removeClass('active');
    $(".add_geographic_calendar_link").addClass('active');
 
});
</script>
</body>
</html>