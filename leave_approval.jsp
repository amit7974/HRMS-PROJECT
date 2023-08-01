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
<meta charset="ISO-8859-1">
<title>Leave Request</title>

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


<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<div id="pop">
						
						
						</div>
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
				<h4>Approved</h4>	
				<p>Leave Approved Successfully.</p>
				<button class="btn btn-success" data-dismiss="modal" onclick="reload();"><i class="material-icons">arrow_back</i><span>Back</span></button>
			</div>
		</div>
	</div>
</div>     

<div id="reject_modal" class="modal fade">
	<div class="modal-dialog modal-confirm">
		<div class="modal-content">
			<div class="modal-header justify-content-center">
				<div class="icon-box">
					<i class="material-icons">&#xE876;</i>
				</div>
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="reload();">&times;</button>
			</div>
			<div class="modal-body text-center">
				<h4>Rejected</h4>	
				<p>Leave Rejected Successfully.</p>
				<button class="btn btn-success" data-dismiss="modal" onclick="reload();"><i class="material-icons">arrow_back</i><span>Back</span></button>
			</div>
		</div>
	</div>
</div>   
<div class="content2">  
<i onclick="toggleSideBar()" class="fas fa-bars barbtn" style="margin-left: 15px;"></i>
<section class="approve_table_leave">
<br>


 <h3 style="display: inline;margin-left: 41%;" class="text-info">Leave Approval</h3>
<div class="select" style="display: inline-flex;margin-left: 19.5%;">
<select name="box" id="select_box" style="border-radius: 0px;border-color: rgba(0,0,0,0.1);" onchange="filterstatus();">
<option selected="selected" value="pending">pending</option>
<option value="rejected">rejected</option>
<option value="approved">approved</option>
</select>
<br><br>
</div>

<div id="show_employees">


<table class="table table-hover" id="table">
 
  
  </table>
  </div>


</section>
</div>
<script type="text/javascript">
var approved_by='${approved_by}';
filterstatus();
function filterstatus()
{
	
	var status=$('#select_box').val();
	
	$.ajax({
		type: 'POST',
		url: '${pageContext.request.contextPath}/emp/leave_by_status/' + status,
		success: function(result)
		{

			
			
			$('.tbd').remove();
			if(status=="pending"){
				$('#show_employees table').append('<thead class="tbd"><tr><th scope="col" class="text-info">Email</th><th scope="col" class="text-info">Name</th><th scope="col" class="text-info">Date From</th><th scope="col" class="text-info">Date To</th><th scope="col" class="text-info">Details</th><th scope="col" class="text-info">Action</th></tr></thead>');
				
			}			
			else
			{
				$('#show_employees table').append('<thead class="tbd"><tr><th scope="col" class="text-info">Email</th><th scope="col" class="text-info">Name</th><th scope="col" class="text-info">Date From</th><th scope="col" class="text-info">Date To</th><th scope="col" class="text-info">Details</th><th scope="col" class="text-info">Status</th></tr></thead>');

			}
			
			
			for(var i=0;i<result.length;i++)
				{
				if(status=="pending"){
				
					
					$('#show_employees table').append('<tbody class="tbd"><tr><td>'+result[i].user_name+'</td><td>'+result[i].first_name+' '+result[i].last_name+'</td><td>'+result[i].from_date+'</td><td>'+result[i].to_date+'</td><td><a style="color:black;text-decoration: underline;" href="javascript:void(0);" onclick="leave_by_id('+result[i].leave_application_id+');">view details</a></td><td><button style="width: 80px;background: green;color: white;" onclick="approve(' + result[i].leave_application_id +');">Approve</button><button style="width: 70px;background: #DD0000;color: white;margin-left: 5px;" onclick="reject(' + result[i].leave_application_id +');">Reject</button></td></tr></tbody>');
					
				}else
					{

				$('#show_employees table').append('<tbody class="tbd"><tr><td>'+result[i].user_name+'</td><td>'+result[i].first_name+' '+result[i].last_name+'</td><td>'+result[i].from_date+'</td><td>'+result[i].to_date+'</td><td><a style="color:black;text-decoration: underline;" href="javascript:void(0);" onclick="leave_by_id('+result[i].leave_application_id+');">view details</a></td><td>'+result[i].status+'</td></tr></tbody>');
					}
				}
			if(result.length==0)
				{
				$('.tbd').remove();
				$('#show_employees table').append('<thead class="tbd"><tr><th scope="col" class="text-info">Email</th><th scope="col" class="text-info">Name</th><th scope="col" class="text-info">Date From</th><th scope="col" class="text-info">Date To</th><th scope="col" class="text-info">Status</th></tr></thead><tbody class="tbd"><tr id="nodata"><td align="center" colspan="9"><h3>No records found<h3><td><tr></tbody>');
				}
		}
	});

}




function leave_by_id(leave_id)
{
	
	$.ajax({
		type: 'POST',
		url: '${pageContext.request.contextPath}/emp/leave_details_by_id/' + leave_id,
		success: function(result)
		{
			if(result.status=="pending" || result.status=="cancelled"){
			$('#pop').html('<h3 align="center">Leave Details</h3><br><table class="table table-striped table-sm" style="width: 97%;margin-left: 3%;"><tbody><tr><th>Employee Code</th><td>'+result.applied_by+'</td></tr><tr><th>From Date</th><td>'+result.from_date+'</td></tr><tr><th>To Date</th><td>'+result.to_date+'</td></tr><tr><th>No. of Days</th><td>'+result.no_of_days+'</td></tr><tr><th>Applied Date</th><td>'+result.applied_date+'</td></tr><tr><th>Leave Type</th><td>'+result.leave_type+'</td></tr><tr><th>Approver1</th><td>'+result.approver1+'</td></tr><tr><th>Approver2</th><td>'+result.approver2+'</td></tr></tbody></table>');
			}else
				{
				$('#pop').html('<h3 align="center">Leave Details</h3><br><table class="table table-striped table-sm" style="width: 97%;margin-left: 3%;"><tbody><tr><th>Employee Code</th><td>'+result.applied_by+'</td></tr><tr><th>From Date</th><td>'+result.from_date+'</td></tr><tr><th>To Date</th><td>'+result.to_date+'</td></tr><tr><th>No. of Days</th><td>'+result.no_of_days+'</td></tr><tr><th>Applied Date</th><td>'+result.applied_date+'</td></tr><tr><th>Leave Type</th><td>'+result.leave_type+'</td></tr><tr><th>Approver1</th><td>'+result.approver1+'</td></tr><tr><th>Approver2</th><td>'+result.approver2+'</td></tr><tr><th>Approved/Rejected Date</th><td>'+result.approved_date+'</td></tr><tr><th>Approved/Rejected by</th><td>'+result.approved_by+'</td></tr></tbody></table>');
				}
			fun();
		}
	});
}

function fun() {
	
	$('#myModal').modal('show');
}











function approve(leave_id)
{
	
	 $.ajax({
		type: 'GET',
		url: '${pageContext.request.contextPath }/emp/approve_leave/' + leave_id+'/'+approved_by,
	});
	 $('#success_modal').modal('show');
	
}

function reload()
{
	
	
	location.reload();
	return false;
	
	
}
function reject(leave_id)
{
	$.ajax({
		type: 'GET',
		url: '${pageContext.request.contextPath }/emp/reject_leave/' + leave_id+'/'+approved_by,
	});
	
	 $('#reject_modal').modal('show');
		
}

$(document).ready(function(){
	 
    $(".item").removeClass('active');
    $(".approve_leave_link").addClass('active');
 
});
</script>
</body>
</html>