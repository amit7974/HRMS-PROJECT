<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath }"></c:set>
<spring:url var="css" value="/resources/css"></spring:url>
<spring:url var="js" value="/resources/js"></spring:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="${css}/style.css" rel="stylesheet">
<title>Registration</title>
<script src="${js}/jquery-1.7.1.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>



<script type="text/javascript">
	var fnamecheck = function() {
var f = document.getElementById('first_name').value;
if (f.length < 3 || !f.match(/^[a-zA-Z]+$/)) {
	document.getElementById('first').style.color = 'red';
	document.getElementById('first').innerHTML = 'Enter Valid Name!';
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
	document.getElementById('middle').innerHTML = 'Enter Valid Name!';
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
	document.getElementById('last').innerHTML = 'Enter Valid Name!';
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
	document.getElementById("phonespan").innerHTML = "valid phone number";
} else {
	document.getElementById('phonespan').innerHTML = "";
}

	}

	function pin_verify() {

var pin = document.getElementById("pin_code").value;
if (!pin.match(/^\d{6}$/)) {
	document.getElementById('pinspan').style.color = 'red';
	document.getElementById("pinspan").innerHTML = "Enter valid pin code";
} else {
	document.getElementById('pinspan').innerHTML = "";
}
	}
	function address_verifyp() {
var addressp = document.getElementById("addressp").value;
if (addressp.length < 3) {
	document.getElementById('addressspanp').style.color = 'red';
	document.getElementById("addressspanp").innerHTML = "Enter valid address";
} else {
	document.getElementById('addressspanp').innerHTML = "";
}
	}
	function pin_verifyp() {

var pinp = document.getElementById("pin_codep").value;
if (!pinp.match(/^\d{6}$/)) {
	document.getElementById('pinspanp').style.color = 'red';
	document.getElementById("pinspanp").innerHTML = "valid pin code";
} else {
	document.getElementById('pinspanp').innerHTML = "";
}
	}

	function validateForm() {

var f = document.getElementById('first_name').value;
if (f.length < 3 || !f.match(/^[a-zA-Z]+$/)) {
	document.getElementById('first').style.color = 'red';
	document.getElementById('first').innerHTML = 'Enter Valid Name!';
	return false;
} else {
	document.getElementById('first').innerHTML = '';
}

var last = document.getElementById('last_name').value;
if (last.length < 3 || !last.match(/^[a-zA-Z]+$/)) {
	document.getElementById('last').style.color = 'red';
	document.getElementById('last').innerHTML = 'Enter Valid Name!';
	return false;
} else {
	document.getElementById('last').innerHTML = '';
}

var phone = document.getElementById("phone").value;
if (!phone.match(/^\d{10}$/)) {
	document.getElementById('phonespan').style.color = 'red';
	document.getElementById("phonespan").innerHTML = "Enter valid phone number";
	return false;
} else {
	document.getElementById('phonespan').innerHTML = '';
}
var address = document.getElementById("address").value;
if (address.length < 3) {
	document.getElementById('addressspan').style.color = 'red';
	document.getElementById("addressspan").innerHTML = "Enter valid address";
	return false;
} else {
	document.getElementById('addressspan').innerHTML = '';
}

var country = document.getElementById("comboboxCountry").value;
if (country.length < 3 || country == "select country") {
	document.getElementById('countryspan').style.color = 'red';
	document.getElementById("countryspan").innerHTML = "Select Country";
	return false;
} else {
	document.getElementById('countryspan').innerHTML = '';
}

var state = document.getElementById("comboboxState").value;

if (state.length < 3 || state == "select state") {
	document.getElementById('statespan').style.color = 'red';
	document.getElementById("statespan").innerHTML = "Select State";
	return false;
} else {
	document.getElementById('statespan').innerHTML = '';
}

var city = document.getElementById("comboboxCity").value;

if (city.length < 3 || city == "select city") {
	document.getElementById('cityspan').style.color = 'red';
	document.getElementById("cityspan").innerHTML = "Select State";
	return false;
} else {
	document.getElementById('cityspan').innerHTML = '';
}
var pin = document.getElementById("pin_code").value;
if (!pin.match(/^\d{6}$/)) {
	document.getElementById('pinspan').style.color = 'red';
	document.getElementById("pinspan").innerHTML = "Enter valid pin code";
	return false;
} else {
	document.getElementById('pinspan').innerHTML = '';
}
var addressp = document.getElementById("addressp").value;
if (addressp.length < 3) {
	document.getElementById('addressspanp').style.color = 'red';
	document.getElementById("addressspanp").innerHTML = "Enter valid address";
	return false;
} else {
	document.getElementById('addressspanp').innerHTML = '';
}

var countryp = document.getElementById("comboboxCountryp").value;
if (countryp.length < 3 || countryp == "select country") {
	document.getElementById('countryspanp').style.color = 'red';
	document.getElementById("countryspanp").innerHTML = "Select Country";
	return false;
} else {
	document.getElementById('countryspanp').innerHTML = '';
}

var statep = document.getElementById("comboboxStatep").value;

if (statep.length < 3 || statep == "select state") {

	document.getElementById('statespanp').style.color = 'red';
	document.getElementById("statespanp").innerHTML = "Select State";

	return false;
} else {
	document.getElementById('statespanp').innerHTML = '';
}

var cityp = document.getElementById("comboboxCityp").value;

if (cityp.length < 3 || cityp == "select city") {
	document.getElementById('cityspanp').style.color = 'red';
	document.getElementById("cityspanp").innerHTML = "Select State";
	return false;
} else {
	document.getElementById('cityspanp').innerHTML = '';
}

var pinp = document.getElementById("pin_codep").value;
if (!pinp.match(/^\d{6}$/)) {
	document.getElementById('pinspanp').style.color = 'red';
	document.getElementById("pinspanp").innerHTML = "Enter valid phone number";
	return false;
} else {
	document.getElementById('pinspanp').innerHTML = '';
}

var date = document.getElementById("dob").value;
if (date < 1) {
	document.getElementById('dobspan').style.color = 'red';
	document.getElementById("dobspan").innerHTML = "select date";
	return false;
} else {
	document.getElementById('dobspan').innerHTML = '';
}

	}
