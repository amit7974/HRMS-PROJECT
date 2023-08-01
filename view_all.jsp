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
<!-- Bootstrap 4.5 CSS-->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>


<title>Filter</title>

</head>
<body style="background: #e2e2e2!important;">

 
	<div class="container-fluid">
	
		<div class="row">
			
			
			
							
		
				
		
		<br>
			<div class="col-md-0" style="background:rgb(255,255,255);margin-top: 20px;margin-left: 20px; margin-right: 10px;padding-bottom: 10px;margin-bottom: 20px;">
			<div style="height: 15px;"></div>
			<h3 class="ml-3">Qualification</h3>
				
			
				
				<div style="width: 250px;display: inline-block;margin-left: 20px;margin-top: 20px;">
				<input type="text" value="" name="searchColumn" placeholder="search" id="searchColumn" style="width:100px;height: 25px;margin-bottom: 3px;background:linear-gradient(to right top, rgba(255,255,255,0.9),rgba(255,255,255,0.2));border-radius: 0px;border-color: rgba(0,0,0,0.1);"/>
				<input type="text" placeholder="min" name="min_qual" id="min_qual" style="width: 50px;height: 25px;background:linear-gradient(to right top, rgba(255,255,255,0.9),rgba(255,255,255,0.2))border-radius: 0px;border-color: rgba(0,0,0,0.1);"/>
				<input type="text" placeholder="max" name="max_qual" id="max_qual" style="width: 50px;height: 25px;background:linear-gradient(to right top, rgba(255,255,255,0.9),rgba(255,255,255,0.2))border-radius: 0px;border-color: rgba(0,0,0,0.1);"/>
				<div style="height: 180px; overflow-y: auto; overflow-x: hidden;">
					
					<c:choose>
    				<c:when test="${not empty all_skill}">
        				<c:forEach items="${all_qual}" var="qual">
						<div class="list-group-item checkbox" style="margin-right: 25px;background:linear-gradient(to right top, rgba(255,255,255,0.9),rgba(255,255,255,0.2));">
							<label>${qual}</label> <input type="checkbox"
								class="common-selector qual" value="${qual}" />
						</div>
					</c:forEach>
    					</c:when>    
    				<c:otherwise>
    				
        					<p style="margin-left: 10px;margin-top: 10px;">No records found!</p>
    					</c:otherwise>
						</c:choose>
					
					
					
				</div>
				
				</div>	
			<h3 class="ml-3">Skills</h3>
			<div style="width: 250px;display: inline-block;margin-left: 20px;">
			<input type="text" value="" name="searchColumn2" placeholder="search" id="searchColumn2" style="width:100px;height: 25px;margin-bottom: 3px;background:linear-gradient(to right top, rgba(255,255,255,0.9),rgba(255,255,255,0.2));border-radius: 0px;border-color: rgba(0,0,0,0.1);"/>
			<input type="text" placeholder="min" name="min_skill" id="min_skill" style="width: 50px;height: 25px;background:linear-gradient(to right top, rgba(255,255,255,0.9),rgba(255,255,255,0.2));border-radius: 0px;border-color: rgba(0,0,0,0.1);"/>
				<input type="text" placeholder="max" name="max_skill" id="max_skill" style="width: 50px;height: 25px;background:linear-gradient(to right top, rgba(255,255,255,0.9),rgba(255,255,255,0.2));border-radius: 0px;border-color: rgba(0,0,0,0.1);"/>
			<div style="height: 180px; overflow-y: auto; overflow-x: hidden;">
				<div class="list-group">
				
				<c:choose>
    				<c:when test="${not empty all_skill}">
        				<c:forEach items="${all_skill}" var="skill">
						<div class="list-group-item checkbox" style="margin-right: 25px;background:linear-gradient(to right top, rgba(255,255,255,0.9),rgba(255,255,255,0.2));">
							<label>${skill}</label> <input type="checkbox"
								class="common-selector skill" value="${skill}" />
						</div>
					</c:forEach>
    					</c:when>    
    				<c:otherwise>
    				
        					<p style="margin-left: 10px;margin-top: 10px;">No records found!</p>
    					</c:otherwise>
						</c:choose>
					
				
				
					
				</div>
			</div>
			</div>
		
