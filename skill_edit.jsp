<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<jsp:include page="/WEB-INF/jsp/navbar.jsp"></jsp:include>
<c:set var="contextRoot" value="${pageContext.request.contextPath }"></c:set>
<spring:url var="css" value="/resources/css"></spring:url>
<spring:url var="js" value="/resources/js"></spring:url>
<spring:url var="images" value="/resources/images"></spring:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="${css}/style.css" rel="stylesheet">
<title>Details</title>
<script src="${js}/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.2/jquery.validate.min.js" integrity="sha512-UdIMMlVx0HEynClOIFSyOrPggomfhBKJE28LKl8yR3ghkgugPnG6iLfRfHwushZl1MOPSY6TsuBDGPK2X4zYKg==" crossorigin="anonymous"></script>


<script type="text/javascript">

/* $(document).ready(function(){
  $("#rem").click(function(event){
	  event.preventDefault();
	  alert("working");
	  $('.rem').closest('.div1').remove();
	  $(".rem").closest('.div2').remove();
	  x--;
	 
	  
  });
}); */

/* $(document).on('click', '.deleter',function(event){
  	
	   console.log($(this).closest('div').children('#fieldList').children('div.div1'));
	 }); */
 function file_type() {
	
	var fileInput =  
        document.getElementById('fileupload'); 
	
	var filePath = fileInput.value;

	var allowedExtensions =  
        /(\.doc|\.docx|\.pdf)$/i;
	if (!allowedExtensions.exec(filePath)) { 
		document.getElementById("filespan").innerHTML="Select doc,docx or pdf file!";
		document.getElementById("filespan").style.color='red';
        fileInput.value = '';  
    }  else
    	{
    	document.getElementById("filespan").innerHTML="";
    	
    	}
	
}


function exp_verify() {
	var exp=document.getElementById("experience_in_month").value;
	if(exp.length<1)
		{
	document.getElementById('experience').style.color = 'red';
	document.getElementById("experience").innerHTML="Valid marks";
		}else
			{
			
			document.getElementById("experience").innerHTML="";
			}
}

function skilln() {
	var skilln=document.getElementById("skill_name").value;
	if(skilln.length<1)
		{
	document.getElementById('skillspan').style.color = 'red';
	document.getElementById("skillspan").innerHTML="Valid Name";
		}else
			{
			
			document.getElementById("skillspan").innerHTML="";
			} 
}
</script>
<script type="text/javascript">

function validateForm()
{
	
	var file=document.getElementById("fileupload").value;
	if(file=="")
		{
		
	document.getElementById('filespan').style.color = 'red';
	document.getElementById("filespan").innerHTML="Select File";
	return false; 
		}
	
	
	
	 
}




</script>

<script type="text/javascript">
   $(document).ready(function() {
       

       

        $('form.commentForm').on('submit', function(event) {

            // adding rules for inputs with class 'comment'
            $('input.comment').each(function() {
                $(this).rules("add", 
                    {
                        required: true
                    })
            });          
			
            $('input.com').each(function() {
                $(this).rules("add", 
                    {
                        required: true,
                        digits: true
                    })
            });  
            
            $('#fileupload').each(function() {
                $(this).rules("add", 
                    {
                        required: true,
                        messages: {
                            required: ""
                        }
                    })
            });  
            // prevent default submit action         
            $("#skill_name").rules("add", {required:true});
            
            $("#experience_in_month").rules("add", {required:true, digits: true});

           
        })

      

        // initialize the validator
        $('form.commentForm').validate();

   });


</script>
</head>
<body>
<main>
<section class="glass">