</script>

<script type="text/javascript">
	$(function() {
$("#comboboxCity").change(function() {
	if ($(this).val() == "other") {
$("#city_other").show();
	} else {
$("#city_other").hide();
	}
});
	});

	function setvalue() {
var temp = document.getElementById("cityvalue").value;

// Create New Option.
var newOption = $('<option>');
newOption.attr('value', temp).text("other");

// Append that to the DropDownList.
$('#comboboxCity').append(newOption);

// Select the Option.
$("#comboboxCity > [value=" + temp + "]").attr("selected", "true");

	}
</script>

</head>
<body>
	<main>
<section class="emp_reg">
	<form:form method="post"
action="${contextRoot}/emp/registration_save"
modelAttribute="emp_info" enctype="multipart/form-data"
onsubmit="return validateForm()">
<h2 style="padding: 10px;" align="center">Employee Registration</h2>
<br>
<b style="margin-left: 20px;">First Name:</b>
<form:input type="text" style="margin-left: 51px;"
	placeholder="First Name" id="first_name" path="first_name"
	onkeyup="fnamecheck();" />
<small><form:errors path="first_name"
style="display:block;margin-left:160px;" cssClass="error" /></small>
<small><span class="spn" style="margin-left: 160px;"
	id='first'></span></small>


<b style="margin-left: 20px;">Middle Name:</b>
<form:input style="margin-left:36px;" type="text"
	placeholder="Middle Name" id="middle_name" path="middle_name"
	onkeyup="mnamecheck();" />
<br>
<small><form:errors path="middle_name" cssClass="error" /></small>
<small><span class="spn" style="margin-left: 160px;"
	id='middle'></span></small>




<b style="margin-left: 20px;">Last Name:</b>
<form:input type="text" style="margin-left: 55px;"
	placeholder="Last Name" id="last_name" path="last_name"
	onkeyup="lnamecheck();" />
