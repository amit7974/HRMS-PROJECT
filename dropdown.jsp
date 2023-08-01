<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cascading Dropdown List with Ajax in Spring MVC Framework and Spring Data JPA</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-1.7.1.min.js"></script>
<script src="${js}/jquery-1.7.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	$('#comboboxCountry').on('change', function(){
		var countryId = $(this).val();
		
		$('#comboboxCity')
	    .empty().append('<option selected="selected" value="">Select a City</option>');
		
		$.ajax({
			type: 'GET',
			url: '${pageContext.request.contextPath }/demo/loadStatesByCountry/' + countryId,
			success: function(result) {
				var result = JSON.parse(result);
				
				var s = '';
				for(var i = 0; i < result.length; i++) {
					s += '<option value="' + result[i].state_id + '">' + result[i].state_name + '</option>';
				}
				$('#comboboxState').html(s);
			}
		});
	});


	$('#comboboxState').on('change', function(){
		var stateId = $(this).val();
		
		$.ajax({
			type: 'GET',
			url: '${pageContext.request.contextPath }/demo/loadCitiesByState/' + stateId,
			success: function(result) {
				var result = JSON.parse(result);
				
				var s = '';
				
				for(var i = 0; i < result.length; i++) {
					s += '<option value="' + result[i].city_id + '">' + result[i].city_name + '</option>';
				}
				$('#comboboxCity').html(s);
			}
		});
	});



});
</script>
</head>
<body>

	<form>
		<table>
			<tr>
				<td>Country</td>
				<td>
					<select id="comboboxCountry" style="width:200px">
					<option value="-1">Select a Country</option>
						<c:forEach var="country" items="${countries }">
							<option value="${country.country_id }">${country.country_name }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>State</td>
				<td>
					<select id="comboboxState" style="width:200px"><option value="-1">Select a State</option></select>
				</td>
			</tr>
			<tr>
				<td>City</td>
				<td>
					<select id="comboboxCity" style="width:200px"><option value="-1">Select a City</option></select>
				</td>
			</tr>
		</table>
	</form>

</body>
</html>

