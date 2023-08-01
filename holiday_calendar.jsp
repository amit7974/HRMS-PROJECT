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
<title>Holiday Calendar</title>

<!-- Bootstrap JS Requirements -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css">
<link href="${css}/home.css" rel="stylesheet">
<link href="${css}/style.css" rel="stylesheet">

</head>
<body>


<div class="content2">
<i onclick="toggleSideBar()" class="fas fa-bars barbtn" style="margin-left: 15px;"></i>
<section class="emp_reg2">
<form:form action="${contextRoot}/admin/save_holiday_calendar" method="post" modelAttribute="add_holiday" onsubmit="return validateForm()">

 <h3 style="padding: 20px;" class="text-info">Add Holiday</h3><br>

<b style="margin-left: 20px;" class="text-info">Calendar Year:</b>
<select name="calendar_year" style="margin-left:10px; width: 260px;border-radius: 0px;border-color: rgba(0,0,0,0.1);" id="calendar_year" onchange="setDateRange();holiday_data();empty_arr();">

</select><br><br>
<b style="margin-left: 20px;margin-right: 62px;" class="text-info">Region:</b>
<select id="region" style="width: 260px;border-radius: 0px;border-color: rgba(0,0,0,0.1);" onchange="addnew();">

</select>

<input type="hidden" name="info" id="info" value="">
<div id="txtbox" style="height:auto;margin-left:144px;margin-top:20px; width: 260px;border: thin;border-color: black;border-style: solid;max-height: 200px;overflow: auto;min-height: 50px;" ></div>

<div id="addnewdiv" style="margin-top: 20px;">
<b style="margin-left: 20px;" class="text-info">Country:</b>  
<form:select path="country" id="country" style="margin-left:54px;width: 260px;border-radius: 0px;border-color: rgba(0,0,0,0.1);" onchange="select_state();">
<form:option value="none">Select Country</form:option>
<c:forEach items="${country}" var="country">
<form:option value="${country}">${country}</form:option>
</c:forEach>

</form:select><br><br>
<b style="margin-left: 20px;" class="text-info">State:</b>  
<form:select path="state" style="margin-left:77px;width: 260px;border-radius: 0px;border-color: rgba(0,0,0,0.1);" id="state" onchange="select_cities()">
<form:option value="none">Select State</form:option>
</form:select><br><br>
<b style="margin-left: 20px;" class="text-info">City:</b> 
<form:select path="city" style="margin-left:86px;width: 260px;border-radius: 0px;border-color: rgba(0,0,0,0.1);" id="city">
<form:option value="none">Select City</form:option>
</form:select><br><br>
<button type="button" style="margin-left: 145px;width: 75px;height: 30px!important;padding: 0px!important;" class="btn btn-info btn-md" onclick="add_region()">Add New</button>
<button type="button" id="cancelbtn" style="margin-left: 10px;width: 75px;height: 30px!important;padding: 0px!important;" class="btn btn-secondary btn-md" onclick="cancelbt()">cancel</button>
<span style="display:inline-block;color:red;margin-left: 90px;" id="region_ext"></span>

</div>


<br>
<b style="margin-left: 20px;margin-top: 20px;" class="text-info">Date:</b> <form:input type="date" id="date" path="date" style="margin-left:81px;width: 260px;height:25px;margin-top: 20px;"  />
<span style="display: block;color:red;margin-left: 503px;" id="datespan"></span>
<br>


<b style="margin-left: 20px;" class="text-info">Description:</b>
<form:input type="input" style="margin-left:30px;width: 260px;height:25px" path="holiday_description" id="description" placeholder="Holiday Description" /> 
<span style="display: block;color:red;margin-left: 180px;" id="descriptionspan"></span>
<br>


<br>
<button style="margin-left: 20px;width: 200px;" type="submit"
					class="btn btn-info btn-md">Add Calendar</button>
<br><br>
</form:form>
</section>
<br><br>
</div>
<script type="text/javascript">
$("#region").select2();

$("#txtbox").hide();