<small> <form:errors path="last_name"
style="display:block;margin-left:160px;" cssClass="error" /></small>
<small><span class="spn" style="margin-left: 160px;"
	id='last'></span></small>

<b style="margin-left: 20px;">Phone:</b>
<form:input style="margin-left: 90px;" type="text"
	placeholder="Mobile no." path="phone" id="phone"
	onkeyup="phone_verify();" />
<br>


<small><form:errors path="phone" style="margin-left:160px;"
cssClass="error" /></small>
<small style="display: block;"><span class="spn"
	style="margin-left: 160px;" id="phonespan"></span></small>




<br>
<br>
<b style="margin-left: 10px;">Current Address</b>
<br>
<b style="margin-left: 20px;">Address Line 1:</b>
<form:input type="text" placeholder="Address" path="Address_line_1"
	id="address" style="width:200px;height:15px;"
	onkeyup="address_verify();copytext();" />
<small> <form:errors path="Address_line_1"
style="display:block;margin-left:140px;" cssClass="error" /></small>
<small><span class="spn" style="margin-left: 140px;"
	id="addressspan"></span></small>



<label for="address2"><b style="margin-left: 20px;">Address
Line 2:</b></label>
<form:input type="text" placeholder="optional" path="Address_line_2"
	style="width:200px;height:15px;" id="address2"
	onkeyup="copytext();" />
<small> <form:errors path="Address_line_2"
style="display:block;margin-left:140px;" cssClass="error" /></small>

<br>
<label for="landmark"><b style="margin-left: 20px;">Landmark:</b></label>
<form:input type="text" placeholder="optional"
	style="width:200px;height:15px;margin-left:28px;" path="landmark"
	id="landmark" onkeyup="copytext();" />
<small> <form:errors path="landmark"
style="display:block;margin-left:140px;" cssClass="error" /></small>
<br>
<b style="margin-left: 20px;">Country</b>

<form:select path="country_name" id="comboboxCountry"
	style="width:200px;margin-left:50px;margin-top:15px;"
	onchange="copycon();select_state();">
        			<option value="select country">Select Country</option>
					<c:forEach var="country" items="${country}">
						<form:option value="${country}">${country}</form:option>
					</c:forEach>
</form:select>
<small><span class="spn" style="margin-left: 140px;"
	id="countryspan"></span></small>
<small> <form:errors path="country_name"
style="display:block;margin-left:140px;" cssClass="error" />
</small>

<b style="margin-left: 20px;">State</b>

<form:select path="state_name" id="comboboxState"
	style="width:200px;margin-left:72px;" onchange="copycon();select_cities();">
	<form:option value="select a state">Select a State</form:option>
</form:select>
<small><span class="spn" style="margin-left: 140px;"
	id="statespan"></span></small>
<small><form:errors style="display:block;margin-left:140px;"
path="state_name" cssClass="error" /></small>



<b style="margin-left: 20px;">City</b>

<form:select path="city_name" id="comboboxCity"
	style="width:200px;margin-left:76px;" onchange="copycon();">
	<form:option value="select a city">Select a City</form:option>
</form:select>
<small><span class="spn" style="margin-left: 140px;"
	id="cityspan"></span></small>
<small><form:errors style="display:block;margin-left:140px;"
path="city_name" cssClass="error" /></small>





<div id="city_other" style="display: none">
	<b style="margin-left: 20px;">City Name: </b> <input type="text"
path="city_name" id="cityvalue" placeholder="City"
style="width: 30%; height: 10px" onkeyup="setvalue();" />
</div>



<b style="margin-left: 20px;">PinCode:</b>
<form:input type="text" placeholder="PinCode" path="pin_code"
	id="pin_code" style="width:200px;margin-left:42px;"
	onkeyup="pin_verify();" />
<small> <form:errors path="pin_code"
style="display:block;margin-left:140px;" cssClass="error" /></small>
<small><span class="spn" style="margin-left: 140px;"
	id="pinspan"></span></small>



