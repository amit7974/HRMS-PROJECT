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
<link href="${css}/style.css" rel="stylesheet">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.2/jquery.validate.min.js"
	integrity="sha512-UdIMMlVx0HEynClOIFSyOrPggomfhBKJE28LKl8yR3ghkgugPnG6iLfRfHwushZl1MOPSY6TsuBDGPK2X4zYKg=="
	crossorigin="anonymous"></script>
<script type="text/javascript">

function desc_verify()
{
	
	
	var qual=document.getElementById("qualification_desc").value;
	if(qual.length<3)
		{
	document.getElementById('descspan').style.color = 'red';
	document.getElementById("descspan").innerHTML="Valid Address";
		}else
			{
			
			document.getElementById("descspan").innerHTML="";
			}
}


function marks_verify() {
	var mark=document.getElementById("marks").value;
	if(mark.length<1)
		{
	document.getElementById('marksspan').style.color = 'red';
	document.getElementById("marksspan").innerHTML="Valid marks";
		}else
			{
			
			document.getElementById("marksspan").innerHTML="";
			}
}


function qualification_verify() {
	var qualn=document.getElementById("qualification_name").value;
	if(qualn.length<2)
		{
	document.getElementById('qualspan').style.color = 'red';
	document.getElementById("qualspan").innerHTML="Valid Name";
		}else
			{
			
			document.getElementById("qualspan").innerHTML="";
			}
}




</script>
<script type="text/javascript">
   $(document).ready(function() {
        $('form.commentForm').on('submit', function(event) {

            // adding rules for inputs with class 'comment'
            $('input.qname').each(function() {
                $(this).rules("add", 
                    {
                        required: true
                    })
            });          
			
            $('input.qdesc').each(function() {
                $(this).rules("add", 
                    {
                        required: true
                       
                    })
            });  
            
            $('input.mdetail').each(function() {
                $(this).rules("add", 
                    {
                        required: true,
                        number: true
                     
                    })
            });  
            // prevent default submit action         

$("#qualification_name").rules("add", {required:true});
            
$("#marks").rules("add", {required:true, number: true});

$("#qualification_desc").rules("add", {required:true});
        })

      

        // initialize the validator
        $('form.commentForm').validate();

   });


</script>

<title>Qualification Edit</title>
</head>
<body>
<main>
<section class="emp_reg" style="overflow: hidden;">
<form:form class="commentForm" action="qual_update" modelAttribute="qual_info"  method="POST" >
<h3 style="padding: 10px;color: #009688" class="text-center">Register</h3>
    <div class="step-row">
			<div id="progress3"></div>
			<div class="step-colc"><a href="registerback" style="background: #009688;"><small><b style="color: #F5F5F5;background: #009688">Basic details</b></small></a></div>
			<div class="step-colc"><a href="user_back" style="background: #009688;"><small><b style="color: #F5F5F5;background: #009688">User details</b></small></a></div>
			<div class="step-col3"><small><b style="color: #009688">Academics</b></small></div>
			<div class="step-colc"><small><b style="color: #F5F5F5;background: #009688;">Skill</b></small></div>
			
			
			</div>
			<br>
			<br>
    <hr>


<div class="clearfix"></div>
			<div class="pdd" id="dynamicInput">
<b style="margin-left: 10px;">Qualification Name:</b>

 <form:input type="text" style="margin-left:45px;" placeholder="Qualification Name" path="qualification_name" value="${sessionScope.user_academics.qualification_name[0]}"  id="qualification_name" onkeyup="qualification_verify();"/>
  <small><form:errors path="qualification_name" cssClass="error"/></small>
<small><span id="qualspan" style="margin-left: 200px;display:block;"></span></small>



<b style="margin-left: 10px;">Qualification Description:</b>
    <form:input type="text" cssStyle="margin-left:5px;" placeholder="Qualification Description" path="Qualification_Description" value="${sessionScope.user_academics.qualification_Description[0]}" id="qualification_desc" onkeyup="desc_verify();"/>
	<small><form:errors path="Qualification_Description" cssClass="error"/></small>
	<small><span id="descspan" style="margin-left: 200px;display:block;"></span></small>



