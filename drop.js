
$(document).ready(function(){
alert("hgfg");
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
