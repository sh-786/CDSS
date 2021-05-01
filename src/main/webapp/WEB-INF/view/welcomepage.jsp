<!DOCTYPE html>
<%@taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache"> 
<meta http-equiv="Expires" content="sat,24 Dec 2020 00:00:000 GMT">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>DocTrust</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  
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
if(user!=null&&role.equals("admin")){
	response.sendRedirect("admindashboard");
%>
<%
}else if(user!=null&&role.equals("viewer"))
{
	response.sendRedirect("viewerdashboard");
}


%>



<c:choose>
	<c:when test="${mode=='MODE_HOME' }">
	<!-- ======= Header ======= -->
  <header id="header">
    <div class="container">

      <div class="logo float-left">
        <h1 class="text-light"><a href="/welcome"><span>DocTrust</span></a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="/welcome"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
      </div>

      <nav class="nav-menu float-right d-none d-lg-block">
        <ul>
          <li class="active"><a href="/welcome">Home</a></li>
          <li><a href="#about">About Us</a></li>
          <li><a href="#services">Services</a></li>
          <li><a href="#team">Team</a></li>
          <li class="drop-down"><a href="">Login</a>
            <ul>
              <li><a href="/login">Admin Login</a></li>
              <li><a href="/loginV">User Login</a></li>
            </ul>
          </li>
          
          <li><a href="#contact">Contact Us</a></li>
        </ul>
      </nav>
    </div>
  </header>

  <!-- ======= Hero Section ======= -->
  <section id="hero">
    <div class="hero-container">
      <div id="heroCarousel" class="carousel slide carousel-fade" data-ride="carousel">

        <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

        <div class="carousel-inner" role="listbox">

          <!-- Slide 1 -->
          <div class="carousel-item active" style="background-image: url('static/assets/img/slide-1.jpg'); background-repeat: no-repeat; background-size: cover;">
            <div class="carousel-container">
              <div class="carousel-content container">
                <h2 class="animate__animated animate__fadeInDown">Welcome to <span>DocTrust</span></h2>
                <p class="animate__animated animate__fadeInUp"> A Secure Document Storage <p>Whether in your pocket, home, car, or the cloud, it's likely DocTrust is with you every step of the way.</p> 
                <a href="#about" class="btn-get-started animate__animated animate__fadeInUp scrollto">Read More</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <main id="main">

 
    <section id="about" class="about">
      <div class="container">

        <div class="row no-gutters">
          <div class="col-lg-6 video-box">
            <img src="static/assets/img/about.jpg" class="img-fluid" alt="">
          </div>

          <div class="col-lg-6 d-flex flex-column justify-content-center about-content">

            <div class="section-title">
              <h2>About Us</h2>
              <p>We have founded DOCTRUST because we couldn’t have imagined how far the industry would come. We are one of the very first companies to help customers digitize their asset archives and over the years</p>
            </div>
            <br>
            <br>
            <div class="icon-box" data-aos="fade-up">
              <div class="icon"><i class="bx bx-fingerprint"></i></div>
              <h4 class="title"><a href="">Our Mission</a></h4>
              <p class="description">Our mission is to create the only human-centric digital asset management solution that empowers our customers to self-organize, collaborate and do meaningful work that drives their business forward.</p>
            </div>

          </div>
        </div>

      </div>
    </section>

    <section class="counts section-bg">
      <div class="container">

        <div class="row">

          <div class="col-lg-4 col-md-6 text-center" data-aos="fade-up">
            <div class="count-box">
              <i class="icofont-simple-smile" style="color: #20b38e;"></i>
              <span >100+</span>
              <p>Happy Clients</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 text-center" data-aos="fade-up" data-aos-delay="200">
            <div class="count-box">
              <i class="icofont-document-folder" style="color: #c042ff;"></i>
              <span>500+</span>
              <p>Projects</p>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 text-center" data-aos="fade-up" data-aos-delay="600">
            <div class="count-box">
              <i class="icofont-users-alt-5" style="color: #ffb459;"></i>
              <span>5</span>
              <p>Hard Workers</p>
            </div>
          </div>

        </div>

      </div>
    </section>

    <section id="services" class="services">
      <div class="container">

        <div class="section-title">
          <h2>Services</h2>
        </div>

        <div class="row">
          <div class="col-lg-12 col-md-12 icon-box" data-aos="fade-up">
            <div class="icon"><i class="icofont-computer"></i></div>
            <h4 class="title">Document Storage & Access of Documents</h4>
            <p class="description">Browser Based Clients accessing PDF Documents</p>
          </div>
        </div>

      </div>
    </section>

    <section id="team" class="team">
      <div class="container">

        <div class="section-title">
          <h2>Our Team</h2>
        </div>
        
        <div class="col-xl-3 col-lg-4 col-md-6" data-aos="fade-up">
            <div class="member">
              <div class="pic"><img src="static/assets/img/team-guide.jpg" class="img-fluid" alt=""></div>
              <div class="member-info">
                <h4>Mr. Gopinath</h4>
                <span>Guide</span>
              </div>
            </div>
          </div>

        <div class="row">

          <div class="col-xl-3 col-lg-4 col-md-6" data-aos="fade-up">
            <div class="member">
              <div class="pic"><img src="static/assets/img/team-1.jpg" class="img-fluid" alt=""></div>
              <div class="member-info">
                <h4>Devyani Vaidya.</h4>
                <span>Leader</span>
              </div>
            </div>
          </div>

          <div class="col-xl-3 col-lg-4 col-md-6" data-aos="fade-up">
            <div class="member">
              <div class="pic"><img src="static/assets/img/team-2.jpg" class="img-fluid" alt=""></div>
              <div class="member-info">
                <h4>Priyanshi Singh.</h4>
                <span>Member</span>
              </div>
            </div>
          </div>

          <div class="col-xl-3 col-lg-4 col-md-6" data-aos="fade-up">
            <div class="member">
              <div class="pic"><img src="static/assets/img/team-3.jpg" class="img-fluid" alt=""></div>
              <div class="member-info">
                <h4>Almurtaja Kotwal.</h4>
                <span>Member</span>
              </div>
            </div>
          </div>

          <div class="col-xl-3 col-lg-4 col-md-6" data-aos="fade-up">
            <div class="member">
              <div class="pic"><img src="static/assets/img/team-4.jpg" class="img-fluid" alt=""></div>
              <div class="member-info">
                <h4>Sammed Neje</h4>
                <span>Member</span>
              </div>
            </div>
          </div>

        </div>

      </div>
    </section>

    
    <section id="contact" class="contact">
      <div class="container">
        <div class="section-title">
          <h2>Contact Us</h2>
        </div>
        <div class="row">

          <div class="col-lg-6 d-flex align-items-stretch" data-aos="fade-up">
            <div class="info-box">
              <i class="bx bx-map"></i>
              <h3>Our Address</h3>
              <p>C-DAC ACTS, Bangalore. (Electronic City)</p>
            </div>
          </div>

          <div class="col-lg-3 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="100">
            <div class="info-box">
              <i class="bx bx-envelope"></i>
              <h3>Email Us</h3>
              <p>cdac@gmail.com</p>
            </div>
          </div>

          <div class="col-lg-3 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="200">
            <div class="info-box ">
              <i class="bx bx-phone-call"></i>
              <h3>Call Us</h3>
              <p>+91- 9876543210</p>
            </div>
          </div>
        </div>
      </div>
    </section>

  </main>

  
  <footer id="footer">
    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong><span>DocTrust</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        Designed by Team DocTrust
      </div>
    </div>
  </footer>

  <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

 
  <script src="static/assets/vendor/jquery/jquery.min.js"></script>
  <script src="static/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="static/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="static/assets/vendor/php-email-form/validate.js"></script>
  <script src="static/assets/vendor/jquery-sticky/jquery.sticky.js"></script>
  <script src="static/assets/vendor/venobox/venobox.min.js"></script>
  <script src="static/assets/vendor/waypoints/jquery.waypoints.min.js"></script>
  <script src="static/assets/vendor/counterup/counterup.min.js"></script>
  <script src="static/assets/vendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="static/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="static/assets/vendor/aos/aos.js"></script>

 
  <script src="static/assets/js/main.js"></script>

	

	</c:when>
	
	
	
	<c:when test="${mode=='MODE_LOGIN_VIEWER' }">
		<div class="agile-login">
         <div class="wrapper">
			<h3>Viewer Login</h3>
			<hr>
			<div class="w3ls-form">
			<form method="POST" action="/login-viewer">
				<c:if test="${not empty error }">
					<div class= "alert alert-danger">
					<c:out value="${error }"></c:out>
					</div>
				</c:if>
				<label>email</label>
				<input type="email" class="form-control" name="email" value="${viewer.email }" required="required " />
				<label>Password</label>
				<input type="password" class="form-control" name="password"	value="${viewer.password }" required="required " />
				<input type="submit" class="btn btn-primary" value="Login" />
				 
		</form>
	    </div>
	 </div>
	</div>
	</c:when>
	<c:when test="${mode=='ALL_VIEWER' }">
			<div>
        <h2>All Viewer</h2>
        <table id="user">
            <tr>
                <tr>
                    <th>viewer_id</th>
                    <th>first_name</th>
                    <th>First Name</th>
                    <th>LastName</th>
                    <th>Age</th>
                    <th>Delete</th>
                    <th>Edit</th>
                </tr>
                <c:forEach var="user" items="${users }">
                    <tr>
                        <td>${admin.admin_id}</td>
                        <td>${admin.username}</td>
                        <td>${admin.firstname}</td>
                        <td>${admin.lastname}</td>
                        <td>${admin.age}</td>
                        <td><a href="/delete-user?user_id=${admin.admin_id }">
      <span class="glyphicon glyphicon-trash"></span></a></td>
                        <td>
                            <a href="/edit-user?user_id=${user.user_id }">
                                <span class="glyphicon glyphicon-pencil"></span></a>
                        </td>
                    </tr>
                </c:forEach>

        </table>
    </div>
		</c:when>
		<c:when test="${mode=='MODE_LOGIN' }">
		<div class="agile-login">
         <div class="wrapper">
			<h3>Admin Login</h3>
			<hr>
			<div class="w3ls-form">
			<form method="POST" action="/login_Admin">
				<c:if test="${not empty error }">
					<div class= "alert alert-danger">
					<c:out value="${error }"></c:out>
					</div>
				</c:if>
				<label>email</label>
				<input type="email" class="form-control" name="email" value="${admin.email }" required="required " />
				<label>Password</label>
				<input type="password" class="form-control" name="password"	value="${admin.password }" required="required " />
				<input type="submit" class="btn btn-primary" value="Login" />
				
		</form>
	    </div>
	 </div>
	</div>
	</c:when>
	</c:choose>

	<script src="static/js/jquery-1.11.1.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
</body>
</html>