</div>
		<div class="col-md-9">
		
			
			<div style="background:rgb(255,255,255);margin-bottom: 20px;margin-top: 20px;">
			<div class="card-body">
			<h3 style="display: inline;margin-left: 400px;">Candidate</h3><b style="margin-left: 260px;">Total Candidate: ${sessionScope.count}</b><p align="right" class="mr-4"><a href="${contextRoot}/admin/download-zip" style="text-decoration: underline;color: black;" >All resume</a></p>
			<div class="row filter_data">
			<table class="table" id="myTable"><thead><tr><th scope="col">Profile Id</th><th scope="col">First Name</th><th scope="col">Last Name</th><th scope="col">Email</th><th scope="col">Qualification</th><th scope="col">Skill</th><th scope="col">Resume</th></tr></thead><tbody></tbody></table>
			<div class="row navi" style="margin-left: 20px;">
			
			
			</div>
				</div>
			</div>
			</div>
		</div>
		</div>
	</div>
	<script type="text/javascript">
	var delayTimer;
	filter_data(0);
	
				function filter_data(page) {
					
					
					 
					    page_no=page;
					    
					 
						
						var qual = get_filter('qual');
						var skill = get_filter('skill');
						var min_qual=$('#min_qual').val();
						var max_qual=$('#max_qual').val();
						var min_skill=$('#min_skill').val();
						var max_skill= $('#max_skill').val();
						
						
						if(skill=="")
						skill="invalid";
						if(qual=="")
						qual="invalid";
						if(min_qual=="")
						min_qual="invalid";
						if(max_qual=="")
						max_qual="invalid";
						if(min_skill=="")
						min_skill="invalid";
						if(max_skill=="")
						max_skill="invalid";
						
						 clearTimeout(delayTimer);

						 delayTimer = setTimeout(function() {
						
						$.ajax({
							type : 'GET',
							url : '${contextRoot}/admin/filter_data/' + qual+ '/' + skill + '/' + min_qual + '/' + max_qual + '/' + min_skill + '/' + max_skill + '/' + page_no,
							success : function(result) {
								$('.trc').remove();
								$('.page-item').remove();
								
								if(result.user_id=="")
									{
									$('#nodata').remove();
									$('#myTable tbody').append('<tr id="nodata"><td align="center" colspan="7"><h3>No records found<h3><td><tr>')
									}else
										{
										
										$('#nodata').remove();
										for(var i=0;i<result.user_id.length;i++)
											{
											var q=x(result.qualification_name[i]);
											var s=y(result.skill_name[i]);
											$('#myTable tbody').append('<tr class="trc"><td>'+result.user_id[i]+'</td><td>'+result.first_name[i]+'</td><td>'+result.last_name[i]+'</td><td>'+result.email[i]+'</td><td class="tdqual">'+q+'</td><td class="tdskill">'+s+'</td><td class="the_id"><a href="${contextRoot}/admin/downloadFile/'+result.user_id[i]+'">download</a></td></tr>');

											
											} 
										if(page!=0)
										$('.navi').append('<li class="page-item" style="list-style-type:none;"><a class="page-link" href="javascript:void(0);" onclick="page_num('+(page-1)+')">Previous</a>');

										 for(var i=0;i<result.total_pages;i++)
											{
											$('.navi').append('<li class="page-item" id="'+i+'" style="list-style-type:none;"><a class="page-link" href="javascript:void(0);" onclick="page_num('+i+')">'+(i+1)+'</a></li>');
											} 
										 if(page!=result.total_pages-1)
										$('.navi').append('<li class="page-item" style="list-style-type:none;"><a class="page-link" href="javascript:void(0);" onclick="page_num('+(page+1)+')">Next</a></li>');
											 
											$('#'+page+'').addClass('active');
										}
							

								
							}
						
						});
						 }, 1000);
					}

				

		function get_filter(class_name) {
			
			var filter = [];
			$('.' + class_name + ':checked').each(function() {

				
				filter.push($(this).val());

			});
			
			return filter;
		}
		
		$('.common-selector').click(function()
		{
			
			
			filter_data(0);
			
			
			
		});
		
		function page_num(num)
		{
			
			filter_data(num);
			
		}
		
		$(document).ready(function(){
		    
		    $("#searchColumn").on("input",function(){
		        
		        var searchTxt = $(this).val();
		        searchTxt = searchTxt.replace(/[.()+]/g,"\\$&");

		        var patt = new RegExp("^" + searchTxt,"i");
		        
		        $(".qual").each(function(){
		            
		            if(patt.test($(this).val())) 
		                $(this).closest("div").show();
		                    
		            else 
		                $(this).closest("div").hide();
		                    
		        });
		    });
		});
		
$(document).ready(function(){
		    
		    $("#searchColumn2").on("input",function(){
		        
		        var searchTxt = $(this).val();
		        searchTxt = searchTxt.replace(/[.()+]/g,"\\$&");

		        var patt = new RegExp("^" + searchTxt,"i");
		        
		        $(".skill").each(function(){
		            
		            if(patt.test($(this).val())) 
		                $(this).closest("div").show();
		                    
		            else 
		                $(this).closest("div").hide();
		                    
		        });
		    });
		});
		

    
$("#min_qual").on("input",function(){
	filter_data(0);
	
    });
$("#max_qual").on("input",function(){
        
    	filter_data(0);
    });
$("#min_skill").on("input",function(){
	
	filter_data(0);
});
$("#max_skill").on("input",function(){
    
	filter_data(0);
});

function y(r)
{

var j="<li>" + r.join("</li><li>") + "</li>";
return j;

}

function x(r)
{
	
var j="<li>" + r.join("</li><li>") + "</li>";
return j;

}




	</script>

</body>
</html>