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
<title>Leave History</title>

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

 
   
<div id="cancel_modal" class="modal fade">
	<div class="modal-dialog modal-confirm">
		<div class="modal-content">
			<div class="modal-header justify-content-center">
				<div class="icon-box">
					<i class="material-icons">&#xE876;</i>
				</div>
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="reload();">&times;</button>
			</div>
			<div class="modal-body text-center">
				<h4>Cancelled</h4>	
				<p>Leave Cancelled Successfully.</p>
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
 <h3 style="display: inline;margin-left: 41%;" class="text-info">Leave History</h3>
<select id="years" name="applied_date" style="width:150px;margin-left: 27%;border-radius: 0px;border-color: rgba(0,0,0,0.1);" onchange="leave_by_year()">
<c:forEach items="${years}" var="year">
<option>${year}</option>

</c:forEach>
</select>
</div>
<br>
<div id="show_employees">


<table class="table table-hover" id="table">
 <thead><tr><th scope="col" class="text-info">From Date</th><th scope="col" class="text-info">To Date</th><th scope="col" class="text-info">Applied Date</th><th scope="col" class="text-info">Leave Type</th><th scope="col" class="text-info">Approver1</th><th scope="col" class="text-info">Approver2</th><th scope="col" class="text-info">Status</th><th scope="col" class="text-info">Approved/Rejected By</th><th scope="col" class="text-info">Cancel</th></tr></thead>
  
  </table>
  </div>
</section>
</div>
<script type="text/javascript">
leave_by_year();
function leave_by_year() {
	var approver1="${approver1.first_name}"+' '+ "${approver1.last_name}" ;
	var year=$('#years').val();
	var emp_code="${emp_code}";
	
	if(year==null)
	{year=0;}
	$.ajax({
		type:'POST',
		url: '${contextRoot}/emp/leave_by_year/'+year+'/'+emp_code,
		success:function(result)
		{
			
			if(result=="")
				{
				$('#show_employees table').append('<tbody class="tbh"><tr id="nodata"><td align="center" colspan="59"><h3>No Leave History Available<h3><td><tr></tbody>')
				}else
		{
			$('.tbh').remove();
			for(var i=0;i<result.length;i++){
				
				if(result[i].status=='pending')
					{
					$('#show_employees table').append('<tbody class="tbh"><tr><td>'+result[i].from_date+'</td><td>'+result[i].to_date+'</td><td>'+result[i].applied_date+'</td><td>'+result[i].leave_type+'</td><td>'+approver1+'</td><td>'+result[i].approver2+'</td><td>'+result[i].status+'</td><td>--</td><td><a style="color:blue;cursor: pointer;" onclick="cancel(' + result[i].leave_application_id +');">Cancel</a></td></tr></tbody>');
					}else if(result[i].status=='cancelled')
					{
						$('#show_employees table').append('<tbody class="tbh"><tr><td>'+result[i].from_date+'</td><td>'+result[i].to_date+'</td><td>'+result[i].applied_date+'</td><td>'+result[i].leave_type+'</td><td>'+approver1+'</td><td>'+result[i].approver2+'</td><td>'+result[i].status+'</td><td>--</td><td>--</td></tr></tbody>');
						}
				else
						{
			$('#show_employees table').append('<tbody class="tbh"><tr><td>'+result[i].from_date+'</td><td>'+result[i].to_date+'</td><td>'+result[i].applied_date+'</td><td>'+result[i].leave_type+'</td><td>'+approver1+'</td><td>'+result[i].approver2+'</td><td>'+result[i].status+'</td><td>'+result[i].approved_by+'</td><td>--</td></tr></tbody>');
							}	}
		}
				}
	});
	
}

function cancel(leave_id)
{
	$.ajax({
		type: 'GET',
		url: '${pageContext.request.contextPath }/emp/cancel_leave/' + leave_id,
	});
	
	 $('#cancel_modal').modal('show');
}
function reload()
{
	location.reload();
	return false;
}


$(document).ready(function(){
	 
    $(".item").removeClass('active');
    $(".leave_history_link").addClass('active');
 
});
</script>
</body>
</html>