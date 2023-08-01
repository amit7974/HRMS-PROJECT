<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/WEB-INF/jsp/navbar.jsp"></jsp:include>
<jsp:include page="/WEB-INF/jsp/sidebar.jsp"></jsp:include>

<c:set var="contextRoot" value="${pageContext.request.contextPath }"></c:set>
<spring:url var="css" value="/resources/css"></spring:url>
<spring:url var="js" value="/resources/js"></spring:url>
<spring:url var="images" value="/resources/images"></spring:url>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="${css}/modal.css" rel="stylesheet">

<meta charset="ISO-8859-1">

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
	
  
<title>Employee Approval</title>
</head>
<body>
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<div id="profile_image"></div>
						<br>
						<br>
						<div id="pop"></div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

<div class="modal fade" id="office" role="dialog">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
					<h4 align="center">Select Office</h4>
						<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col" class="text-info">Office Name</th>
      <th scope="col" class="text-info">Address</th>
      <th scope="col" class="text-info">City</th>
      <th scope="col" class="text-info">State</th>
      <th scope="col" class="text-info">Country</th>
      <th scope="col" class="text-info">Select</th>
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
      <td><button style="color: white;width: 70px;background-color: green;" onclick="manager_popup(${office.office_id})">select</button></td>
    </tr>
    </c:forEach>
  </tbody>
</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
<div class="modal fade" id="manager_modal" role="dialog">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
					<h2 align="center">Select Manager</h2>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
					Search here: 
					
					<input list="approver2" id="approver_two"  autocomplete="off" placeholder="search by name,email.employee_code" style="width:293px!important;border-radius: 0px!important;" onkeyup="manager_search()"/>
					<datalist id="approver2">
					<c:forEach items="${managers}" var="manager">
					<option value="${manager[0]}">${manager[0]} ${manager[1]}</option>		
					</c:forEach>
					</datalist> 
					<br><br>
						<div id="searched_append" style="margin: auto;text-align: center;">
						</div>
						<br>
						<br>
						<div id="pop"></div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>


<div id="success_modal" class="modal fade">
	<div class="modal-dialog modal-confirm">
		<div class="modal-content">
			<div class="modal-header justify-content-center">
				<div class="icon-box">
					<i class="material-icons">&#xE876;</i>
				</div>
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="reload();">&times;</button>
			</div>
			<div class="modal-body text-center">
				<h4>Manager Assigned</h4>	
				<p>Manager assigned successfully.</p>
				<button class="btn btn-success" data-dismiss="modal" onclick="reload();"><i class="material-icons">arrow_back</i><span>Back</span></button>
			</div>
		</div>
	</div>
</div>     
<div class="content2">
<i onclick="toggleSideBar()" class="fas fa-bars barbtn" style="margin-left: 15px;"></i>
<section class="approve_table_leave">

<br>
<div>
 <h3 style="display: inline;margin-left: 31%;" class="text-info">Employee Approval</h3>


<select name="box" style="border-radius: 0px;border-color: rgba(0,0,0,0.1);margin-left: 24%;width: 150px;" id="select_box" onchange="filterstatus();">
<option selected="selected" value="pending">Pending</option>
<option value="rejected">Rejected</option>
<option value="approved">Approved</option>
</select>
</div>
<br>

<div id="show_employees">


<table class="table table-hover" id="table">
 
  
  </table>
  </div>
<script type="text/javascript">

