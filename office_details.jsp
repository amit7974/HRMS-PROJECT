<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<script>
function validate() 
{
	var username=document.getElementById("username").value;
	var password=document.getElementById("password").value;
	if(username=="admin"&& password=="user")
	{
		
		alert("login successfully");
	return false;
	}
	else
	{
		
	alert("login failed");	
	}
	
	
}
</script>

<style>

body{
margin:0;
padding:0;
font-family: absolute;
background:url("shive.jpg") alt="";
background: gray;
background-size:cover;

.box{
width:300px;
padding:30px;
position:absolute;
top:50%;
left:50%;
transform:translate(-50%,-50%);
background:rgba(0,0,0,0.4);
text-align:center;
}
.box h1{
color:white;
text-transform:uppercase;
font-weight:700;
}

.box input[type="text"],.box input[type="password"]{
border:0;
background:none;
display:block;
margin:20px auto;
text-align:center;
border:3px solid #0367fd;
padding:14px 10px;
width:220px;
outline:none;
color:white;
border-radius:24px;
transition:0.25px;
}

.box input[type="text"]:focus,.box input[type="password"]:focus{
width:270px;
border-color:#ffc400ec;
}

.box input[type="submit"]{

border:0;
background:none;
display:block;
margin:20px auto;
text-align:center;
border:3px solid #ffc400ec;
padding:14px 10px;
outline:none;
color:white;
border-radius:24px;
transition:0.25px;
cursor:pointer;
}

.box input[type="submit"]:hover{
background:#ffc400ec;
}
</style>
<body>
<form class="box" action="add_job_vacancy_form" method="GET">

<h1>login</h1>
<input type="text" name="" placeholder="Enter Username" id="username">

<input type="password" name="" placeholder="Enter Password" id="password">

<input type="submit" name="" value="Login"  onclick="validate()"> 


</form>

</body>
</html>