<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<script src="https://mozilla.github.io/pdf.js/build/pdf.js"></script>
<title>User</title>
    <link rel="icon" type="image/png" sizes="16x16" href="static/css/admin/plugins/images/favicon.png">
<link href="static/css/admin/css/style.min.css" rel="stylesheet">
</head>
<body>

	<%
		String role = (String) session.getAttribute("role");
	String user = (String) session.getAttribute("user");
	if (user == null) {
		response.sendRedirect("welcome");
	%>
	<%
		} else if (user != null && role.equals("admin")) {
	response.sendRedirect("admindashboard");
	}
	%>




	
	<iframe src="${fpath}#toolbar=0" width="1200px" height=95%></iframe>
		
		<a class="btn btn-danger" href="closefileuser?filename=${fname}">Exit</a>
</body>


</html>