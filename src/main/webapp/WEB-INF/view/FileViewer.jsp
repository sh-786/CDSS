<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>Admin</title>
    <link rel="icon" type="image/png" sizes="16x16" href="static/css/admin/plugins/images/favicon.png">
<script src="https://mozilla.github.io/pdf.js/build/pdf.js"></script>
<link href="static/css/admin/css/style.min.css" rel="stylesheet">
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

	
	<iframe src="${fpath}#toolbar=0" width="1200px" height=95%></iframe>
		
		<a class="btn btn-danger" href="closefile?filename=${fname}">Exit</a>
		<a class="btn btn-success" href="pleasework">Add digital sign</a>
		
				
</body>


</html>