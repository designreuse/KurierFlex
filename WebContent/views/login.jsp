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
          					<a href="#" class="dropdown-toggle dropdown-custom" data-toggle="dropdown" role="button" aria-expanded="false"><sec:authentication property="principal.username" /> <span class="caret"></span></a>
          					<ul class="dropdown-menu" role="menu">
            					<li><a href="<c:url value="${pageContext.request.contextPath}/userPanel.htm"/>" >Panel użytkownika</a></li>
           	 					<li><a href="<c:url value="/j_spring_security_logout"/>" >Wyloguj <span class="glyphicon glyphicon-log-out"></span></a></li>
          					</ul>
						</li>
					</sec:authorize>
				</ul>
			</div>

		</div>
	</div>
	<!--MENU SECTION END-->

	<section id="login">
		<div class="container">
			<div class="row text-center header animate-in"
				data-anim-type="fade-in-up">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

					<h2>Logowanie do panelu użytkownika</h2>
					<hr />

				</div>
			</div>

			<div class="row animate-in" data-anim-type="fade-in-up">
				<div
					class="col-sm-6 col-sm-offset-3 col-md-6 col-md-offset-3 col-lg-6 col-lg-offset-3 ">
					<div class="login-wrapper">

						<form role="form"
							action="<c:url value='j_spring_security_check.htm' />"
							method="post">
							<div class="row">
								<input class="form-control input-custom" type="text" name="j_username" class="form-control"
									placeholder="Nazwa użytkownika" required autofocus value='<c:if test="${not empty param.error}"><c:out value="${sessionScope.LAST_USERNAME}"/></c:if>' /> 
								<input class="form-control input-custom" type="password" name="j_password" class="form-control"
									placeholder="Hasło" required />
							</div>
							<div class="row">
								<div class="col-sm-6 col-sm-offset-3 col-md-6 col-md-offset-3 col-lg-6 col-lg-offset-3">
									<button class="btn btn-block button-custom btn-custom-two" type="submit" value="Login">Zaloguj</button>
								</div>
							</div>
						</form>
						
						<c:if test="${not empty param.error}">
						<div class="alert alert-danger">
						<strong>Błąd!</strong>
						Podana nazwa użytkownika lub hasło są nieprawidłowe.
						</div>
						
					</c:if>
						
					</div>
				</div>
			</div>
		</div>
	</section>

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