function approve(user_id,employee_code,office_id)
{
	
	 $.ajax({
		type: 'POST',
		url: '${pageContext.request.contextPath}/admin/approve_employee/' + user_id +'/'+employee_code+'/'+office_id
	});
	
	
	$('#success_modal').modal({
	    backdrop: 'static',
	    keyboard: false
	});
}
var global_id;
var office_id;
function office_popup(id)
{
	global_id=id;
	$('#office').modal('show');	
	
	
}
function manager_popup(officeId)
{
	
	$('#office').modal('hide');
	office_id=officeId;
	$('#manager_modal').modal('show');	
	
	
}
function employee_by_id(user_id)
{
	
	$.ajax({
		type: 'POST',
		url: '${pageContext.request.contextPath}/admin/employee_details_by_id/' + user_id,
		success: function(result)
		{
			$('#profile_image').html('<div class="image"><img id="ItemPreview" src="" height="100" width="100" style="position: absolute;right: 20px;"></div>');

			$('#pop').html('<table class="table table-hover table-sm" style="width:100%;"><thead><tr><th scope="col" class="text-info"><p><b>Basic Information</b></p>Field Name</th></tr></thead><tbody><tr><th scope="row">Name:</th><td>'+result.first_name+' '+result.last_name+'</td></tr><tr><th scope="row"style="width:40%;">Email:</th><td>'+result.user_name+'</td></tr><tr><th scope="row">Phone:</th><td>'+result.phone+'</td></tr><tr><th scope="row">Gender:</th><td>'+result.gender+'</td></tr><tr><th scope="row">Date of Birth</th><td>'+result.dob+'</td></tr><tr><th scope="col" class="text-info"><h4 style="margin-top:10px;margin-bottom:2px;">Address</h4></th></tr><tr><th scope="row">CurrentAddress</th></tr><tr><th scope="row">Address:</th><td>'+result.address_line_1+''+result.address_line_2+','+result.city_name+','+result.state_name+','+result.country_name+'</td></tr><tr><th scope="row">Country:</th><td>'+result.country_name+'</td></tr><tr><th scope="row">State:</th><td>'+result.state_name+'</td></tr><tr><th scope="row">City:</th><td>'+result.city_name+'</td></tr><tr><th scope="row">PinCode:</th><td>'+result.pin_code+'</td></tr><tr><th scope="col" class="text-info"><p style="margin-top:10px;margin-bottom:2px;">PermanentAddress</p></th><tr><tr><th scope="row">Address:</th><td>'+result.address_line_1p+''+result.address_line_2p+','+result.city_namep+','+result.state_namep+','+result.country_namep+'</td></tr><tr><th scope="row">Country:</th><td>'+result.country_namep+'</td></tr><tr><th scope="row">State:</th><td>'+result.state_namep+'</td></tr><tr><th scope="row">City:</th><td>'+result.city_namep+'</td></tr><tr><th scope="row">PinCode:</th><td>'+result.pin_codep+'</td></tr></tbody></table>');
			document.getElementById("ItemPreview").src = "data:image/png;base64," + result.base64Image;					

			fun();
		}
	});
}
filterstatus();
	function filterstatus()
	{
		
		var status=$('#select_box').val();
		
		$.ajax({
			type: 'POST',
			url: '${pageContext.request.contextPath}/admin/employee_by_status/' + status,
			success: function(result)
			{
				
				$('.tbd').remove();
				if(status=="pending"){
					$('#show_employees table').append('<thead class="tbd"><tr><th scope="col" class="text-info">Email</th><th scope="col" class="text-info">First Name</th><th scope="col" class="text-info">Last Name</th><th scope="col" class="text-info">Status</th><th scope="col" class="text-info">Details</th><th scope="col" class="text-info">Approve/Reject</th></tr></thead>');
					
				}			
				else
				{
					$('#show_employees table').append('<thead class="tbd"><tr><th scope="col" class="text-info">Email</th><th scope="col" class="text-info">First Name</th><th scope="col" class="text-info">Last Name</th><th scope="col" class="text-info">Status</th><th scope="col" class="text-info">Details</th></tr></thead>');

				}
				
				
				for(var i=0;i<result.length;i++)
					{
					if(status=="pending"){
						
						$('#show_employees table').append('<tbody class="tbd"><tr><td>'+result[i].user_name+'</td><td>'+result[i].first_name+'</td><td>'+result[i].last_name+'</td><td>'+result[i].status+'</td><td><a style="color:black;text-decoration: underline;" href="javascript:void(0);" onclick="employee_by_id('+result[i].users_id+');">view details</a></td><td><button style="width: 80px;background: green;color: white;" onclick="office_popup('+result[i].users_id+');">Approve</button><button style="width: 70px;background: #DD0000;color: white;margin-left: 5px;" onclick="reject('+result[i].users_id+');">Reject</button></td></tr></tbody>');
						
					}else
						{

					$('#show_employees table').append('<tbody class="tbd"><tr><td>'+result[i].user_name+'</td><td>'+result[i].first_name+'</td><td>'+result[i].last_name+'</td><td>'+result[i].status+'</td><td><a style="color:black;text-decoration: underline;" href="javascript:void(0);" onclick="employee_by_id('+result[i].users_id+');">view details</a></td></tr></tbody>');
						}
					}
				if(result.length==0)
					{
					$('.tbd').remove();
					$('#show_employees table').append('<thead class="tbd"><tr><th scope="col" class="text-info">Email</th><th scope="col" class="text-info">First Name</th><th scope="col" class="text-info">Last Name</th><th scope="col" class="text-info">Status</th><th scope="col" class="text-info">Change Status</th></tr></thead><tbody class="tbd"><tr id="nodata"><td align="center" colspan="5"><h3>No records found<h3><td><tr></tbody>');
					}
			}
		});
	
}

function reject(user_id)
{
	
	$.ajax({
		type: 'POST',
		url: '${pageContext.request.contextPath}/admin/reject_employee/' + user_id
	});
	
	 setTimeout(function(){ reload(); }, 500);
}


function reload()
{
	
	
	location.reload();
	return false;
	
	
}

function fun() {
	
	$('#myModal').modal('show');
}

function manager_search()
{
	var search_emp=$('#approver_two').val();
	
	$.ajax({
		type: 'POST',
		url: '${pageContext.request.contextPath}/admin/employee_search/' + search_emp,
		success: function(result)
		{
			var s ='';
			s+='<table class="table table-hover"><thead><tr><th scope="col" class="text-info">Email</th><th scope="col" class="text-info">First Name</th><th scope="col" class="text-info">Last Name</th><th scope="col" class="text-info">EmpCode</th><th scope="col" class="text-info">Assign Manager</th></tr></thead>';
			for(var i = 0; i < result.length; i++) {
				var empcode=result[i].employee_code+'';
				
				s +='<tbody><tr><td>'+result[i].user_name+'</td><td>'+result[i].first_name+'</td><td>'+result[i].last_name+'</td><td>'+result[i].employee_code+'</td><td><button style="width: 80px;background: green;color: white;" onclick="assign_popup(\'' + result[i].employee_code + '\')">select</button></td></tr></tbody>';
			}
			  
			  
			s +='</table>';
			$('#searched_append').html(s);
		}
	});
	
	
}


function assign_popup(code)
{
	if (confirm('Assign Manager to this Employee?')) {
		  approve(global_id,code,office_id);
		  $('#manager_modal').modal('hide');	 
		}
	
}


$(document).ready(function(){
	 
    $(".item").removeClass('active');
    $(".employee_management_link").addClass('active');
 
});
</script>
</section>
</div>

</body>
</html>