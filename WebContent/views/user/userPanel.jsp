<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<title>${title}</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<link rel='stylesheet'
	href='webjars/bootstrap/3.3.4/css/bootstrap.min.css' />
<!-- ION ICONS STYLES -->
<link href="resources/css/ionicons.css" rel="stylesheet" />
<!-- FONT AWESOME ICONS STYLES -->
<link href="resources/css/font-awesome.css" rel="stylesheet" />
<!-- FANCYBOX POPUP STYLES -->
<link href="resources/js/source/jquery.fancybox.css" rel="stylesheet" />
<!-- STYLES FOR VIEWPORT ANIMATION -->
<link href="resources/css/animations.min.css" rel="stylesheet" />
<!-- CUSTOM CSS -->
<link href="resources/css/style-solid-black.css" rel="stylesheet" />

</head>
<body data-spy="scroll" data-target="#menu-section">

<!--MENU SECTION START-->
	<div class="navbar navbar-inverse navbar-fixed-top scroll-me"
		id="menu-section">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${pageContext.request.contextPath}"> KurierFlex </a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
				<li><a href="${pageContext.request.contextPath}/#pricing">Oferta</a></li>
					<li><a href="${pageContext.request.contextPath}/#services">Usługi</a></li>
					<li><a href="${pageContext.request.contextPath}/#localize">Monitoring</a></li>
					<li><a href="${pageContext.request.contextPath}/#contact">Kontakt</a></li>
					<li><a href="${pageContext.request.contextPath}/#register">Rejestracja</a></li>
					<sec:authorize access="isAnonymous()">
	  					<li>
	  						<a href="<c:url value="login.htm"/>"><span class="glyphicon glyphicon-log-in"></span></a>	
						</li>
  					</sec:authorize>
	  						
					<sec:authorize access="isAuthenticated()">
						<li class="dropdown">
          					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><sec:authentication property="principal.username" /> <span class="caret"></span></a>
          					<ul class="dropdown-menu dropdown-custom" role="menu">
            					<li><a href="<c:url value="/userPanel.htm"/>" >Panel użytkownika</a></li>
           	 					<li><a href="<c:url value="/j_spring_security_logout"/>" >Wyloguj <span class="glyphicon glyphicon-log-out"></span></a></li>
          					</ul>
						</li>
					</sec:authorize>
				</ul>
			</div>

		</div>
	</div>
	<!--MENU SECTION END-->


	<!--TEAM SECTION START-->
<section id="team" >
<div class="container">
<div class="row text-center header animate-in" data-anim-type="fade-in-up">
<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
<h2>Panel użytkownika </h2>
<hr />
</div>
</div>
<div class="row animate-in" data-anim-type="fade-in-up">

<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
<div class="team-wrapper">
<div class="team-inner" style="background-image: url('resources/img/userPanel/1.jpg')" >
<a href="<c:url value="userPanel/newOrder.htm"/>" > <i class="fa fa-truck" ></i></a>
</div>
<div class="description">
<h3> Zamów kuriera</h3>
<h5> <strong> Zamów kuriera wraz z usługą </strong></h5>
<p>
Wybierz rozmiar, czas odbioru, rodzaj usługi oraz adres odbiorcy. O resztę się nie martw.
</p>
</div>
</div>
</div>
<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
<div class="team-wrapper">
<div class="team-inner" style="background-image: url('resources/img/userPanel/2.jpg')" >
<a href="<c:url value="userPanel/history.htm"/>" > <i class="fa fa-tasks" ></i></a>
</div>
<div class="description">
<h3> Historia zleceń</h3>
<h5> <strong> Przejdź do historii zleceń </strong></h5>
<p>
Sprawdź historię swoich zamówień, miej wszystko pod kontrolą.
</p>
</div>
</div>
</div>
<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
<div class="team-wrapper">
<div class="team-inner" style="background-image: url('resources/img/userPanel/3.jpg')" >
<a href="<c:url value="/j_spring_security_logout"/>" > <i class="fa fa-power-off" ></i></a>
</div>
<div class="description">
<h3> Wyloguj</h3>
<h5> <strong> Naciśnij aby się wylogować </strong></h5>
<p>
Zaglądaj tu częsciej.<br>
Do następnego razu!
</p>
</div>
</div>
</div>
</div>
</div>
</section>
<!--TEAM SECTION END-->

	<!-- BOOTSTRAP AND JQUERY SCRIPTS -->
	<script src="webjars/jquery/2.1.3/jquery.min.js"></script>
	<script src="webjars/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<!-- VEGAS SLIDESHOW SCRIPTS -->
	<script src="resources/js/vegas/jquery.vegas.min.js"></script>
	<!-- EASING SCROLL SCRIPTS PLUGIN -->
	<script src="resources/js/jquery.easing.min.js"></script>
	<!-- FANCYBOX PLUGIN -->
	<script src="resources/js/source/jquery.fancybox.js"></script>
	<!-- ISOTOPE SCRIPTS -->
	<script src="resources/js/jquery.isotope.js"></script>
	<!-- VIEWPORT ANIMATION SCRIPTS   -->
	<script src="resources/js/appear.min.js"></script>
	<script src="resources/js/animations.min.js"></script>
	<!-- CUSTOM SCRIPTS -->
	<script src="resources/js/custom-solid.js"></script>
</body>
</html>