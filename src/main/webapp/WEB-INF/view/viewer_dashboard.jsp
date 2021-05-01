<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Viewer</title>
<link rel="icon" type="image/png" sizes="16x16"
	href="static/css/admin/plugins/images/favicon.png">
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


	<div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5"
		data-sidebartype="full" data-sidebar-position="absolute"
		data-header-position="absolute" data-boxed-layout="full">
		<header class="topbar" data-navbarbg="skin5">
			<nav class="navbar top-navbar navbar-expand-md navbar-dark">
				<div class="navbar-header" data-logobg="skin6">
					<div class="navbar-brand">
						<b class="logo-icon"> <img
							src="static/css/admin/plugins/images/logo-icon.png"
							alt="homepage" />
						</b> <span class="logo-text"> <img
							src="static/css/admin/plugins/images/logo-text.png"
							alt="homepage" />
						</span>
					</div>
					<a
						class="nav-toggler waves-effect waves-light text-dark d-block d-md-none"
						href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
				</div>
				<div class="navbar-collapse collapse" id="navbarSupportedContent"
					data-navbarbg="skin5">

					<ul class="navbar-nav ml-auto d-flex align-items-center">
						<li><a href="/logout" class="btn btn-warning">Log Out</a></li>
					</ul>
				</div>
			</nav>
		</header>

		<div class="row">
			<div class="col-md-12 col-lg-12 col-sm-12">
				<div class="white-box">
					<div class="d-md-flex mb-3">
						<h3 class="box-title mb-0" style="color: navy;">Document List</h3>
						<div class="search-box"></div>
					</div>
					<div class="table-responsive"
						style="overflow-y: scroll; height: 20em;">
						<table style="overflow: scroll;" class="table no-wrap">
							<thead>
								<tr>

									<th class="border-top-0">Document Name</th>
									<th class="border-top-0">Uploaded By</th>
									<th class="border-top-0">Action</th>

								</tr>
							</thead>
							<tbody style="overflow-x: auto">
								<c:forEach var="list" items="${doclist}">
									<tr>

										<td class="border-top-0">${list.getDoc_name()}</td>
										<td class="border-top-0">${list.getUpload_name()}</td>
										<td class="border-top-0"><a class="btn btn-success"	href="userfileviewer?filepath=${list.getFilePath()}"> View Document</a></td>

									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

</html>