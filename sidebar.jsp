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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" />
<link href="${css}/home.css" rel="stylesheet">
<title>Home</title>
</head>
<body>




<div class="sidebar">
<span onclick="toggleSideBar()" class="crossBtn">&times;</span>
<security:authorize access="isAnonymous()">

	<a href="${contextRoot}/" class="item home_link">Home</a>
   <a href="${contextRoot}/login" class="item login_link">Already Registered</a>
   <a href="${contextRoot}/register" class="item register_link">New User</a>
   <a href="${contextRoot}/office_details" class="item office_details_link">Admin</a>
   
   
   
   
				
</security:authorize>

 <security:authorize access="hasAuthority('USER')">
 <a href="${contextRoot}/" class="item home_link">Home</a>
   <a href="${contextRoot}/verify" class="item profile_link">My Profile</a>
   
 </security:authorize>

 <security:authorize access="hasAuthority('ADMIN')">
 <a href="${contextRoot}/" class="item home_link">Home</a>
<a href="${contextRoot}/emp/leave_request" class="item leave_apply_link">Apply for Leave</a>
<a href="${contextRoot}/emp/leave_approval" class="item approve_leave_link">Approve Leaves</a>
<a href="${contextRoot}/emp/leave_history" class="item leave_history_link">Leave History</a>
<a href="${contextRoot}/admin/employee_approval_requests" class="item employee_management_link">Employee Management</a>
<a href="${contextRoot}/admin/holiday_calendar" class="item add_holiday_link">Add Holiday</a>
<a href="${contextRoot}/admin/add_office" class="item add_office_link">Add Office</a>
<a href="${contextRoot}/admin/view_office" class="item offices_link">Offices</a>
<a href="${contextRoot}/admin/geographic_calendar" class="item add_geographic_calendar_link">Add Geographic Calendar</a>
<a href="${contextRoot}/admin/view_all" class="item registered_candidate_link">Registered Candidate</a>
</security:authorize>

<security:authorize access="hasAuthority('EMPLOYEE')">
          <a href="${contextRoot}/" class="item home_link">Home</a> 
   <a href="${contextRoot}/emp/leave_request" class="item leave_apply_link">Apply for Leave</a>
   <a href="${contextRoot}/emp/leave_approval" class="item approve_leave_link">Approve Leaves</a>
   <a href="${contextRoot}/emp/leave_history" class="item leave_history_link">Leave History</a>
   
</security:authorize>

<div class="divider"></div>

</div>
<script type="text/javascript">

const toggleSideBar=()=>
{
	if($(".sidebar").is(":visible"))
		{
		$(".sidebar").css("display","none");
		$(".content2").css("margin-left","0%");
		$(".barbtn").css("margin-left","15px");
		}else
			{
			$(".sidebar").css("display","block");
			$(".content2").css("margin-left","18%");
			
			}
	
}

</script>
</body>
</html>