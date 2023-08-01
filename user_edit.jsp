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
<title>Academics Details</title>
<link href="${css}/style.css" rel="stylesheet">
<style>
a:link {
	text-decoration: none;
}

a:link {
	color: white;
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
select
{
border-radius: 0px;
border-color: rgba(0,0,0,0.1);

}
label
{

font-weight: 500;
}
</style>
<script src="${js}/jquery-1.7.1.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="register">
		<section class="glass2">
			<form:form action="user_update" method="post" modelAttribute="uinfo"
				onsubmit="return validateForm()">



				<h3 style="padding: 10px;color: #009688" class="text-center">Register</h3>

				<div class="step-row">
					<div id="progress2"></div>
					<div class="step-colb"><a href="registerback"><small><label style="color: #F5F5F5; background: #009688;;">Basic details</label></small></a></div>
					<div class="step-col2"><small><label style="margin-left: 10px;color: #009688">User details</label></small></div>
					<div class="step-colb"><small><label style="color: #F5F5F5; background: #009688;;">Academics</label></small></div>
					<div class="step-colb"><small><label style="color: #F5F5F5; background: #009688;;">Skill</label></small></div>

				</div>

				<label style="margin-left: 10px;" class="text-info">Email:</label>
				<input style="margin-left: 66px;" type="text" id="eml"
					disabled="disabled" value="${sessionScope.user.user_name}" />

				<br>

				<label style="margin-left: 10px;" class="text-info">First Name:</label>
				<form:input type="text" style="margin-left: 25px;"
					placeholder="First Name" id="first_name" path="first_name"
					value="${sessionScope.profile.first_name}" onkeyup="fnamecheck();" />
				<small><form:errors path="first_name" style="display:block;margin-left:120px;" cssClass="error" /></small>
				<small><span class="spn" style="margin-left: 120px;" id='first'></span></small>


				<label style="margin: 10px;" class="text-info">Middle Name:</label>
				<form:input type="text" style="margin-left:-4px;"
					placeholder="Middle Name" id="middle_name" path="middle_name"
					value="${sessionScope.profile.middle_name}" onkeyup="mnamecheck();" />

				<br>
				<small><form:errors path="middle_name" style="display:block;margin-left:120px;" cssClass="error" /></small>
				<small><span class="spn" style="margin-left: 120px;" id='middle'></span></small>

				<label style="margin-left: 10px;" class="text-info">Last Name:</label>
				<form:input type="text" style="margin-left: 28px;"
					placeholder="Last Name" id="last_name" path="last_name"
					value="${sessionScope.profile.last_name}" onkeyup="lnamecheck();" />
				<small> <form:errors path="last_name" style="display:block;margin-left:120px;" cssClass="error" /></small>
				<small><span class="spn" style="margin-left: 120px;" id='last'></span></small>



				<label style="margin: 10px;" class="text-info">Phone:</label>
				<form:input type="text" style="margin-left: 49px;"
					placeholder="Mobile no." path="phone"
					value="${sessionScope.profile.phone}" id="phone"
					onkeyup="phone_verify();" />
				<br>
				<small><form:errors path="phone" style="display:block;margin-left:120px;" cssClass="error" /></small>
				<small><span class="spn" style="margin-left: 120px;" id="phonespan"></span></small>

				<br>
				
				<label style="margin-left: 10px;" class="text-info">Current Address</label>
				<br>

				<label style="margin-left: 10px;" class="text-info">Address Line 1:</label>
				<form:input type="text" placeholder="Address" path="Address_line_1"
					value="${sessionScope.profile.address_line_1}" id="address"
					style="width:200px;height:15px;"
					onkeyup="address_verify();copytext();" />
				<small> <form:errors path="Address_line_1" style="display:block;margin-left:120px;" cssClass="error" /></small>
				<small><span class="spn" style="margin-left: 120px;" id="addressspan"></span></small>



				<label for="address2"><label style="margin-left: 10px;" class="text-info">Address Line 2:</label></label>
				<form:input type="text" placeholder="optional" path="Address_line_2"
					value="${sessionScope.profile.address_line_2}"
					style="width:200px;height:15px;" id="address2"
					onkeyup="copytext();" />
				<small> <form:errors path="Address_line_2" style="display:block;margin-left:120px;" cssClass="error" /></small><br>
				<label for="landmark"> <br> <label style="margin-left: 10px;" class="text-info">Landmark:</label></label>
				<form:input type="text" placeholder="optional"
					style="width:200px;height:15px;margin-left:32px;" path="landmark"
					value="${sessionScope.profile.landmark}" id="landmark"
					onkeyup="copytext();" />
				<small> <form:errors path="landmark" style="display:block;margin-left:120px;" cssClass="error" /></small>
				<br>


				<label style="margin-left: 10px;" class="text-info">Country</label>

				<form:select path="country_name" id="comboboxCountry"
					style="width:200px;margin-left:50px;margin-top:15px;"
					onchange="copycon();select_state();">
					<c:choose>
    				<c:when test="${not empty sessionScope.address.country_name}">
        				<option value="${sessionScope.address.country_name}">${sessionScope.address.country_name}</option>
    					</c:when>    
    				<c:otherwise>
        					<option value="select country">Select Country</option>
    					</c:otherwise>
						</c:choose>
							
					<c:forEach var="country" items="${country}">
						<form:option value="${country}">${country}</form:option>
					</c:forEach>
				</form:select>
				<small><span class="spn" style="margin-left: 120px;" id="countryspan"></span></small>
				<small><form:errors style="display:block;margin-left:120px;"
						path="country_name" cssClass="error" /></small>






				<label style="margin-left: 10px;" class="text-info">State</label>

				<form:select path="state_name" id="comboboxState"
					style="width:200px;margin-left:72px;" onchange="copycon();select_cities();">
					<form:option value="${sessionScope.address.state_name}">${sessionScope.address.state_name}</form:option>
				</form:select>
				<small><span class="spn" style="margin-left: 120px;" id="statespan"></span></small>
				<small><form:errors path="state_name" style="display:block;margin-left:120px;" cssClass="error" /></small>
				
				<label style="margin-left: 10px;" class="text-info">City</label>

				<form:select path="city_name" id="comboboxCity"
					style="width:200px;margin-left:81px;" onchange="copycon();">
					<form:option value="${sessionScope.address.city_name}">${sessionScope.address.city_name}</form:option>
				</form:select>
				<small><span class="spn" style="margin-left: 120px;" id="cityspan"></span></small>
				<small><form:errors path="city_name" style="display:block;margin-left:120px;" cssClass="error" /></small>





				<div id="city_other" style="display: none">
					<label style="margin-left: 10px;" class="text-info">City Name: </label> <input type="text" path="city_name"
						id="cityvalue" placeholder="City"
						style="width: 30%; height: 10px" onkeyup="setvalue();" />
				</div>



				<label for="pin_code"><label style="margin-left: 10px;" class="text-info">PinCode:</label></label>
				<form:input type="text" placeholder="PinCode"
					value="${sessionScope.profile.pin_code}" path="pin_code"
					id="pin_code" style="width:200px;margin-left:43px;"
					onkeyup="pin_verify();" />
				<small> <form:errors path="pin_code" style="display:block;margin-left:120px;" cssClass="error" /></small>
				<small><span class="spn" style="margin-left: 120px;" id="pinspan"></span></small>


				<br>
				
				


				<label style="margin-left: 10px;" class="text-info">Permanent Address</label>
				<br>
				<input type="checkbox" id="chkbox" style="margin-left: 10px;" onchange="handleChange();">
				<small><label style="opacity: 0.5;">Same as Corresponding</label> </small>
				<br>


				<div class="abc1" id="abc1" style="display: inline">
					<div id="abcd1" class="abcd" style="display: inline">
						<label for="addressp"><label style="margin-left: 10px;" class="text-info">Address Line 1:</label></label>
						<form:input type="text" placeholder="Address"
							path="addressp" value="${sessionScope.profile.addressp}"
							id="addressp" style="width:200px;height:15px;"
							onkeyup="address_verifyp();" />
						<form:errors path="addressp" style="display:block;margin-left:120px;" cssClass="error" />

						<small><span class="spn" style="margin-left: 120px;" id="addressspanp"></span></small>
					</div>
				</div>


				<div class="abc2" id="abc2" style="display: inline">
					<div id="abcd2" class="abcd" style="display: inline">

						<label for="address2p"><label style="margin-left: 10px;" class="text-info">Address Line 2:</label></label>
						<form:input type="text" placeholder="optional" path="address2p"
							value="${sessionScope.profile.address2p}"
							style="width:200px;height:15px;" id="address2p" />

						<small><form:errors path="address2p" style="display:block;margin-left:120px;" cssClass="error" /></small>
					</div>
				</div>

				<br>

				<div class="abc3" id="abc3" style="display: inline">
					<div id="abcd3" class="abcd" style="display: inline">
						<label for="landmarkp"><label style="margin-left: 10px;" class="text-info">Landmark:</label></label>
						<form:input type="text" placeholder="optional"
							style="width:200px;height:15px;margin-left:33px;"
							path="landmarkp" value="${sessionScope.profile.landmarkp}"
							id="landmarkp" />
						<small><form:errors path="landmarkp" style="display:block;margin-left:120px;" cssClass="error" /></small>
					</div>
				</div>

				<br>
				<div class="abc4" id="abc4" style="display: inline">
					<div id="abcd4" class="abcd" style="display: inline">
						<label style="margin-left: 10px;" class="text-info">Country</label> <select name="country_namep" id="comboboxCountry2"
							style="width: 200px; margin-left: 52px; margin-top: 15px;" onchange="select_state2();">
							
							<c:choose>
    				<c:when test="${not empty sessionScope.address2.country_namep}">
        				<option value="${sessionScope.address2.country_namep}">${sessionScope.address2.country_namep}</option>
    					</c:when>    
    				<c:otherwise>
        					<option value="select country">Select Country</option>
    					</c:otherwise>
						</c:choose>
							
							
							
							<c:forEach var="country" items="${country}">
								<option value="${country}">${country}</option>
							</c:forEach>
						</select> <small><span class="spn" style="margin-left: 120px;" id="countryspanp"></span></small>

					</div>
				</div>
				<br>
				<div class="abc5" id="abc5" style="display: inline">
					<div id="abcd5" class="abcd" style="display: inline">

						<label style="margin-left: 10px;" class="text-info">State</label> <select name="state_namep" id="comboboxState2"
							style="width: 200px; margin-left: 74px;" onchange="select_cities2();">
							<option value="${sessionScope.address2.state_namep}">${sessionScope.address2.city_namep}</option>
						</select> <small><span class="spn" style="margin-left: 120px;" id="statespanp"></span></small>

					</div>
				</div>


				<br>
				<div class="abc6" id="abc6" style="display: inline">
					<div id="abcd6" class="abcd" style="display: inline">
						<label style="margin-left: 10px;" class="text-info">City</label> <select name="city_namep" id="comboboxCity2"
							style="width: 200px; margin-left: 83px;">
							<option value="${sessionScope.address2.city_namep}">${sessionScope.address2.city_namep}</option>
						</select> <small><span class="spn" style="margin-left: 120px;" id="cityspanp"></span></small>

					</div>
				</div>






				<div class="abc7" id="abc7" style="display: inline">
					<div id="abcd7" class="abcd" style="display: inline">

						<label for="pin_codep"><label style="margin-left: 10px;" class="text-info">PinCode:</label></label>
						<form:input type="text" placeholder="PinCode"
							path="pin_codep" value="${sessionScope.profile.pin_codep}"
							style="width:200px;height:15px;margin-left:44px;" id="pin_codep"
							onkeyup="pin_verifyp();" />
						<small> <form:errors path="pin_codep" style="display:block;margin-left:120px;" cssClass="error" /></small>
						<small><span class="spn" style="margin-left: 120px;" id="pinspanp"></span></small>

					</div>
				</div>



				<input type="hidden" name="address_type" id="address_type" value="c" />
				<input type="hidden" name="address_typep" id="address_typep"
					value="p" />
				<br>
				<label style="margin-left: 10px;" class="text-info">Gender:</label>
				<form:select path="gender" style="margin-left: 51px;">
					<form:option value="male" label="Male" />
					<form:option value="female" label="Female" />
					<form:option value="other" label="Other" />

				</form:select>

				<br>
				<br>
				<label style="margin-left: 10px;" class="text-info">Date of birth: &nbsp;</label>
				<form:input type="date" placeholder="Date of Birth"
					style="margin-left: 5px;height:25px;" path="dob"
					value="${sessionScope.profile.dob}" id="dob"
					onchange="date_change();" />
				<br>
				<small><form:errors path="dob" style="display:block;margin-left:120px;" cssClass="error" /></small>
				<small><span class="spn" style="margin-left: 120px;" id="dobspan"></span></small>
				<br>


				 <button style="margin-left: 20px;width: 200px;background: #009688;color:white" type="submit"
					class="btn btn-md">Next</button>

					
					<br>
					<br>

				

<script type="text/javascript">
//$(document).ready(function(){
select_state();
select_state2();
var ctry=$('#comboboxCountry').val();
function select_state2()
{
	var country=$('#comboboxCountry2').val();
	$.ajax({
		type:'POST',
		url:'${contextRoot}/admin/getStates/'+country,
		success:function(result)
		{
			if(ctry=="select country")
				{
				var s = '<option value="select state">Select State</option>';
				}else
					{
			var s = '<option value="${sessionScope.address2.state_namep}">${sessionScope.address2.state_namep}</option>';
					}
			for(var i = 0; i < result.length; i++) {
				s += '<option value="' + result[i] + '">' + result[i] + '</option>';
			}
			
			$('#comboboxState2').html(s);
			select_cities2();
		}
		
		
	});
	
		
}

function select_cities2()
{
	var state=$('#comboboxState2').val();
	$.ajax({
		type:'POST',
		url:'${contextRoot}/admin/getCities/'+state,
		success:function(result)
		{
			if(ctry=="select country")
			{
			var s = '<option value="select city">Select City</option>';
			}else{
			var s = '<option value="${sessionScope.address2.city_namep}">${sessionScope.address2.city_namep}</option>';
			}
			for(var i = 0; i < result.length; i++) {
				s += '<option value="' + result[i] + '">' + result[i] + '</option>';
			}
			
			$('#comboboxCity2').html(s);
		}
		
		
	});
	
	 
}

//});


function handleChange() {
	if($('#chkbox').is(":checked")) {
        
    	$(".abcd").remove();
    	
    	$("#abc1").append('<div id="abcd1" class="abcd" style="display: inline"><label for="addressp"><label style="margin-left: 10px;" class="text-info">Address Line 1:</label></label> <input type="text" name="addressp" placeholder="Address" readonly = "true" id="addressp" class="addressp"  style="width:200px;height:15px;" /><br></div>');
    	$("#abc2").append('<div id="abcd2" class="abcd" style="display: inline"><label for="address2p"><label style="margin-left: 10px;" class="text-info">Address Line 2:</label></label> <input type="text" name="address2p" placeholder="optional" class="address2p" readonly = "true" style="width:200px;height:15px;" id="address2p"  /></div>');
    	$("#abc3").append('<div id="abcd3" class="abcd" style="display: inline"><label for="landmarkp"><label style="margin-left: 10px;" class="text-info">Landmark:</label></label> <input type="text" style="width:200px;height:15px;margin-left:33px;" name="landmarkp" placeholder="optional" class="landmarkp" readonly = "true" id="landmarkp" /></div>');
    	$("#abc4").append('<div id="abcd4" class="abcd" style="display: inline"><label style="margin-left: 10px;" class="text-info">Country</label><select name="country_namep" selected="selected" id="comboboxCountryp" class="comboboxCountryp" readonly = "true" style="width:200px;margin-left:55px;margin-top:15px!important;"></select></div>');
    	$("#abc5").append('<div id="abcd5" class="abcd" style="display: inline"><label style="margin-left: 10px;" class="text-info">State</label><select name="state_namep" id="comboboxStatep" class="comboboxStatep" selected="selected" readonly = "true" style="width:200px;margin-left:77px;margin-top:25px!important;"></select></div>');
    	$("#abc6").append('<div id="abcd6" class="abcd" style="display: inline"><label style="margin-left: 10px;" class="text-info">City</label><select name="city_namep" id="comboboxCityp" class="comboboxCityp" selected="selected" readonly = "true" style="width:200px;margin-left:86px;margin-top:25px!important;"></select><br></div>');
    	$("#abc7").append('<div id="abcd7" class="abcd" style="display: inline"><label for="pin_codep"><label style="margin-left: 10px;" class="text-info">PinCode:</label></label><input type="text" placeholder="PinCode"  name="pin_codep" class="pin_codep" style="width:200px;height:15px;margin-left:49px;" id="pin_codep"/><br></div>');
    	
    	$("#addressp").val($("#address").val());
    	$("#address2p").val($("#address2").val());
    	$("#landmarkp").val($("#landmark").val());
    	$("#pin_codep").val($("#pin_code").val());
    	 var country = document.getElementById("comboboxCountry").value;
    	var state = document.getElementById("comboboxState").value;
    	var city = document.getElementById("comboboxCity").value;
    	
    	  var coun = document.getElementById("comboboxCountryp");
    	  var option = document.createElement("option");
    	  option.text = country;
    	  coun.add(option);
    	  
    	  var stat = document.getElementById("comboboxStatep");
    	  var option2 = document.createElement("option");
    	  option2.text = state;
    	  stat.add(option2);
    	  
    	  var cit = document.getElementById("comboboxCityp");
    	  var option3 = document.createElement("option");
    	  option3.text = city;
    	  cit.add(option3);
    	
    	  $("#address_type").val("pc");
    	  $("#address_typep").val("pc");
	}else{
    	$(".abcd").remove();
    	
    	$("#abc1").append('<div id="abcd1" class="abcd" style="display: inline"><label for="addressp"><label style="margin-left: 10px;" class="text-info">Address Line 1:</label></label> <form:input type="text" placeholder="Address" path="Addressp" id="address2p" style="width:200px;height:15px;" onkeyup="address_verifyp();"/><form:errors path="Addressp" cssClass="error"/><span id="addressspanp"></span><br></div>');
    	$("#abc2").append('<div id="abcd2" class="abcd" style="display: inline"><label for="address2p"><label style="margin-left: 10px;" class="text-info">Address Line 2:</label></label> <form:input type="text" placeholder="optional" path="Address2p" style="width:200px;height:15px;" id="address2p" /><form:errors path="Address2p" cssClass="error"/></div>');
    	$("#abc3").append('<div id="abcd3" class="abcd" style="display: inline"><label for="landmarkp"><label style="margin-left: 10px;" class="text-info">Landmark:</label></label> <form:input type="text" placeholder="optional" style="width:200px;height:15px;margin-left:33px;" path="landmarkp" id="landmarkp" /><form:errors path="landmarkp" cssClass="error"/></div>');
    	$("#abc4").append('<div id="abcd4" class="abcd" style="display: inline"><label style="margin-left: 10px;" class="text-info">Country</label><form:select path="country_namep" id="comboboxCountry2" style="width:200px;margin-left:55px;margin-top:15px;" onchange="select_state2();"><form:option  value="select a country" >Select a Country</form:option><c:forEach var="country" items="${country }"><form:option value="${country}">${country}</form:option></c:forEach></form:select><span id="countryspanp"></span><form:errors path="country_namep" cssClass="error"/></div>');
    	$("#abc5").append('<div id="abcd5" class="abcd" style="display: inline"><label style="margin-left: 10px;" class="text-info">State</label><form:select path="state_namep" id="comboboxState2" style="width:200px;margin-left:77px;margin-top:25px;" onchange="select_cities2();"><form:option value="select a state">Select a State</form:option></form:select><span id="statespanp"></span><form:errors path="state_namep" cssClass="error"/></div>');
    	$("#abc6").append('<div id="abcd6" class="abcd" style="display: inline"><label style="margin-left: 10px;" class="text-info">City</label><form:select path="city_namep" id="comboboxCity2" style="width:200px;margin-left:86px;margin-top:25px;"><form:option value="select a city">Select a City</form:option></form:select><span id="cityspanp"></span><form:errors path="city_namep" cssClass="error"/><br></div>');
    	$("#abc7").append('<div id="abcd7" class="abcd" style="display: inline"><label for="pin_codep"><label style="margin-left: 10px;" class="text-info">PinCode:</label></label><form:input type="text" placeholder="PinCode"  path="pin_codep" style="width:200px;height:15px;margin-left:49px;" id="pin_codep" onkeyup="pin_verifyp();"/><form:errors path="pin_codep" cssClass="error"/><span id="pinspanp"></span><br></div>');
   
    	$("#address_type").val("c");
    	$("#address_typep").val("p");
    	 
    
    
    }
}
function date_change()
{
	
	var date=document.getElementById("dob").value;
	
	
	
	}
function select_state()
{
	var country=$('#comboboxCountry').val();
	$.ajax({
		type:'POST',
		url:'${contextRoot}/admin/getStates/'+country,
		success:function(result)
		{
			if(ctry=="select country")
			{
			var s = '<option value="select state">Select State</option>';
			}else
				{
			var s = '<option value="${sessionScope.address.state_name}">${sessionScope.address.state_name}</option>';
				}
			for(var i = 0; i < result.length; i++) {
				s += '<option value="' + result[i] + '">' + result[i] + '</option>';
			}
			
			$('#comboboxState').html(s);
			select_cities();
		}
		
		
	});
	
		
}

function select_cities()
{
	var state=$('#comboboxState').val();
	$.ajax({
		type:'POST',
		url:'${contextRoot}/admin/getCities/'+state,
		success:function(result)
		{
			if(ctry=="select country")
			{
			var s = '<option value="select city">Select City</option>';
			}else
				{
			var s = '<option value="${sessionScope.address.city_name}">${sessionScope.address.city_name}</option>';
				}
			for(var i = 0; i < result.length; i++) {
				s += '<option value="' + result[i] + '">' + result[i] + '</option>';
			}
			
			$('#comboboxCity').html(s);
		}
		
		
	});
	
	 
}

/* $(document).ready(function(){

	//$('#comboboxCountry').on('change', function(){
		var countryId = $("#comboboxCountry").val();
		
		
		//$('#comboboxCity').empty().append('<option selected="selected" value="">Select a City</option>');
		
		$.ajax({
			type: 'GET',
			url: '${pageContext.request.contextPath }/demo/loadStatesByCountry/' + countryId,
			success: function(result) {
				var result = JSON.parse(result);
				
				var s = '';
				s+='<option value="${sessionScope.address.state_name}">${sessionScope.address.state_name}</option>';
				for(var i = 0; i < result.length; i++) {
					s += '<option value="' + result[i].state_name + '">' + result[i].state_name + '</option>';
				}
				
				$('#comboboxState').html(s);
			}
		});
	//});


		$.ajax({
			type: 'GET',
			url: '${pageContext.request.contextPath }/demo/loadCitiesByState/${sessionScope.address.state_name}',
			success: function(result) {
				var result = JSON.parse(result);
				
				var s = '';
				s+='<option value="${sessionScope.address.city_name}">${sessionScope.address.city_name}</option>';
				for(var i = 0; i < result.length; i++) {
					s += '<option value="' + result[i].city_name + '">' + result[i].city_name + '</option>';
				}
				s+='<option value="other">other</option>';
				$('#comboboxCity').html(s);
			}
		});
$('#comboboxState').on('change', function(){
		var stateId = $("#comboboxState").val();
		
		$.ajax({
			type: 'GET',
			url: '${pageContext.request.contextPath }/demo/loadCitiesByState/' + stateId,
			success: function(result) {
				var result = JSON.parse(result);
				
				var s = '';
				s+='<option value="select a city">Select a City</option>';
				for(var i = 0; i < result.length; i++) {
					s += '<option value="' + result[i].city_name + '">' + result[i].city_name + '</option>';
				}
				s+='<option value="other">other</option>';
				$('#comboboxCity').html(s);
			}
		});
	});	
});


$(document).ready(function(){

	//$('#comboboxCountry').on('change', function(){
		var countryId = $("#comboboxCountry2").val();
		
		
		//$('#comboboxCity').empty().append('<option selected="selected" value="">Select a City</option>');
		
		$.ajax({
			type: 'GET',
			url: '${pageContext.request.contextPath }/demo/loadStatesByCountry/' + countryId,
			success: function(result) {
				var result = JSON.parse(result);
				
				var s = '';
				s+='<option value="${sessionScope.address2.state_namep}">${sessionScope.address2.state_namep}</option>';
				for(var i = 0; i < result.length; i++) {
					s += '<option value="' + result[i].state_name + '">' + result[i].state_name + '</option>';
				}
				
				$('#comboboxState2').html(s);
			}
		});
	//});


		$.ajax({
			type: 'GET',
			url: '${pageContext.request.contextPath }/demo/loadCitiesByState/${sessionScope.address2.state_namep}',
			success: function(result) {
				var result = JSON.parse(result);
				
				var s = '';
				s+='<option value="${sessionScope.address2.city_namep}">${sessionScope.address2.city_namep}</option>';
				for(var i = 0; i < result.length; i++) {
					s += '<option value="' + result[i].city_name + '">' + result[i].city_name + '</option>';
				}
				s+='<option value="other">other</option>';
				$('#comboboxCity2').html(s);
			}
		});
$('#comboboxState2').on('change', function(){
		var stateId = $("#comboboxState2").val();
		
		$.ajax({
			type: 'GET',
			url: '${pageContext.request.contextPath }/demo/loadCitiesByState/' + stateId,
			success: function(result) {
				var result = JSON.parse(result);
				
				var s = '';
				s+='<option value="select a city">Select a City</option>';
				for(var i = 0; i < result.length; i++) {
					s += '<option value="' + result[i].city_name + '">' + result[i].city_name + '</option>';
				}
				s+='<option value="other">other</option>';
				$('#comboboxCity2').html(s);
			}
		});
	});	
});
 */


if("${sessionScope.address.address_type}"=="pc")
	{
	$('#chkbox').prop('checked', true).change();
	}
	
	function copytext()
	{
		$(".addressp").val($("#address").val());
    	$(".address2p").val($("#address2").val());
    	$(".landmarkp").val($("#landmark").val());
    	$(".pin_codep").val($("#pin_code").val());
	}
	
	function copycon()
	{
		
		var country = document.getElementById("comboboxCountry").value;
    	var state = document.getElementById("comboboxState").value;
    	var city = document.getElementById("comboboxCity").value;
 
    	 $('.comboboxCountryp').append('<option selected="selected" value="'+country+'">'+country+'</option>'); 
     	$('.comboboxCountryp option:eq(0)').remove();
     	
    	 $('.comboboxStatep').append('<option selected="selected" value="'+state+'">'+state+'</option>'); 
    	$('.comboboxStatep option:eq(0)').remove();
    	 
    	$('.comboboxCityp').append('<option selected="selected" value="'+city+'">'+city+'</option>'); 
     	$('.comboboxCityp option:eq(0)').remove();
    	
	}
	
	



function address_verifyp() {
	var addressp = document.getElementById("addressp").value;
	if (addressp.length < 3) {
		document.getElementById('addressspanp').style.color = 'red';
		document.getElementById("addressspanp").innerHTML = " Enter valid address";
	} else {
		document.getElementById('addressspanp').innerHTML = "";
	}
}
function pin_verifyp() {

	var pinp = document.getElementById("pin_codep").value;
	if (!pinp.match(/^\d{6}$/)) {
		document.getElementById('pinspanp').style.color = 'red';
		document.getElementById("pinspanp").innerHTML = " valid pin code";
	} else {
		document.getElementById('pinspanp').innerHTML = "";
	}
}

	var fnamecheck = function() {
		var f = document.getElementById('first_name').value;
		if (f.length < 3 || !f.match(/^[a-zA-Z]+$/)) {
			document.getElementById('first').style.color = 'red';
			document.getElementById('first').innerHTML = ' Valid Name';
			return false;
		} else {
			document.getElementById('first').style.color = 'green';
			document.getElementById('first').innerHTML = '';
			return true;
		}
	}
	var mnamecheck = function() {
		var m = document.getElementById('middle_name').value;
		if (!m.match(/^[a-zA-Z]*$/)) {
			document.getElementById('middle').style.color = 'red';
			document.getElementById('middle').innerHTML = ' Valid Name';
			return false;
		} else {
			document.getElementById('middle').style.color = 'green';
			document.getElementById('middle').innerHTML = '';
			return true;
		}
	}
	var lnamecheck = function() {
		var l = document.getElementById('last_name').value;
		if (l.length < 3 || !l.match(/^[a-zA-Z]+$/)) {
			document.getElementById('last').style.color = 'red';
			document.getElementById('last').innerHTML = ' Valid Name';
			return false;
		} else {
			document.getElementById('last').style.color = 'green';
			document.getElementById('last').innerHTML = '';
			return true;
		}
	}

	function address_verify() {
		var address = document.getElementById("address").value;
		if (address.length < 3) {
			document.getElementById('addressspan').style.color = 'red';
			document.getElementById("addressspan").innerHTML = "Enter valid address";
		} else {
			document.getElementById('addressspan').innerHTML = "";
		}
	}
	
	function phone_verify() {
		var phone = document.getElementById("phone").value;
		if (!phone.match(/^\d{10}$/)) {
			document.getElementById('phonespan').style.color = 'red';
			document.getElementById("phonespan").innerHTML = " valid phone number";
		} else {
			document.getElementById('phonespan').innerHTML = "";
		}

	}

	function pin_verify() {

		var pin = document.getElementById("pin_code").value;
		if (!pin.match(/^\d{6}$/)) {
			document.getElementById('pinspan').style.color = 'red';
			document.getElementById("pinspan").innerHTML = " valid pin code";
		} else {
			document.getElementById('pinspan').innerHTML = "";
		}
	}
 
	function validateForm() {
		
		var f = document.getElementById('first_name').value;
		if (f.length < 3 || !f.match(/^[a-zA-Z]+$/)) {
			document.getElementById('first').style.color = 'red';
			document.getElementById('first').innerHTML = ' Valid Name';
			return false;
		} else {
			document.getElementById('first').innerHTML = '';
		}
		
		var last = document.getElementById('last_name').value;
		if (last.length < 3 || !last.match(/^[a-zA-Z]+$/)) {
			document.getElementById('last').style.color = 'red';
			document.getElementById('last').innerHTML = ' Valid Name';
			return false;
		} else {
			document.getElementById('last').innerHTML = '';
		}
		
		var phone = document.getElementById("phone").value;
		if (!phone.match(/^\d{10}$/)) {
			document.getElementById('phonespan').style.color = 'red';
			document.getElementById("phonespan").innerHTML = " valid phone number";
			return false;
		}else
			{
			document.getElementById("phonespan").innerHTML = "";
			}
		var address = document.getElementById("address").value;
		if (address.length < 3) {
			document.getElementById('addressspan').style.color = 'red';
			document.getElementById("addressspan").innerHTML = "Enter valid address";
			return false;
		}else
		{
			document.getElementById("addressspan").innerHTML = "";
		}
		
		var country = document.getElementById("comboboxCountry").value;
		if (country.length<3 || country=="select country") {
		document.getElementById('countryspan').style.color = 'red';	
		document.getElementById("countryspan").innerHTML = "Select Country";
		return false;
	}else
	{
		document.getElementById("countryspan").innerHTML = "";
	}
		

		var state = document.getElementById("comboboxState").value;
		
		if (state.length<3 || state=="select state") {
			document.getElementById('statespan').style.color = 'red';
			document.getElementById("statespan").innerHTML = "Select State";
			return false;
		}else
		{
			document.getElementById("statespan").innerHTML = "";
		}
		
		var city = document.getElementById("comboboxCity").value;
		
		if (city.length<3 || city=="select city" ) {
			document.getElementById('cityspan').style.color = 'red';
			document.getElementById("cityspan").innerHTML = "Select State";
			return false;
		}else
		{
			document.getElementById("cityspan").innerHTML = "";
		}
		
		var pin = document.getElementById("pin_code").value;
		if (!pin.match(/^\d{6}$/)) {
			document.getElementById('pinspan').style.color = 'red';
			document.getElementById("pinspan").innerHTML = " valid phone number";
			return false;
		}else
		{
			document.getElementById("pinspan").innerHTML = "";
		}
/////////////////

var addressp = document.getElementById("addressp").value;
		if (addressp.length < 3) {
			document.getElementById('addressspanp').style.color = 'red';
			document.getElementById("addressspanp").innerHTML = " Enter valid address";
			return false;
		}else
		{
			document.getElementById("addressspanp").innerHTML = "";
		}
		
var countryp = document.getElementById("comboboxCountry2").value;
		if (countryp.length<3 || countryp=="select country") {
		document.getElementById('countryspanp').style.color = 'red';	
		document.getElementById("countryspanp").innerHTML = "Select Country";
		return false;
	}else
	{
		document.getElementById("countryspanp").innerHTML = "";
	}
		

		var statep = document.getElementById("comboboxState2").value;
		
		if (statep.length<3 || statep=="select state") {
			document.getElementById('statespanp').style.color = 'red';
			document.getElementById("statespanp").innerHTML = "Select State";
			return false;
		}else
		{
			document.getElementById("statespanp").innerHTML = "";
		}
		
		var cityp = document.getElementById("comboboxCity2").value;
		
		if (cityp.length<3 || cityp=="select city") {
			document.getElementById('cityspanp').style.color = 'red';
			document.getElementById("cityspanp").innerHTML = "Select State";
			return false;
		}else
		{
			document.getElementById("cityspanp").innerHTML = "";
		}
		
		
		var pinp = document.getElementById("pin_codep").value;
		if (!pinp.match(/^\d{6}$/)) {
			document.getElementById('pinspanp').style.color = 'red';
			document.getElementById("pinspanp").innerHTML = " valid phone number";
			return false;
		}else
		{
			document.getElementById("pinspanp").innerHTML = "";
		}

		var date = document.getElementById("dob").value;
		if (date < 1) {
			document.getElementById('dobspan').style.color = 'red';
			document.getElementById("dobspan").innerHTML = "select date";
			return false;
		}else
		{
			document.getElementById("dobspan").innerHTML = "";
		}
		

		
		
		
	} 

    $(function () {
        $("#comboboxCity").change(function () {
            if ($(this).val() == "other") {
                $("#city_other").show();
            } else {
                $("#city_other").hide();
            }
        });
    });
    
    
    
    function setvalue(){
		var temp=document.getElementById("cityvalue").value;
		
		
		// Create New Option.
		var newOption = $('<option>');
		newOption.attr('value', temp).text("other");

		// Append that to the DropDownList.
		$('#comboboxCity').append(newOption);

		// Select the Option.
		$("#comboboxCity > [value=" + temp + "]").attr("selected", "true");
		
		
		
	}
</script>




			</form:form>
		</section>
	</div>
</body>
</html>