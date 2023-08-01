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
<spring:url var="images" value="/resources/images"></spring:url>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Leave Request</title>

<!-- Bootstrap JS Requirements -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link href="${css}/style.css" rel="stylesheet">
<link href="${css}/home.css" rel="stylesheet">
<style type="text/css">
.swal-text {
  background-color: #FEFAE3;
  padding: 17px;
  border: 1px solid #F0E1A1;
  display: block;
  margin: 22px;
  text-align: center;
  color: #61534e;
}
</style>
</head>
<body>

<div class="content2">
<i onclick="toggleSideBar()" class="fas fa-bars barbtn" style="margin-left: 15px;"></i>
<section class="emp_reg2">
<form:form action="${contextRoot}/emp/leave_apply" method="post" modelAttribute="leave_application" onsubmit="return validateForm()">
<div id="leave_date">
 <h3 class="text-info">Leave Request</h3><br>
<b>Leave from:</b> <form:input type="date" id="from_date" path="from_date" style="height:25px;border-radius: 0px;border-color: rgba(0,0,0,0.1);" />
<b style="margin-left: 50px;">To:</b> <form:input type="date" id="to_date" path="to_date" style="height:25px;border-radius: 0px;border-color: rgba(0,0,0,0.1);" />
<small><form:errors path="from_date" style="display:block;margin-left:87px;" cssClass="error" /></small>
<small><span class="spn" style="margin-left: 87px;" id="from_date_span"></span></small>
<small><form:errors path="to_date" style="display:block;margin-left:315px;" cssClass="error" /></small>
<small><span class="spn" style="margin-left: 315px;" id="to_date_span"></span></small>
<br>

<b>Leave Type:</b>  
<form:select path="leave_type" id="leave_type" style="border-radius: 0px;border-color: rgba(0,0,0,0.1);" onchange="leave_remaining()">
<form:option value="">Select Leave Type</form:option>
<form:option value="casual">Casual Leave</form:option>
<form:option value="paid">Paid Leave</form:option>
<form:option value="lop">Lop Leave</form:option>
<form:option value="sick">Sick Leave</form:option>
</form:select>
<br>
<b>Approver1:</b>  
<input type="text" name="approver1" style="width:293px!important;border-radius: 0px!important;" readonly="readonly" value="${reporting_manager.first_name} ${reporting_manager.last_name} (${reporting_manager.employee_code}) ${reporting_manager.user_name}" >
<br>
<b>Approver2:</b>  
<form:input list="approver2" id="approver_two" path="approver2" autocomplete="off" placeholder="search by name,email.employee_code" style="width:293px!important;border-radius: 0px!important;"/>
<small><form:errors path="approver2" style="display:block;margin-left:87px;" cssClass="error" /></small>
<small><span class="spn" style="margin-left: 87px;" id="approver2_span"></span></small>
<datalist id="approver2">
<c:forEach items="${approval_list}" var="approval_list">
  <option value="${approval_list.first_name} ${approval_list.last_name} (${approval_list.employee_code}) ${approval_list.user_name}">
  </c:forEach>
</datalist>
</div>
<form:input type="hidden" path="status" value="pending"/>
<br><br>

<button style="margin-left: 80px;width: 150px;" type="submit"
					class="btn btn-info btn-md">Apply</button>

</form:form>
</section>
</div>

<script type="text/javascript">
setDateRange();
function setDateRange()
{
	var today = new Date();
	var dd = String(today.getDate()).padStart(2, '0');
	var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
	var yyyy = today.getFullYear();
	today = yyyy + '-' + mm + '-' + dd;
	$("#from_date").attr('min',''+today+'');
	$("#to_date").attr('min',''+today+'');
}

function leave_remaining() {
	leave_type=$('#leave_type').val();
	
	$.ajax({
		type:'POST',
		url:'${contextRoot}/emp/leave_remaining/'+leave_type,
		success:function(result) {
			if(result<=0)
				{
			swal("You Have 0 "+leave_type+" Remaining!");
			$('#leave_type').val("");
				}
		}	
		
	});
	
	
	
}

$(document).ready(function(){
	 
    $(".item").removeClass('active');
    $(".leave_apply_link").addClass('active');
 
});
function validateForm(){
	
var startDate = $('#from_date').val();
var endDate = $('#to_date').val();
leave_type=$('#leave_type').val();
if(startDate=="")
	{
	document.getElementById('from_date_span').style.color = 'red';	
	document.getElementById("from_date_span").innerHTML = "Select date";
	return false;
	}else
		{
		document.getElementById("from_date_span").innerHTML = "";
		
		}
		
if(endDate=="")
{
document.getElementById('to_date_span').style.color = 'red';	
document.getElementById("to_date_span").innerHTML = "Select date";
return false;
}else
	{
	document.getElementById("to_date_span").innerHTML = "";
	
	}
		

if (startDate > endDate){
	document.getElementById('from_date_span').style.color = 'red';	
	document.getElementById("from_date_span").innerHTML = "Select valid dates";
	return false;
}else
{
	document.getElementById("from_date_span").innerHTML = "";
	
	}
	
if ($('#approver_two').val()==""){
	document.getElementById('approver2_span').style.color = 'red';	
	document.getElementById("approver2_span").innerHTML = "Select approver2";
	return false;
}else
{
	document.getElementById("approver2_span").innerHTML = "";
	
}
if(leave_validation(startDate,endDate,leave_type)==false)
{
	return false;
}

swal("Good job!", "You clicked the button!", "success");
}

function leave_validation(startDate,endDate,leave_type) {
	var bool=true;
	$.ajax({
		type:'POST',
		async: false,
		url:'${contextRoot}/emp/leave_validation/'+startDate+'/'+endDate+'/'+leave_type,
		success:function(result) {
			if(result>0)
			{
				bool=false;
		swal("You Have Only "+result+" "+leave_type+" Remaining!");
		
			}
		}	
		
	});
return bool;
	
}
</script>
</body>
</html>