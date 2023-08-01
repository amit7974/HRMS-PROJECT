<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="./base.jsp" %>
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-light">
		<div class="container-fluid">
	<!-- 	  <a class="navbar-brand" href="https://www.onlyxcodes.com/">Onlyxcodes</a> -->
		  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
		  <div class="collapse navbar-collapse" id="navbarScroll">
		    <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
		      <li class="nav-item">
	<!--  	        <a class="nav-link active" aria-current="page" href="https://www.onlyxcodes.com/2022/08/spring-mvc-hibernate-crud-example-with-maven.html">Back to Tutorial</a> -->
		      </li>
		    </ul>
		  </div>
		 </div>
	 </nav>
	<div class="container mt-3">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<h1 class="text-center mb-3"> Job_Vacancy Detail</h1>
				<form action="submit_job_vacancy" method="post">
					  <div class="mb-3">
					    <label class="form-label">Experience_Required </label>
					    <input type="text" name="experience_required" class="form-control" placeholder="type experience_required">
					  </div>
					  <div class="mb-3">
					    <label class="form-label">Salary_Lower_Range</label>
					    <input type="text" name="salary_lower_range" class="form-control" placeholder="type salary_lower_range">
					  </div>
					  
					   <div class="mb-3">
					    <label class="form-label">Salary_Upper_Range</label>
					    <input type="text" name="salary_upper_range" class="form-control" placeholder="type salary_upper_range">
					  </div>
					  
					  
					  
					   <div class="mb-3">
					    <label class="form-label">Vacancy_Added_On</label>
					    <input type="text" name="vacancy_added_on" class="form-control" placeholder="type vacancy_added_on">
					  </div>
					  
					  
					  
					   <div class="mb-3">
					    <label class="form-label">Is_On</label>
					    <input type="text" name="is_on" class="form-control" placeholder="type is_on">
					  </div>
					  
					  
					  
					  
					  <div class="container text-center">
						  <button type="submit" class="btn btn-primary">Create</button>
						  <a href="${pageContext.request.contextPath}/" class="btn btn-outline-danger">Back</a>
					  </div>
				</form>
			</div>	
		</div>
	</div>
</body>
</html>