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
<script src="${js}/jquery-1.7.1.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.2/jquery.validate.min.js"
	integrity="sha512-UdIMMlVx0HEynClOIFSyOrPggomfhBKJE28LKl8yR3ghkgugPnG6iLfRfHwushZl1MOPSY6TsuBDGPK2X4zYKg=="
	crossorigin="anonymous"></script>
<!-- Bootstrap 4.5 CSS-->

<script type="text/javascript">
	var bool = true;
	function email_validation() {

		var email = $("#email").val();
		
		$.ajax({
					type : "GET",
					url : '${pageContext.request.contextPath }/email/' + email,
					success : function(result) {

						if (result == "1") {
							document.getElementById('emailspan2').style.color = 'red';
							document.getElementById('emailspan2').innerHTML = 'Email Already Exists';
							bool = false;
							return false;
						} else {
							bool = true;
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

		if (document.getElementById('password').value == document
				.getElementById('confirm_password').value) {
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
		var email = document.getElementById('email').value;
		if (!email
				.match(/^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/)) {
			document.getElementById('emailspan').style.color = 'red';
			document.getElementById('emailspan').innerHTML = 'Enter Valid email';
			return false;
		} else {
			document.getElementById('emailspan').style.color = 'green';
			document.getElementById('emailspan').innerHTML = '';
			return true;
		}
	}
	
	var emailcheck2 = function() {
		var email2 = document.getElementById('alter_email').value;
		if (!email2
				.match(/^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/)) {
			document.getElementById('alt_emailspan').style.color = 'red';
			document.getElementById('alt_emailspan').innerHTML = 'Enter Valid email';
			return false;
		} else {
			document.getElementById('alt_emailspan').innerHTML = '';
			return true;
		}
	}

	function validateForm() {

		var pass = document.getElementById('password').value;
		if (pass.length<8 || pass.length>20) {

			document.getElementById('message').style.color = 'red';
			document.getElementById('message').innerHTML = 'Enter Password between 8-20 characters';
			return false;

		}
		if (document.getElementById('password').value != document
				.getElementById('confirm_password').value) {
			document.getElementById('message').style.color = 'red';
			document.getElementById('message').innerHTML = 'Password Not Matched';
			return false;
		}

		var email = document.getElementById('email').value;
		if (email.length < 3
				|| !email
						.match(/^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/)) {
			document.getElementById('emailspan').style.color = 'red';
			document.getElementById('emailspan').innerHTML = 'Enter Valid email';
			return false;
		}

		if (bool == false) {
			document.getElementById('emailspan2').style.color = 'red';
			document.getElementById('emailspan2').innerHTML = 'Email Already Exists';
			return false;
		}

	}
	
	function form_submit() {
		$(location).attr('href', '${contextRoot}/register')
	}

</script>
<link href="${css}/style.css" rel="stylesheet">
<title>registration</title>
</head>
<body>

	<div class="register">

		
		<section class="glass">
			<form:form id="form" action="${contextRoot}/emp/register" modelAttribute="employee_Registration" method="post"
				 onsubmit="return validateForm()">

				 <h3 style="padding: 10px;" class="text-center text-info">Employee Register</h3>
				

				<hr>
				
				<b style="margin-left: 20px;" class="text-info">Registration type:</b>
			<select style="margin-left: 25px;border-radius: 0px;border-color: rgba(0,0,0,0.1);" name="registration_type" onchange="form_submit()">
			<option >Employee</option>
			<option >External Candidate</option>
			</select>
<br>



				<b style="margin-left: 20px;" class="text-info">Email:</b>
				<form:input class="txteml1" type="text" placeholder="Email"
					path="user_name" id="email" onkeyup="emailcheck();email_validation();" />
				<form:errors path="user_name" cssClass="error" />
				<small style="display: block; margin-left: 183px;"><span
					id='emailspan'></span></small>
				<small style="display: block; margin-left: 183px;"><span
					id='emailspan2'></span></small>

				
				<b style="margin-left: 20px;" class="text-info">Alternate Email:</b>
				<form:input class="txteml4" type="text" placeholder="Email"
					path="alt_user_name" id="alter_email" onkeyup="emailcheck2();" />
				
				<small style="display: block; margin-left: 183px;"><span
					id='alt_emailspan'></span></small>
				

				<b style="margin-left: 20px;" class="text-info">Password:</b>
				<form:input class="txteml2" type="password"
					placeholder="Password" path="password" id="password" />
				<form:errors path="password" cssClass="error" />


				<br>



				<b style="margin-left: 20px;" class="text-info">Confirm Password:</b>
				<form:input class="txteml3" type="password"
					placeholder="Confirm Password" path="confirm_password"
					id="confirm_password" onkeyup='check();' />
				<form:errors path="confirm_password" cssClass="error" />

				<small style="display: block;"><span id='message' style="margin-left: 183px;"></span></small>
				<br>


				<form:input type="hidden" path="user_type" id="user_type"
					value="EMPLOYEE" />






				<button style="margin-left: 20px;width: 200px;" type="submit"
					class="btn btn-info btn-md">Next</button>

				<hr>



			</form:form>




		</section>


</div>



</body>
</html>