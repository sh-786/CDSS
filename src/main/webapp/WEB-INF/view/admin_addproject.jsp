<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
    <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin</title>
    <link rel="canonical" href="https://www.wrappixel.com/templates/ample-admin-lite/" />
    <link rel="icon" type="image/png" sizes="16x16" href="static/css/admin/plugins/images/favicon.png">
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
    <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5" data-sidebartype="full"
        data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
        <header class="topbar" data-navbarbg="skin5">
            <nav class="navbar top-navbar navbar-expand-md navbar-dark">
                <div class="navbar-header" data-logobg="skin6">
            <a class="navbar-brand" href ="admindashboard">
                <b class="logo-icon">
                    <img src="static/css/admin/plugins/images/logo-icon.png" alt="homepage" />
                </b>
                <span class="logo-text">
                    <img src="static/css/admin/plugins/images/logo-text.png" alt="homepage" />
                </span>
            </a>
            <a class="nav-toggler waves-effect waves-light text-dark d-block d-md-none"
                href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
        </div>
        <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5">
            
            <ul class="navbar-nav ml-auto d-flex align-items-center">
                <li>
                    
                            <a href="/logout"  class="btn btn-warning" >Log Out</a>
                </li>
            </ul>
        </div>
    </nav>
        </header>
        <aside class="left-sidebar" data-sidebarbg="skin6">
            <div class="scroll-sidebar">
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                        
                        <li class="sidebar-item pt-2">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="adminviewuser"
                                aria-expanded="false">
                                <i class="far fa-clock" aria-hidden="true"></i>
                                <span class="hide-menu">View User</span>
                            </a>
                        </li>
                        <li class="sidebar-item pt-2">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/register_Admin"
                                aria-expanded="false">
                                <i class="far fa-clock" aria-hidden="true"></i>
                                <span class="hide-menu">Add Admin</span>
                            </a>
                        </li>
                        <li class="sidebar-item pt-2">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/register_viewer"
                                aria-expanded="false">
                                <i class="far fa-clock" aria-hidden="true"></i>
                                <span class="hide-menu">Add User</span>
                            </a>
                        </li>
                        <li class="sidebar-item pt-2">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="adddocument"
                                aria-expanded="false">
                                <i class="far fa-clock" aria-hidden="true"></i>
                                <span class="hide-menu">Add Documnet</span>
                            </a>
                        </li>
                        <li class="sidebar-item pt-2">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="viewdocument"
                                aria-expanded="false">
                                <i class="far fa-clock" aria-hidden="true"></i>
                                <span class="hide-menu">View Project</span>
                            </a>
                        </li>
                        
                        
                    </ul>

                </nav>
            </div>
        </aside>
        <div class="page-wrapper">
            <div class="page-breadcrumb bg-white">
                <div class="row align-items-center">
                    <div class="col-lg-6 col-md-4 col-sm-4 col-xs-12">
                        <h2 class="page-title text-uppercase font-medium font-18">Welcome to Upload File Dashboard</h2>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
            <div class="container-fluid">
                            
                <form class="form-horizontal form-material" action="uploaddocument"  enctype="multipart/form-data" method="POST">
                <div class="form-group mb-4">
                    <label for="example-email" class="col-md-12 p-0">Document Name</label>
                    <div class="col-md-12 border-bottom p-0">
                        <input type="text" 
                            class="form-control p-0 border-0" name="docname" value="${documents.doc_name}" id="docname" required="required ">
                    </div>
                </div>
                <div class="form-group mb-4">
                    <label for="example-email" class="col-md-12 p-0">Company Name</label>
                    <div class="col-md-12 border-bottom p-0">
                        <select id="ddmenu" name="compname" value="${documents.company_name}" required="required ">
                    	<option value="CDAC_ECITY">CDAC ECITY</option>
						<option value="CDAC_KP">CDAC KP</option>
	                 	<option value="CDAC_PUNE">CDAC PUNE</option> 
                 	</select>   
                    </div>
                </div>
                <div class="form-group mb-4">
                    <label for="example-email" class="col-md-12 p-0">Uploaded By</label>
                    <div class="col-md-12 border-bottom p-0">
                        <input type="text" placeholder=""
                            class="form-control p-0 border-0" name="uploadby" value="${documents.upload_name}" id="name" required="required ">
                    </div>
                </div>
                <div class="form-group mb-4">
                    <label for="example-email" class="col-md-12 p-0">Department</label>
                    <div class="col-md-12 border-bottom p-0">
                        <select id="ddmenu" name="department" value="${documents.department}" required="required " />
						<option value="HR">HR</option>
						<option value="Technical">Technical</option>
	                 	<option value="NonTechnical">Non Technical</option> s
                 	</select>                         
                     </div>
                </div>
                <div class="form-group mb-4">
                    <label class="col-md-12 p-0">Upload File</label><br><br>
                    <div class="col-md-2 border-bottom p-0">
                      <input type="file" accept=".pdf" name="file" value="${documents.file}" required="required" >
                    </div>
                </div>
                
                <div class="form-group mb-4">
                    <div class="col-sm-12">
                      <button class="btn btn-success">Upload Document</button>
                    </div>
                </div>
                <div class="alert alert-danger" role="alert">${mgs}</div>
            </form>
            
           
                 
            </div>
           </div>          
        </div>
    </div>
    </body>

</html>