<br>
<br>
<b style="margin-left: 10px;">Permanent Address</b>
<br>
<input type="checkbox" id="chkbox" style="margin-left: 10px;"
	onchange="handleChange();">
<small><b style="opacity: 0.5;">Same as Corresponding</b> </small>

<br>

<div class="abc1" id="abc1" style="display: inline">
	<div id="abcd1" class="abcd" style="display: inline">

<b style="margin-left: 20px;">Address Line 1:</b>
<form:input type="text" placeholder="Address" path="addressp"
	id="addressp" style="width:200px;height:15px;"
	onkeyup="address_verifyp();" />
<form:errors path="addressp"
	style="display:block;margin-left:140px;" cssClass="error" />
<small><span class="spn" style="margin-left: 140px;"
	id="addressspanp"></span></small>
	</div>
</div>

<div class="abc2" id="abc2" style="display: inline">
	<div id="abcd2" class="abcd" style="display: inline">

<label for="address2p"><b style="margin-left: 20px;">Address
Line 2:</b></label>
<form:input type="text" placeholder="optional" path="address2p"
	style="width:200px;height:15px;" id="address2p" />

<small><form:errors path="address2p"
style="display:block;margin-left:140px;" cssClass="error" /></small>
	</div>
</div>
<br>

<div class="abc3" id="abc3" style="display: inline">
	<div id="abcd3" class="abcd" style="display: inline;">
<label for="landmarkp"><b style="margin-left: 20px;">Landmark:</b></label>
<form:input type="text" placeholder="optional"
	style="width:200px;height:15px;margin-left:28px;"
	path="landmarkp" id="landmarkp" />

<small><form:errors path="landmarkp"
style="display:block;margin-left:140px;" cssClass="error" /></small>
	</div>
</div>
<br>
<br>
<div class="abc4" id="abc4" style="display: inline">
	<div id="abcd4" class="abcd" style="display: inline">
<b style="margin-left: 20px;">Country</b> <select
	path="country_namep" id="comboboxCountryp"
	style="width: 200px; margin-left: 50px;" onchange="select_state2();">
	<option value="select country">Select a Country</option>
	<c:forEach var="country" items="${country }">
<option value="${country }">${country}</option>
	</c:forEach>
</select> <small><span class="spn" style="margin-left: 140px;"
	id="countryspanp"></span></small>

	</div>
</div>


<div class="abc5" id="abc5" style="display: inline">
	<div id="abcd5" class="abcd" style="display: inline">

<b style="margin-left: 20px;">State</b> <select path="state_namep"
	id="comboboxStatep" style="width: 200px; margin-left: 72px;" onchange="select_cities2();">
	<option value="select state">Select a State</option>
</select> <small><span class="spn" style="margin-left: 140px;"
	id="statespanp"></span></small>

	</div>
</div>


<div class="abc6" id="abc6" style="display: inline">
	<div id="abcd6" class="abcd" style="display: inline">
<b style="margin-left: 20px;">City</b> <select path="city_namep"
	id="comboboxCityp" style="width: 200px; margin-left: 76px;">
	<option value="select city">Select a City</option>
</select> <small><span class="spn" style="margin-left: 140px;"
	id="cityspanp"></span></small>

	</div>
</div>


<div class="abc7" id="abc7" style="display: inline">
	<div id="abcd7" class="abcd" style="display: inline">
<label for="pin_codep"><b style="margin-left: 20px;">PinCode:</b></label>
<form:input type="text" placeholder="PinCode" path="pin_codep"
	style="width:200px;height:15px;margin-left:44px;" id="pin_codep"
	onkeyup="pin_verifyp();" />

<small style="display: block;"> <form:errors
path="pin_codep" style="display:block;margin-left:140px;"
cssClass="error" /></small> </small> <small><span class="spn"
	style="margin-left: 140px;" id="pinspanp"></span></small>

	</div>
</div>


<input type="hidden" name="address_type" id="address_type" value="c" />
<input type="hidden" name="address_typep" id="address_typep"
	value="p" />

