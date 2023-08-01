<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/WEB-INF/jsp/navbar.jsp"></jsp:include>
<c:set var="contextRoot" value="${pageContext.request.contextPath }"></c:set>
<spring:url var="css" value="/resources/css"></spring:url>
<spring:url var="js" value="/resources/js"></spring:url>
<spring:url var="images" value="/resources/images"></spring:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
a:link {
  text-decoration: none;
}
a:link {
 color:white;
}
a:visited {
  text-decoration: none;
}

a:hover {
  text-decoration: none;
}

a:active {
  text-decoration: underline;
}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<script type="text/javascript">
var bool=true;
function email_validation() {
	
	var email=$("#email").val();
	$.ajax({
		type:"GET",
		url:'${pageContext.request.contextPath }/demo/email/'+email,
		success: function(result)
		{
			
			if(result=="1")
				{
				document.getElementById('emailspan2').style.color = 'red';
			    document.getElementById('emailspan2').innerHTML = 'Email Already Exists';
			    bool=false;
			    return false;
				}
			else
				{
				bool=true;
			    document.getElementById('emailspan2').innerHTML = '';
			   
				}
			
		}
		
		
		
	})
}

</script>



<!-- <script type="text/javascript">

$(document).ready(function () {
	
    $("#form").validate({
        rules: {
            "email": {
                required: true,
                email: true,
                remote:true
           
        },
       "password": {
            required: true,
            minlength: 5
        },
        "confirm_password": {
            required: true,
            equalTo: "#password"
        }
        },
         messages: {
            "email": {
                required: "Please, enter an email",
                email: "Email is invalid",
                remote:"hhhhhhhhhhh"
            },
            "confirm_password": {
            	equalTo: "Not Matched"
            }
        },
    
        submitHandler: function (form) { // for demo
            alert('valid form submitted'); // for demo
            return false; // for demo
        }
    });

});

 
 


</script> -->




<script type="text/javascript">
var check = function() {
	

  if (document.getElementById('password').value ==
    document.getElementById('confirm_password').value) {
    document.getElementById('message').style.color = 'green';
    document.getElementById('message').innerHTML = 'Password Matched';
    return true;
  } else {
    document.getElementById('message').style.color = 'red';
    document.getElementById('message').innerHTML = 'Password Not Matched';
    return false;
  }  
}






	
var emailcheck = function() {
	var email=document.getElementById('email').value;
if(!email.match(/^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/))
{
	document.getElementById('emailspan').style.color = 'red';
  document.getElementById('emailspan').innerHTML = 'Enter Valid email';
  return false;
}else
{
document.getElementById('emailspan').style.color = 'green';
document.getElementById('emailspan').innerHTML = '';
return true;
}
}

function validateForm() {
	
	var pass=document.getElementById('password').value;
	if(pass.length<8 || pass.length>20)
		{
		
		 document.getElementById('message').style.color = 'red';
		    document.getElementById('message').innerHTML = 'Enter Password between 8-20 characters';
		    return false;
		
		}
	if (document.getElementById('password').value !=
	    document.getElementById('confirm_password').value ) {
	    document.getElementById('message').style.color = 'red';
	    document.getElementById('message').innerHTML = 'Password Not Matched';
	    return false;
	}
	
	
	
	var email=document.getElementById('email').value;
	if(email.length<3 || !email.match(/^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/))
	{
		document.getElementById('emailspan').style.color = 'red';
	  document.getElementById('emailspan').innerHTML = 'Enter Valid email';
	  return false;
	}
	
	
	
	if(bool==false)
		{
		document.getElementById('emailspan2').style.color = 'red';
	    document.getElementById('emailspan2').innerHTML = 'Email Already Exists';
		return false;
		}
	
	
}
</script>
<link href="${css}/style.css" rel="stylesheet">
<title>registration</title>
</head>
<body>

	<div class="register">

		<div class="circle"></div>
		<div class="circle2"></div>
		<div class="circle3"></div>
		<div class="circle4"></div>
		<section class="emp_reg">

	<form:form id="form" action="email_edit" method="post" modelAttribute="user" onsubmit="return validateForm()">
		
			<h3 style="padding: 10px;color: #009688" class="text-center">Register</h3>
			<div class="step-row">
			<div id="progress"></div>
			<div class="step-col1"><small style="color: #009688"><b style="background: white;">Basic details</b></small></div>
			<div class="step-col"><small style="color: #F5F5F5;"><b style="background: #009688;">User details</b></small></div>
			<div class="step-col"><small style="color: #F5F5F5;"><b style="background: #009688;">Academics</b></small></div>
			<div class="step-col"><small style="color: #F5F5F5;"><b style="background: #009688;">Skill</b></small></div>
			
			</div>
			
			<hr>

			
			
			
		<b style="margin-left: 20px;" class="text-info">Email:</b>
		<form:input type="text" placeholder="Email" path="user_name" class="txteml1" id="email" value="${sessionScope.user.user_name}" onkeyup="emailcheck();email_validation();"/>
			<form:errors path="user_name" cssClass="error" />
			<small style="display: block; margin-left: 170px;"><span
					id='emailspan'></span></small>
				<small style="display: block; margin-left: 170px;"><span
					id='emailspan2'></span></small>
			
			
			
			<b style="margin-left: 20px;" class="text-info">Password:</b>
			<form:input type="password" placeholder="Password" class="txteml2" path="password" id="password"  value="${sessionScope.pas}" onkeyup='check();' />
			<small><form:errors path="password" cssClass="error" /></small>
			
			
			<br> 
			
			
			<b style="margin-left: 20px;" class="text-info">Confirm Password:</b>
			<form:input type="password" placeholder="Confirm Password" class="txteml3" path="confirm_password" id="confirm_password" value="${sessionScope.user.confirm_password}" onkeyup='check();' />
			<form:errors path="confirm_password" cssClass="error" />
			<br>
			<small><span id='message' style="margin-left: 170px;"></span></small> <br>
			

			
<form:input type="hidden" path="user_type" id="user_type"
					value="USER" />

			
			
		 <button style="margin-left: 20px;width: 200px;background: #009688;color:white" type="submit"
					class="btn btn-md">Next</button>

			<hr>
			
		

	</form:form>
</section>
</div>
</body>
</html>