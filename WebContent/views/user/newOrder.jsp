<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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

	<!--REGISTER SECTION START-->
	<section id="register">
		<div class="container">
			<div class="row text-center header animate-in"
				data-anim-type="fade-in-up">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<h3>Zamów kuriera</h3>
					<hr />
				</div>
			</div>

			<div class="row text-center animate-in" data-anim-type="fade-in-up">
				<div class="row">
					<div
						class="col-xs-12 col-sm-6 col-sm-offset-3 col-md-6 col-md-offset-3 col-lg-6 col-lg-offset-3">
						<c:if test="${orderResult != null}">
							<div class="alert alert-success" role="alert">
								<strong>Bardzo dobrze!</strong> Kurier został zamówiony.
							</div>
						</c:if>
					</div>
				</div>
				<form:form role="form" modelAttribute="newOrder" method="post"
					id="addOrderForm">
					<div
						class="col-xs-12 col-sm-4 col-sm-offset-1 col-md-4 col-md-offset-1 col-lg-4 col-lg-offset-1">
						<div class="contact-wrapper">
							<div class="row">
								<div class="form-group">
									<label for="wartoscCalkowitaZl">Zadeklarowana wartość
										przesyłki</label>
									<form:input type="number" min="0.01" step="0.01" max="99999"
										name="wartoscCalkowitaZl" id="wartoscCalkowitaZl"
										class="form-control input-custom" placeholder="Wartość w PLN"
										path="value" title="Pełna wartość zamówienia" required="true"
										autofocus="true" />
								</div>
							</div>
							<div class="row">
								<div class="form-group">
									<label for="gabaryt">Gabaryt</label>
									<form:select class="form-control" path="dimension" id="gabaryt"
										name="gabaryt" required="true">
										<form:option value="A">A</form:option>
										<form:option value="B">B</form:option>
										<form:option value="C">C</form:option>
									</form:select>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
						<div class="contact-wrapper">

							<div class="row">
								<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
									<div class="form-group">
										<label for="imieOdbiorcy">Imie</label>
										<form:input type="text" name="imieOdbiorcy" id="imieOdbiorcy"
											class="form-control input-custom" placeholder="Imię Odbiorcy"
											path="name" required="true" />
									</div>
								</div>
								<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
									<div class="form-group">
										<label for="nazwiskoOdbiorcy">Nazwisko</label>
										<form:input type="text" name="nazwiskoOdbiorcy"
											id="nazwiskoOdbiorcy" class="form-control input-custom"
											placeholder="Nazwisko Odbiorcy" path="surname"
											required="true" />
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
									<div class="form-group">
										<label for="kodPocztowyOdbiorcy">Kod pocztowy</label>
										<form:input type="text" name="kodPocztowyOdbiorcy"
											id="kodPocztowyOdbiorcy" class="form-control input-custom"
											placeholder="Kod pocztowy" path="postalCode"
											pattern="[0-9]{2}\-[0-9]{3}" required="true" />
									</div>
								</div>
								<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
									<div class="form-group">
										<label for="miastoOdbiorcy">Miasto</label>
										<form:input type="text" name="miastoOdbiorcy"
											id="miastoOdbiorcy" class="form-control input-custom"
											placeholder="Miasto" path="city" required="true" />
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
									<div class="form-group">
										<label for="adresOdbiorcy">Adres</label>
										<form:input type="text" name="adresOdbiorcy"
											id="adresOdbiorcy" class="form-control input-custom"
											placeholder="Ulica, nr domu/mieszkania" path="address"
											required="true" />
									</div>
								</div>
							</div>

							<div class="row">
								<div
									class="col-xs-12 col-sm-12 col-md-8 col-md-offset-2  col-lg-8 col-lg-offfset-2">
									<div class="form-group">
										<label for="telefonOdbiorcy">Numer Telefonu</label>
										<form:input type="tel" name="telefonOdbiorcy"
											id="telefonOdbiorcy" class="form-control input-custom"
											placeholder="Numer telefonu adresata" path="phone"
											pattern="[0-9]{9}" required="true" />
									</div>
								</div>
							</div>

							<div class="row">
								<div
									class="col-xs-8 col-xs-offset-2 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4 col-lg-4 col-lg-offset-4 ">
									<div class="form-group">
										<label for="addNewOrder"></label> <input id="addNewOrder"
											type="submit" value="Wyślij zamówienie"
											class="btn btn-block button-custom btn-custom-one"
											role="button" />
									</div>
								</div>
							</div>

						</div>
					</div>
				</form:form>
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

	<script>
		$(document).ready(function() {
			var submited = "${orderResult}";
			if (submited) {
				$("#addOrderForm :input").prop("disabled", true);
				$("#addNewOrder").hide();
			}

		});
	</script>
</body>
</html>