<br>
<b style="margin-left: 20px;">Gender:</b>
<form:select path="gender" style="margin-left: 53px;">
	<form:option value="male" label="Male" />
	<form:option value="female" label="Female" />
	<form:option value="other" label="Other" />

</form:select>

<br>
<br>
<b style="margin-left: 20px;">Date of birth:</b>
<form:input type="date" style="margin-left: 18px;border-radius:8px;"
	placeholder="Date of Birth" path="dob" id="dob"
	onchange="date_change();" />
<br>
<small><form:errors path="dob"
style="display:block;margin-left:140px;" cssClass="error" /></small>
<small><span class="spn" style="margin-left: 140px;"
	id="dobspan"></span></small>
<br>
<br>
<b style="margin-left: 20px;">Photo:</b>
<input type="file" name="file" id="fileupload"
	onchange="file_type();" />
<br>
<br>
<form:errors path="file" cssClass="error" style="margin-left: 20px;"></form:errors>
<span id="filespan" style="display: block;"></span>
<br>

<br>
<button style="margin-left: 20px;" type="submit" class="registerbtn">Register</button>



<script type="text/javascript">

select_state();
select_state2();
var ctry=$('#comboboxCountry').val();
function select_state2()
{
	var country=$('#comboboxCountryp').val();
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
			
			$('#comboboxStatep').html(s);
			select_cities2();
		}
		
		
	});
	
		
}