function select_state()
{
	var country=$('#country').val();
	$.ajax({
		type:'POST',
		url:'${contextRoot}/admin/getOfficeState/'+country,
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
		url:'${contextRoot}/admin/getOfficeCity/'+state,
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
$("#addnewdiv").children().prop('disabled',true);
$("#addnewdiv").hide();	
function add_region()
{
	if($("#city").val()=="none" || $("#state").val()=="none" || $("#country").val()=="none")
	{
		alert("Select valid City,State or Country!");
		return false;
	}else
		{
	var year=$("#calendar_year").val();
	var city=$("#city").val();
	var state=$("#state").val();
	var country=$("#country").val();
	
	$.ajax({
		type:"POST",
		url: "${contextRoot}/admin/add_region/"+year+'/'+city+'/'+state+'/'+country,
		success:function(result)
		{
			if(result==0)
				{
				$("#region_ext").html("Region already exists");
				}else{
					$("#region_ext").html("");
					alert("Region added successfully!");
					holiday_data();

					
				}
		}
	});
		}
}


setDateRange();
function setDateRange()
{
	var val=$("#calendar_year").val();
	$("#date").val("");
	$("#date").attr('min',''+val+'-01-01');
	$("#date").attr('max',''+val+'-12-31');
}

$("#cancelbtn").hide();

function cancelbt()
{
	$("#cancelbtn").hide();
	$("#disable_div").children().prop('disabled',false);
	$("#addnewdiv").children().prop('disabled',true);
	$("#addnewdiv").hide();
	$("#disable_div").show();
}

function holiday_data()
{
	
	cancelbt();
var year=$("#calendar_year").val();
$.ajax({
	type:"POST",
	url: "${contextRoot}/admin/cal_year/"+year,
	success:function(result)
	{
		$(".reg").remove();
		$("#region").append('<option class="reg" value="">Select regions</option>');
		for(var i=0;i<result.length;i++)
			{
		$("#region").append("<option class='reg sss' value="+result[i].holiday_calendar_id+">"+result[i].holiday_calendar_id+" - "+result[i].city+", "+result[i].state+", "+result[i].country+"  "+"</option>");
			}
		$("#region").append('<option class="reg rrr" value="addnew">Add new region</option>');
		
			}
});
}


function validateForm()
{
	if(arr=="")
		{
		alert("select atleast one region first!");
		return false;
		}
	
	$("#info").val(arr);
	
	if(!$("#city").is(':disabled'))
	{
		alert("add region first or cancel first!");
		return false;
	}
	
	if($("#date").val()=="")
	{
		$("#datespan").html("select date!");
		return false;
	}else
		{
		$("#datespan").html("");
		}
	if($("#description").val()=="")
	{
		$("#descriptionspan").html("Enter description!");
		return false;
	}else
		{
		$("#descriptionspan").html("");
		}
	alert("Holiday Added Successfully!!!");
}
addYear();
function addYear() {
	   var currentYear = new Date().getFullYear();  
	   
	    for (var i = 1; i <= 5; i++ ) {
	        $("#calendar_year").append(
	            
	            $("<option></option>")
	                .attr("value", currentYear)
	                .text(currentYear)
	            
	        );
	        currentYear++;
	    }
	}
	
var arr=[];
function addnew()
{
	
var texts=$("#region option:selected").text();
var val=$("#region").val();
if(arr.includes(val)==false && val!="addnew" && val!="")
	{
	$("#txtbox").show();
arr.push(val);
var text = "";
text += texts+' x';
text = text.substring(0,text.length);
$('#txtbox').append('<button type="button" style="border-color: rgba(0,0,0,0.1);background:#e0ffff;margin-top:1px;margin-bottom:1px;margin-left:1px;padding-left:3px;" onclick=remove_me(this,"'+val+'")>'+text+'</button>');
	}else if(val=="addnew" || val=="")
		{
		
		}
		else
			{
			alert("You have already selected this value!");
			}
		
if(val=="addnew")
{
$("#cancelbtn").show();
$("#addnewdiv").children().prop('disabled',false);
$("#addnewdiv").show();	
}else{
		cancelbt();
		}


}
function remove_me(el,val)
{
	var index = arr.indexOf(val);
	if (index !== -1) {
	  arr.splice(index, 1);
	}
var elem=el;
elem.remove();
if(arr=="")
	{
	$("#txtbox").hide();
	$("#region").val('');
	}
}

function empty_arr()
{
	$("#txtbox").hide();
arr=[];
$('#txtbox').empty();
}
holiday_data();

$(document).ready(function(){
	 
    $(".item").removeClass('active');
    $(".add_holiday_link").addClass('active');
 
});
</script>
</body>
</html>