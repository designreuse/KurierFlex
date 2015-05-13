<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<title>${title}</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<link rel='stylesheet'
	href="<c:url value="/webjars/bootstrap/3.3.4/css/bootstrap.min.css"/>" />
<!-- ION ICONS STYLES -->
<link href="<c:url value="/resources/css/ionicons.css"/>"
	rel="stylesheet" />
<!-- FONT AWESOME ICONS STYLES -->
<link href="<c:url value="/resources/css/font-awesome.css"/>"
	rel="stylesheet" />
<!-- FANCYBOX POPUP STYLES -->
<link href="<c:url value="/resources/js/source/jquery.fancybox.css"/>"
	rel="stylesheet" />
<!-- STYLES FOR VIEWPORT ANIMATION -->
<link href="<c:url value="/resources/css/animations.min.css"/>"
	rel="stylesheet" />
<!-- CUSTOM CSS -->
<link href="<c:url value="/resources/css/style-solid-black.css"/>"
	rel="stylesheet" />

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
				<a class="navbar-brand" href="${pageContext.request.contextPath}">
					KurierFlex </a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="${pageContext.request.contextPath}/#pricing">Oferta</a></li>
					<li><a href="${pageContext.request.contextPath}/#services">Usługi</a></li>
					<li><a href="${pageContext.request.contextPath}/#localize">Monitoring</a></li>
					<li><a href="${pageContext.request.contextPath}/#contact">Kontakt</a></li>
					<li><a href="${pageContext.request.contextPath}/#register">Rejestracja</a></li>
					<sec:authorize access="isAnonymous()">
						<li><a href="<c:url value="login.htm"/>"><span
								class="glyphicon glyphicon-log-in"></span></a></li>
					</sec:authorize>

					<sec:authorize access="isAuthenticated()">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false"><sec:authentication
									property="principal.username" /> <span class="caret"></span></a>
							<ul class="dropdown-menu dropdown-custom" role="menu">
								<li><a href="<c:url value="/userPanel.htm"/>">Panel
										użytkownika</a></li>
								<li><a href="<c:url value="/j_spring_security_logout"/>">Wyloguj
										<span class="glyphicon glyphicon-log-out"></span>
								</a></li>
							</ul></li>
					</sec:authorize>
				</ul>
			</div>
		</div>
	</div>
	<!--MENU SECTION END-->

	<section id="register">
		<div class="container">
			<div class="row text-center header animate-in"
				data-anim-type="fade-in-up">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<h3>Historia przesyłek</h3>
					<hr />
				</div>
			</div>

			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 ">
					<div class="contact-wrapper">

						<c:forEach items="${userParcels}" var="order">

							<div class="panel-group-custom" id="accordion" role="tablist"
								aria-multiselectable="true">
								<div class="panel panel-default panel-custom">
									<div class="panel-heading" role="tab"
										id="heading${order.parcelId}">
										<h4 class="panel-title">
											<a class="collapsed" data-toggle="collapse"
												data-parent="#accordion" href="#collapse${order.parcelId}"
												aria-expanded="true"
												aria-controls="collapse${order.parcelId}"> Zamówienie
												numer: #${order.parcelId} </a> <span class="panel-title-custom">Status
												przesyłki: ${order.status}</span>

										</h4>

									</div>
									<div id="collapse${order.parcelId}"
										class="panel-collapse collapse" role="tabpanel"
										aria-labelledby="heading${order.parcelId}">
										<div class="panel-body">

											<div class="row">
												<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 ">
													<h4>Dane odbiorcy:</h4>
													<address>
														<strong>Imię:</strong> ${order.name} <br> <strong>Nazwisko:</strong>
														${order.surname} <br> <strong>Adres: </strong><br>
														${order.address}<br> ${order.city},
														${order.postalCode }<br> <strong>Telefon: </strong>
														${order.phone }
													</address>
												</div>
												<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 ">
													<div class="row">
														<h4>Informacje o przesyłce:</h4>
														<address>
															<strong>Numer przesyłki:</strong> ${order.parcelId} <br>
															<strong>Aktualny status przesyłki:</strong>
															${order.status} <br> <strong>Data
																dostarczenia: </strong> ${order.deliveryDate}
														</address>
													</div>
													<div class="row">
														<address>
															<strong>Zadeklarowana wartość: </strong> ${order.value }
															<br> <strong>Gabaryt: </strong> ${order.dimension} <br>
															<strong>Data nadania: </strong> ${order.orderDate} <br>

														</address>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- BOOTSTRAP AND JQUERY SCRIPTS -->
	<script src="<c:url value="/webjars/jquery/2.1.3/jquery.min.js"/>"></script>
	<script
		src="<c:url value="/webjars/bootstrap/3.3.4/js/bootstrap.min.js"/>"></script>
	<!-- VEGAS SLIDESHOW SCRIPTS -->
	<script src="<c:url value="/resources/js/vegas/jquery.vegas.min.js"/>"></script>
	<!-- EASING SCROLL SCRIPTS PLUGIN -->
	<script src="<c:url value="/resources/js/jquery.easing.min.js"/>"></script>
	<!-- FANCYBOX PLUGIN -->
	<script src="<c:url value="/resources/js/source/jquery.fancybox.js"/>"></script>
	<!-- ISOTOPE SCRIPTS -->
	<script src="<c:url value="/resources/js/jquery.isotope.js"/>"></script>
	<!-- VIEWPORT ANIMATION SCRIPTS   -->
	<script src="<c:url value="/resources/js/appear.min.js"/>"></script>
	<script src="<c:url value="/resources/js/animations.min.js"/>"></script>
	<!-- CUSTOM SCRIPTS -->
	<script src="<c:url value="/resources/js/custom-solid.js"/>"></script>
</body>
</html>