function select_cities2()
{
	var state=$('#comboboxStatep').val();
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
			
			$('#comboboxCityp').html(s);
		}
		
		
	});
	
	 
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


	function handleChange() {
if ($('#chkbox').is(":checked")) {

	$(".abcd").remove();

	$("#abc1").append('<div id="abcd1" class="abcd" style="display: inline"><label for="addressp"><b style="margin-left:20px;">Address Line 1:</b></label><input type="text" name="addressp" readonly = "true" id="addressp" class="addressp"  style="width:200px;height:15px;" /><br></div>');
	$("#abc2").append('<div id="abcd2" class="abcd" style="display: inline"><label for="address2p"><b style="margin-left:20px;">Address Line 2:</b></label><input type="text" name="address2p" class="address2p" readonly = "true" style="width:200px;height:15px;" id="address2p"  /></div>');
	$("#abc3").append('<div id="abcd3" class="abcd" style="display: inline"><label for="landmarkp"><b style="margin-left:20px;">Landmark:</b></label><input type="text" style="width:200px;height:15px;margin-left:28px;" name="landmarkp" class="landmarkp" readonly = "true" id="landmarkp" /></div>');
	$("#abc4").append('<div id="abcd4" class="abcd" style="display: inline"><b style="margin-left:20px;">Country</b><select name="country_namep" selected="selected" id="comboboxCountryp" class="comboboxCountryp" readonly = "true" style="width:200px;margin-left:50px;"></select><br></div>');
	$("#abc5").append('<div id="abcd5" class="abcd" style="display: inline"><b style="margin-left:20px;">State</b><select name="state_namep" id="comboboxStatep" class="comboboxStatep" selected="selected" readonly = "true" style="width:200px;margin-left:72px;margin-top:15px;"></select><br></div>');
	$("#abc6").append('<div id="abcd6" class="abcd" style="display: inline"><b style="margin-left:20px;">City</b><select name="city_namep" id="comboboxCityp" class="comboboxCityp" selected="selected" readonly = "true" style="width:200px;margin-left:76px;margin-top:15px;"></select><br></div>');
	$("#abc7").append('<div id="abcd7" class="abcd" style="display: inline"><label for="pin_codep"><b style="margin-left:20px;">PinCode:</b></label><input type="text" placeholder="PinCode"  name="pin_codep" class="pin_codep" style="width:200px;height:15px;margin-left:44px;" id="pin_codep"/><br></div>');

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
} else {
	$(".abcd").remove();

	$("#abc1").append('<div id="abcd1" class="abcd" style="display: inline"><label for="addressp"><b style="margin-left: 20px;">Address Line 1:</b></label><form:input type="text" placeholder="Address" path="Addressp" id="address2p" style="width:200px;height:15px;" onkeyup="address_verifyp();"/><form:errors path="Addressp" style="display:block;margin-left:140px;" cssClass="error"/><small><span class="spn" id="addressspanp"></span></small></div>');
	$("#abc2").append('<div id="abcd2" class="abcd" style="display: inline"><label for="address2p"><b style="margin-left: 20px;">Address Line 2:</b></label><form:input type="text" placeholder="optional" path="Address2p" style="width:200px;height:15px;" id="address2p" /><form:errors path="Address2p" style="display:block;margin-left:140px;" cssClass="error"/></div>');
	$("#abc3").append('<div id="abcd3" class="abcd" style="display: inline"><label for="landmarkp"><b style="margin-left: 20px;">Landmark:</b></label><form:input type="text" placeholder="optional" style="width:200px;height:15px;margin-left:28px;" path="landmarkp" id="landmarkp" /><form:errors path="landmarkp" style="display:block;margin-left:140px;" cssClass="error"/></div>');
	$("#abc4").append('<div id="abcd4" class="abcd" style="display: inline"><b style="margin-left: 20px;">Country</b><form:select path="country_namep" id="comboboxCountryp" style="width:200px;margin-left:50px;" onchange="select_state2();"><form:option  value="select a country" >Select a Country</form:option><c:forEach var="country" items="${country}"><form:option value="${country}">${country }</form:option></c:forEach></form:select><small><span class="spn" id="countryspanp"></span></small><form:errors path="country_namep" style="display:block;margin-left:140px;" cssClass="error"/></div>');
	$("#abc5").append('<div id="abcd5" class="abcd" style="display: inline"><b style="margin-left: 20px;">State</b><form:select path="state_namep" id="comboboxStatep" style="width:200px;margin-left:72px;" onchange="select_cities2();"><form:option value="select a state">Select a State</form:option></form:select><small><span class="spn" id="statespanp"></span></small><form:errors path="state_namep" style="display:block;margin-left:140px;" cssClass="error"/></div>');
	$("#abc6").append('<div id="abcd6" class="abcd" style="display: inline"><b style="margin-left: 20px;">City</b><form:select path="city_namep" id="comboboxCityp" style="width:200px;margin-left:76px;"><form:option value="select a city">Select a City</form:option></form:select><small><span class="spn" id="cityspanp"></span></small><form:errors path="city_namep" style="display:block;margin-left:140px;" cssClass="error"/></div>');
	$("#abc7").append('<div id="abcd7" class="abcd" style="display: inline"><label for="pin_codep"><b style="margin-left: 20px;">PinCode:</b></label><form:input type="text" placeholder="PinCode"  path="pin_codep" style="width:200px;height:15px;margin-left:44px;" id="pin_codep" onkeyup="pin_verifyp();"/><form:errors path="pin_codep" style="display:block;margin-left:140px;" cssClass="error"/><small><span class="spn" id="pinspanp"></span></small></div>');

	$("#address_type").val("c");
	$("#address_typep").val("p");

}
	}
	function date_change() {

var date = document.getElementById("dob").value;

	}

	
	function copytext() {

$(".addressp").val($("#address").val());
$(".address2p").val($("#address2").val());
$(".landmarkp").val($("#landmark").val());
$(".pin_codep").val($("#pin_code").val());
	}

	function copycon() {

var country = document
.getElementById("comboboxCountry").value;
var state = document.getElementById("comboboxState").value;
var city = document.getElementById("comboboxCity").value;

$('.comboboxCountryp').append(
'<option selected="selected" value="'+country+'">'
	+ country + '</option>');
$('.comboboxCountryp option:eq(0)').remove();

$('.comboboxStatep').append(
'<option selected="selected" value="'+state+'">'
	+ state + '</option>');
$('.comboboxStatep option:eq(0)').remove();

$('.comboboxCityp').append(
'<option selected="selected" value="'+city+'">'
	+ city + '</option>');
$('.comboboxCityp option:eq(0)').remove();

	}
</script>







	</form:form>
</section>
	</main>
</body>
</html>