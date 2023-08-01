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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<link href="${css}/style.css" rel="stylesheet">
</head>
<body>
<main>
<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<h4 align="center">Geographic Calendar</h4>
						<br>
						<div id="pop"></div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>


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
<section class="emp_reg" style="width: 75%">
<h3 align="center">Office Details</h3>
<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">Office Name</th>
      <th scope="col">Address</th>
      <th scope="col">City</th>
      <th scope="col">State</th>
      <th scope="col">Country</th>
      <th scope="col">Geographic Calendar</th>
      <th scope="col">Edit</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${office}" var="office">
    <tr>
      <td>${office.office_name}</td>
      <td>${office.address_line1}</td>
      <td>${office.city}</td>
      <td>${office.state}</td>
      <td>${office.country}</td>
      <td><a style="color:black;text-decoration: underline;" href="javascript:void(0);" onclick="geographic_calendar(${office.geographic_calendar_id});">view details</a></td>
      <td><a href="${contextRoot}/admin/edit_office/${office.office_id}"><button style="color: white;width: 70px;background-color: green;">edit</button></a></td>
    </tr>
    </c:forEach>
  </tbody>
</table>
</section>
</main>


<script type="text/javascript">
function geographic_calendar(user_id)
{
	
	$.ajax({
		type: 'POST',
		url: '${pageContext.request.contextPath}/admin/geographic_calendar_by_id/' + user_id,
		success: function(result)
		{
			if(result.calendar_year==null)
				{
				$('#pop').html('<hr><h5 align="center">Geographic Calendar Not Assigned!</h5>')
				}else
					{
			$('#pop').html('<table class="table table-striped"><thead><tr><th scope="col">Year</th><th scope="col">Casual Leaves</th><th scope="col">Lop Leaves</th><th scope="col">Paid Leaves</th><th scope="col">Sick Leaves</th></tr></thead><tbody><tr><td>'+result.calendar_year+'</td><td>'+result.casual_leaves_applicable+'</td><td>'+result.lop_leaves_applicable+'</td><td>'+result.paid_leaves_applicable+'</td><td>'+result.sick_leaves_applicable+'</td></tr></tbody></table>');
					}
			fun();
		}
	});
}
function fun() {
	
	$('#myModal').modal('show');
}
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


$(document).ready(function(){
	 
    $(".item").removeClass('active');
    $(".offices_link").addClass('active');
 
});

</script>

</body>
</html>