<b style="margin-left: 10px;">Marks:</b>
    <form:input type="text" cssStyle="margin-left:132px;" placeholder="Percentage without % sign" path="Marks_Detail" id="marks" value="${sessionScope.user_academics.marks_Detail[0]}" onkeyup="marks_verify();"/>
	<small><form:errors path="Marks_Detail" cssClass="error"/></small>
	<small><span id="marksspan" style="margin-left: 200px;style="display:block;"></span></small>
	<small><span id="qual" style="display:block;margin-left: 200px;"></span></small>
	<br>
	<br>
	<hr>
	
	
    <form:input type="hidden" path="user_academic_qualification_id" value="${sessionScope.user_academics.user_academic_qualification_id[0]}"/>
	<form:input type="hidden" path="user_id" value="${sessionScope.user_academics.user_id[0]}"/>
	<form:input type="hidden" path="academic_qualification_id" value="${sessionScope.user_academics.academic_qualification_id[0]}"/>

    </div>
								
			<div class="addqual-btn">
			<button style="margin-left: 20px;width: 150px;" type="button" id="addqual" name="addqual" class="btn btn-info btn-sm">Add Qualification</button>
			
			</div>
			<div class="clearfix"></div>
			
  <c:set var="count" value="0" scope="page" />

<script type="text/javascript">
var counter=${count};
</script>
    <c:forEach begin="2" end="${qual_size}">
    
   <c:set var="count" value="${count + 1}" scope="page"/>
   <script type="text/javascript">
   
   counter++;
 //  $('#dynamicInput').append("<div class='clearfix'></div><div class='pdd' id='dlt'><br><b>Skill</b><input type='text' placeholder='skill_name' name='skill_name["+${count}+"]' value='${list[count]}' class='comment' /><br><b>Experience in months</b><input type='text' placeholder='Experience in months' name='experience_in_month["+${count}+"]'class='com'/><br><br><button class='deleter'>Remove Skill</button><br></div>");
   $('#dynamicInput').append("<div class='clearfix'></div><div class='pdd' id='dlt'><b style='margin-left:10px;'>Qualification Name:</b><input type='text' placeholder='Qualification Name' name='qualification_name["+counter+"]' value='${sessionScope.user_academics.qualification_name[count]}' class='qname'/><br><b style='margin-left:10px;'>Qualification Description:</b><input type='text' placeholder='Qualification Description' name='Qualification_Description["+counter+"]' value='${sessionScope.user_academics.qualification_Description[count]}' class='qdesc'/><br><b style='margin-left:10px;'>Marks:</b><input type='text' placeholder='Marks' name='Marks_Detail["+counter+"]' value='${sessionScope.user_academics.marks_Detail[count]}' class='mdetail'/><input type='hidden' name='user_academic_qualification_id["+counter+"]' value='${sessionScope.user_academics.user_academic_qualification_id[count]}'/><input type='hidden' name='user_id["+counter+"]' value='${sessionScope.user_academics.user_id[count]}'/><input type='hidden' name='academic_qualification_id["+counter+"]' class='acaqualid' value='${sessionScope.user_academics.academic_qualification_id[count]}'/><br><br><button class='deleter btn btn-info btn-sm'>Remove</button><br><br><hr></div>");
  
	
   </script>
</c:forEach>	
   <br>
   <button style="margin-left: 20px;width: 200px;background: #009688;color:white" type="submit"
					class="btn btn-md">Next</button>

<br><br>
 <script type="text/javascript">
var x=${count+1};

$(document).ready(function(){
	$('#addqual').click(function() {
		
		var qualname=document.getElementById("qualification_name").value;
		var qualdesc=document.getElementById("qualification_desc").value;
		var mar=document.getElementById("marks").value;
		
		if(qualname==""||qualdesc==""||mar=="")
		{
			document.getElementById("qual").innerHTML="Fill all fields First!";
	    	document.getElementById("qual").style.color = 'red';
		}else
		    		{
		    		document.getElementById("qual").innerHTML="";
		$('#dynamicInput').append("<div class='clearfix'></div><div class='pdd' id='dlt'><b style='margin-left:10px;'>Qualification Name:</b><input type='text' placeholder='Qualification Name' name='qualification_name["+x+"]' class='qname'/><br><b style='margin-left:10px;'>Qualification Description:</b><input type='text' placeholder='Qualification Description' name='Qualification_Description["+x+"]' class='qdesc'/><br><b style='margin-left:10px;'>Marks:</b><input type='text' placeholder='Marks' name='Marks_Detail["+x+"]' class='mdetail'/><input type='hidden' name='user_academic_qualification_id["+x+"]'/><input type='hidden' name='user_id["+x+"]'/><input type='hidden' name='academic_qualification_id["+x+"]'/><br><br><button class='deleter btn btn-info btn-sm'>Remove</button><br><br><hr></div>");
		    		x++;
		    		}
		    		
		    		});
	var num=1;
	$(document).on('click', '.deleter',function(){
		
		counter--;
		var qualremove= $(this).parent().find('.acaqualid').val();
		if (qualremove == null){
			qualremove="invalid";
			
		}
		$.ajax({
			type: 'POST',
			url: '${pageContext.request.contextPath }/demo/qualdelete/' + qualremove
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