<form:form class="commentForm" action="skill_update?${_csrf.parameterName}=${_csrf.token}" method="post" modelAttribute="skill"  enctype="multipart/form-data">
  
    <h3 style="padding: 10px;color: #009688" class="text-center">Register</h3>
    <div class="step-row">
			<div id="progress4"></div>
			<div class="step-cold"><a href="registerback" style="background: #009688;text-decoration: none"><small><b style="color: #F5F5F5;background: #009688;;">Basic details</b></small></a></div>
			<div class="step-cold"><a href="user_back" style="background: #009688;text-decoration: none"><small><b style="color: #F5F5F5;background: #009688;;">User details</b></small></a></div>
			<div class="step-cold"><a href="qual_back" style="background: #009688;text-decoration: none"><small><b style="color: #F5F5F5;background: #009688;;">Academics</b></small></a></div>
			<div class="step-col4"><small><b  style="color: #009688">Skill</b></small></div>
			
			</div>
			<br>
			<br>
    <hr>

  <div class="clearfix"></div>
			<div class="pdd" id="dynamicInput">
				
   <b style="margin-left: 10px;">Skill:</b>
    <form:input type="text" style="margin-left: 49px;" placeholder="Skill" path="skill_name" id="skill_name" value="${sessionScope.sk.skill_name[0]}" onkeyup="skilln();"/>
	<small><form:errors path="skill_name" cssStyle="color:red"></form:errors></small>
	<small><span id="skillspan" style="display:block;margin-left: 100px;"></span></small>
	

	
	

    <b style="margin-left: 10px;">Experience:</b>
    <form:input type="text" style="margin-left:2px;" placeholder="Experience in months" path="experience_in_month" id="experience_in_month" value="${sessionScope.sk.experience_in_month[0]}" onkeyup="exp_verify();"/>
   <small> <form:errors path="experience_in_month" cssClass="fileerror"></form:errors></small>
   <small>  <span id="experience" style="display:block;margin-left: 100px;"></span></small>
   <small> <span id="emp" style="margin-left: 100px;"></span> </small>  
   
    <br>
    <hr>  	
     <form:input type="hidden" path="user_skill_id" value="${sessionScope.sk.user_skill_id[0]}"/>
	<form:input type="hidden" path="skill_id" value="${sessionScope.sk.skill_id[0]}"/>
	<form:input type="hidden" path="user_id" value="${sessionScope.sk.user_id[0]}"/>
	
	</div>							
			<div class="text-right addskill-btn"><br>
				<input type="button" name="addskill" value="Add Skill" id="addskill" />
			</div>
			<div class="clearfix"></div>
			<br>
			<hr>
 <b>Upload File:</b> <input type="file" name="file" id="fileupload" onchange="file_type();"/><br><br>
 				<form:errors path="file" cssClass="fileerror"></form:errors>
 				<span id="filespan" style="display:block;"></span>


<c:set var="count" value="0" scope="page" />

<script type="text/javascript">
var counter=${count};
</script>
    <c:forEach begin="2" end="${skill_size}">
    
   <c:set var="count" value="${count + 1}" scope="page"/>
   <script type="text/javascript">
   
   counter++;
   $('#dynamicInput').append("<div class='clearfix'></div><div class='pdd' id='dlt'><b style='margin-left:10px;'>Skill:</b><input type='text' style='margin-left: 49px;' placeholder='Skill Name' name='skill_name["+counter+"]' value='${sessionScope.sk.skill_name[count]}' class='comment'/><br><b style='margin-left:10px;'>Experience:</b><input type='text' style='margin-left:4px;' placeholder='Experience' name='experience_in_month["+counter+"]' value='${sessionScope.sk.experience_in_month[count]}' class='com'/><input type='hidden' name='user_skill_id["+counter+"]' value='${sessionScope.sk.user_skill_id[count]}'/><input type='hidden' name='user_id["+counter+"]' value='${sessionScope.sk.user_id[count]}'/><input type='hidden' name='skill_id["+counter+"]' class='skillid' value='${sessionScope.sk.skill_id[count]}'/><br><br><button class='deleter'>Remove Skill</button><br><br><hr></div>");
  
	
   </script>
</c:forEach>	
   
    <button style="margin-left: 10px;" type="submit" class="registerbtn">Register</button>
 
  <script type="text/javascript">
  var x=${count+1};

	$(document).ready(function(){
		$('#addskill').click(function() {
			
			   var skillval=document.getElementById("skill_name").value;
			    var experience=document.getElementById("experience_in_month").value;
			    if(skillval=="" || experience=="")
			    	{
			    	document.getElementById("emp").innerHTML="Fill all fields First!";
			    	document.getElementById("emp").style.color = 'red';
			    	}else
			    		{
			    		document.getElementById("emp").innerHTML="";
			$('#dynamicInput').append("<div class='clearfix'></div><div class='pdd' id='dlt'><b style='margin-left: 10px;'>Skill:</b><input type='text' style='margin-left: 49px;' placeholder='skill_name' name='skill_name["+x+"]' class='comment' /><br><b style='margin-left: 10px;'>Experience:</b><input type='text' style='margin-left:4px;' placeholder='Experience in months' name='experience_in_month["+x+"]'class='com'/><input type='hidden' name='user_id["+x+"]'/><input type='hidden' name='skill_id["+x+"]'/><br><br><button class='deleter'>Remove Skill</button><br><br><hr></div>");
			    		x++;
			    		}
			    		
			    		});
		var num=1;
		$(document).on('click', '.deleter',function(){
			counter--;
			var skillremove= $(this).parent().find('.skillid').val();
			if (skillremove == null){
				skillremove="invalid";
			}
			$.ajax({
				type: 'POST',
				url: '${pageContext.request.contextPath }/demo/skilldelete/' + skillremove
			});
		   $(this).parent().remove();
		 });
		
	});

  
  
  
  </script>
</form:form>
</section>
</main>



</body>
</html>