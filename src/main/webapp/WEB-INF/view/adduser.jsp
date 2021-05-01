<!DOCTYPE html>
<%@taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>DocTrust</title>

  <link href="static/assets/img/favicon.png" rel="icon">

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
		<h2>Viewer Registration</h2>
		<div class="w3ls-form">
				<form method="POST" action="save-viewer">
					<input type="hidden" name="id" value="${viewer.viewer_id}" required />
					 <label>First name</label>
					<input type="text" name="first_name" value="${viewer.first_name}" required/>
					 <label>Last Name</label> 
					<input type="text" name="last_name"value="${viewer.last_name }" required /> 
					 <label>email</label>
					<input type="email" name="email" value="${viewer.email}" required />
					 <label>phone no</label>
					<input type="text" name="phone_no" value="${viewer.phone_no}" pattern="[0-9]+" maxlength="10" required/>	
					<label>company_name</label>
					<select id="ddmenu" name="company_name" value="${viewer.company_name}" required />
					<option value="CDAC_Ecity">CDAC Ecity</option>
						<option value="CDAC_KP">CDAC KP</option>
	                 	<option value="CDAC_Pune">CDAC Pune</option> 
                 	</select>
                 	
					<label>Department</label>
					<select id="ddmenu" name="department" value="${viewer.department}" required />
						<option value="HR">HR</option>
						<option value="Technical">Technical</option>
	                 	<option value="NonTechnical">Non Technical</option> 
                 	</select>
					
					<label>Password</label>
					<input type="password" name="password" value="${viewer.password}" required />
					
					
					 
					<input type="submit" class="btn btn-primary" value="Register" />
					
				</form>
			  </div>
	       </div>
	  </div>
	  </body>
	  </html>
