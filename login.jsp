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
<link href="${css}/style.css" rel="stylesheet">
<meta charset="ISO-8859-1">
<!-- Bootstrap 4.5 CSS-->

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style type="text/css">
.modal-open .glass{
    -webkit-filter: blur(5px) grayscale(90%);
}

</style>
<title>Login</title>
<script type="text/javascript">


onbeforeunload = function() {
var state="bihar";
	$.ajax({
		type:'POST',
		url:'${contextRoot}/admin/getCities/'+state,
		success:function(result)
		{
			
		}
		
		
	});

    return "";
} 
</script>
</head>
<body>
<div class="content2">

<i onclick="toggleSideBar()" class="fas fa-bars barbtn" style="margin-left: 15px;"></i>
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="modal-body">
          
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>

<section class="login_page">
	<form action="${contextRoot}/login" method="post" id="form" >
		
		
			

<br>
					
				 <h3 class="text-center text-info">Login</h3>
					
					<br>
					
					



					<b class="text-info">Email:</b>
					<div class="inputContainer">
						<i class="fa fa-user icon"> </i> <input type="text" 
							placeholder="Enter Email" name="email" id="email" required>
					</div>

					<b class="text-info">Password:</b>
					<div class="inputContainer">
						<i class="fa fa-key icon"> </i> <input type="password"
							placeholder="Enter Password" name="password"  required>
					</div>
					<div id="message">
					<p id="error_message" style='color:red'>${error_message}</p>
					</div>
					<div style="display: inline;">
                    <label for="remember-me" class="text-info"><span>Remember me</span> <span><input id="remember-me" name="remember-me" type="checkbox"></span></label>  
					 </div>
					 <div id="register-link" class="text-right" style="display: inline;margin-left: 280px;">
                                <a href="${contextRoot}/register" class="text-info">Register here</a>
                            </div>
                            <br>
					<button type="submit" class="btn btn-info btn-md"
						style="margin-left: 170px;" onclick="statuscheck(event);">Login</button>
						
					<button onclick="location.href='${contextRoot}/'"
						class="btn btn-info btn-md" style="margin-left: 25px;" type="button">Cancel</button>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}"> <br>


			<script type="text/javascript">
			
			function statuscheck(e) {
				var email=$("#email").val();
				 e.preventDefault();
				$.ajax({
					type: 'GET',
					url:'${pageContext.request.contextPath }/status/'+email,
					success: function(result) {
						if(result=="pending")
							{
							$('.modal-body').html('<h5 align="center" style="color: red">Registration Approval is Pending by Admin!!!</h5>');
							$('#myModal').modal('show');
								
							}else if(result=="rejected")
								{
								$('.modal-body').html('<h5 align="center" style="color: red">Your Registration is Rejected by Admin!!!</h5>');
								$('#myModal').modal('show');
								}
							else
								{
								$('#form').submit();
								}
					}
				});
				
				
			}
			$(document).ready(function(){
				 
				    $(".item").removeClass('active');
				    $(".login_link").addClass('active');
				 
				});
			
			</script>	
			
			
	</form>
	</section> 
	
	</div>
</body>
</html>
