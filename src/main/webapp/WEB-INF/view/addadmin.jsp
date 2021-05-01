<!DOCTYPE html>
<%@taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>DocTrust</title>

  <link href="static/assets/img/favicon.png" rel="icon">
  <link href="static/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,600,600i,700,700i,900" rel="stylesheet">

  <link href="static/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="static/assets/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="static/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="static/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="static/assets/vendor/venobox/venobox.css" rel="stylesheet">
  <link href="static/assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="static/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/style.css" rel="stylesheet">
<link href="static/css/login.css" rel="stylesheet">
<link href="static/css/register.css" rel="stylesheet">
<link href="static/css/alluser.css" rel="stylesheet">

  <link href="static/assets/css/style.css" rel="stylesheet">
</head>
<body>

<%
String role = (String)session.getAttribute("role");
String user = (String)session.getAttribute("user");
if(user==null){
	response.sendRedirect("welcome");
%>
<%
}else if(user!=null&&role.equals("viewer"))
{
	response.sendRedirect("viewerdashboard");
}


%>


	<div class="agile-login">
	<div class="wrapper">
		<h2>New Admin Registration</h2>
		<div class="w3ls-form">
				<form method="POST" action="save-user">
					<input type="hidden" name="id" value="${admin.admin_id}" required="required" />
					 <label>First name</label>
					<input type="text" name="first_name" value="${admin.first_name}" required="required" />
					 <label>Last Name</label> 
					<input type="text" name="last_name"value="${admin.last_name }" required="required" /> 
					 <label>email</label>
					<input type="email" name="email" value="${admin.email}" required="required" />
					 <label>phone no</label>
					<input type="text" name="phone_no" value="${admin.phone_no}" pattern="[0-9]+" required="required" />
					
					 <label>Password</label>
					<input type="password" name="password" value="${admin.password}" required="required" />
					<input type="submit" class="btn btn-primary" value="Register" />
					
				</form>
			  </div>
	       </div>
	  </div>

		
	  </body>
	  </html>
