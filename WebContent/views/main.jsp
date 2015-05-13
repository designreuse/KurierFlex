<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
					<li><a href="#pricing">Oferta</a></li>
					<li><a href="#services">Usługi</a></li>
					<li><a href="#localize">Monitoring</a></li>
					<li><a href="#contact">Kontakt</a></li>
					<li><a href="#register">Rejestracja</a></li>
				
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
	<!--HOME SECTION START-->
	<div id="home">
		<div class="container">
			<div class="row">
				<div
					class="shadow-box-top col-sm-8 col-sm-offset-2 col-md-8 col-md-offset-2 col-lg-8 col-lg-offset-2 ">
					<div id="carousel-slider" data-ride="carousel"
						class="carousel slide  animate-in" data-anim-type="fade-in-up">

						<div class="carousel-inner">
							<div class="item active">

								<h3>Nadawaj tak jak lubisz, bez wychodzenia z domu lub w
									jednym z Punktów Obsługi</h3>
								<p>Lorem ipsumdolor sitamet, consect adipiscing elit Lorem
									ipsumdolor sitamet, consect adipiscing elit. Lorem ipsumdolor
									sitamet, consect adipiscing elit Lorem ipsumdolor sitamet,
									consect adipiscing elit.</p>
							</div>
							<div class="item">
								<h3>Szybko i bezpieczenie do celu</h3>
								<p>Lorem ipsumdolor sitamet, consect adipiscing elit Lorem
									ipsumdolor sitamet, consect adipiscing elit. Lorem ipsumdolor
									sitamet, consect adipiscing elit Lorem ipsumdolor sitamet,
									consect adipiscing elit.</p>
							</div>
							<div class="item">
								<h3>Tanio i niezawodnie</h3>
								<p>Lorem ipsumdolor sitamet, consect adipiscing elit Lorem
									ipsumdolor sitamet, consect adipiscing elit. Lorem ipsumdolor
									sitamet, consect adipiscing elit Lorem ipsumdolor sitamet,
									consect adipiscing elit.</p>
							</div>
						</div>


					</div>


				</div>
			</div>
			<div class="row animate-in" data-anim-type="fade-in-up">
				<div
					class="shadow-box-bottom col-sm-6 col-sm-offset-3 col-md-6 col-md-offset-3 col-lg-8 col-lg-offset-2 scroll-me">

					<a href="#services" class=" btn button-custom btn-custom-two">Dowiedz
						się więcej </a>
				</div>
			</div>
		</div>

	</div>
	<!--HOME SECTION END-->
	<!--PRICING SECTION START-->
	<section id="pricing">
		<div class="container">
			<div class="row text-center header animate-in"
				data-anim-type="fade-in-up">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<h2>Oferta</h2>
					<hr />
				</div>
			</div>
			<div class="row pad-bottom animate-in" data-anim-type="fade-in-up">
				<div
					class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1">
					<div class="row db-padding-btm db-attached">
						<div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
							<div class="light-pricing">
								<div class="price">
									<small>Już od: </small> 10zł
								</div>
								<div class="type">STANDARD</div>

								<div class="pricing-footer">

									<a href="<c:url value="login.htm"/>" class="btn button-custom btn-custom-one">ZAMÓW
										KURIERA</a>
								</div>
							</div>
						</div>
						<div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
							<div class="light-pricing">
								<div class="price">
									<small>Już od: </small> 20zł
								</div>
								<div class="type">NEXT DAY 9:30</div>

								<div class="pricing-footer">

									<a href="<c:url value="login.htm"/>" class="btn button-custom btn-custom-one">ZAMÓW
										KURIERA</a>
								</div>
							</div>
						</div>
						<div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
							<div class="light-pricing">
								<div class="price">
									<small>Już od: </small> 25zł
								</div>
								<div class="type">NEXT DAY 12:00</div>

								<div class="pricing-footer">

									<a href="<c:url value="login.htm"/>" class="btn button-custom btn-custom-one">ZAMÓW
										KURIERA</a>
								</div>
							</div>
						</div>
						<div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
							<div class="light-pricing">
								<div class="price">
									<small>Już od: </small> 30zł
								</div>
								<div class="type">NEXT DAY "na godzinę"</div>

								<div class="pricing-footer">

									<a href="<c:url value="login.htm"/>" class="btn button-custom btn-custom-one">ZAMÓW
										KURIERA</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--PRIICING SECTION END-->
	<!--SERVICE SECTION START-->
	<section id="services">
		<div class="container">
			<div class="row text-center header">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 animate-in"
					data-anim-type="fade-in-up">
					<h2>Nasze usługi</h2>
					<hr />
				</div>
			</div>
			<div class="row animate-in" data-anim-type="fade-in-up">
				<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
					<div class="services-wrapper">
						<i class="ion-document"></i>
						<h3>Consectetur tellus nec</h3>
						Morbi mollis lectus et ipsum sollicitudin varius. Aliquam tempus
						ante placerat, consectetur tellus nec, porttitor nulla.
					</div>
				</div>
				<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
					<div class="services-wrapper">
						<i class="ion-scissors"></i>
						<h3>Consectetur tellus nec</h3>
						Morbi mollis lectus et ipsum sollicitudin varius. Aliquam tempus
						ante placerat, consectetur tellus nec, porttitor nulla.
					</div>
				</div>
				<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
					<div class="services-wrapper">
						<i class="ion-clipboard"></i>
						<h3>Consectetur tellus nec</h3>
						Morbi mollis lectus et ipsum sollicitudin varius. Aliquam tempus
						ante placerat, consectetur tellus nec, porttitor nulla.
					</div>
				</div>
				<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
					<div class="services-wrapper">
						<i class="ion-calendar"></i>
						<h3>Consectetur tellus nec</h3>
						Morbi mollis lectus et ipsum sollicitudin varius. Aliquam tempus
						ante placerat, consectetur tellus nec, porttitor nulla.
					</div>
				</div>
				<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
					<div class="services-wrapper">
						<i class="ion-erlenmeyer-flask"></i>
						<h3>Consectetur tellus nec</h3>
						Morbi mollis lectus et ipsum sollicitudin varius. Aliquam tempus
						ante placerat, consectetur tellus nec, porttitor nulla.
					</div>
				</div>
				<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
					<div class="services-wrapper">
						<i class="ion-monitor"></i>
						<h3>Consectetur tellus nec</h3>
						Morbi mollis lectus et ipsum sollicitudin varius. Aliquam tempus
						ante placerat, consectetur tellus nec, porttitor nulla.
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--SERVICE SECTION END-->
	<!--TEAM SECTION START-->
	<section id="localize">
		<div class="container">
			<div class="row text-center header animate-in"
				data-anim-type="fade-in-up">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<h2>Zlokalizuj paczkę</h2>
					<hr />
				</div>
			</div>
			<div class="row animate-in" data-anim-type="fade-in-up">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<div class="contact-wrapper">
						<form:form>

							<div class="row">
								<div class="col-xs-12 col-sm-12 col-md-8 col-md-offset-2 col-lg-8 col-lg-offset-2">
									<div class="form-group">
										<label for="parcelNumber">Numer przesyłki</label> 
										<input
											type="text" name="parcelNumber" id="parcelNumber"
											class="form-control"
											placeholder="Wprowadź numer przesyłki" pattern="[0-9]{10}"
											title="Numer przesyłki powinien zawierać 10 znaków"
											required autofocus />
									</div>
								</div>
								</div>
								<div class="row">
								<div
									class="col-xs-8 col-xs-offset-2 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4 col-lg-4 col-lg-offset-4 ">
									<div class="form-group">
										<label for="parcelSearch"></label>
									<input id="parcelSearch" type="submit" value="Szukaj"
										class="btn btn-block button-custom btn-custom-one"
										role="button" />
									</div>
								</div>
							</div>
							
						</form:form>

					</div>
				</div>
			</div>
		</div>	
	</section>
	<!--TEAM SECTION END-->
	<!--CONTACT SECTION START-->
	<section id="contact">
		<div class="container">
			<div class="row text-center header animate-in"
				data-anim-type="fade-in-up">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

					<h2>Napisz lub zadzwoń</h2>
					<hr />

				</div>
			</div>

			<div class="row animate-in" data-anim-type="fade-in-up">

				<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
					<div class="contact-wrapper">
						<h3>Portale społecznościowe:</h3>
						<div class="social-below">
							<a href="#" class="btn button-custom btn-custom-two">
								Facebook</a>
							<a href="#" class="btn button-custom btn-custom-two">
								Tweeter</a>
							<a href="#" class="btn button-custom btn-custom-two">
								Google+</a>
						</div>
					</div>

				</div>
				<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
					<div class="contact-wrapper">
						<h3>Kontakt:</h3>
						<h4>
							<strong>Email : </strong> support@kurierflex.com
						</h4>
						<h4>
							<strong>Call : </strong> +09-88-99-77-55
						</h4>
					</div>

				</div>

				<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
					<div class="contact-wrapper">
						<h3>Dane firmy:</h3>
						<h5>DHL Express</h5>
						<h5>Biuro Główne / Adres korespondencyjny:</h5>
						<h6>ul. Poleczki 21D</h6>
						<h6>02-822 Warszawa</h6>
					</div>

				</div>
			</div>


		</div>
	</section>
	<!--CONTACT SECTION END-->
	<!--REGISTER SECTION START-->
	<section id="register">
		<div class="container">
			<div class="row text-center header animate-in"
				data-anim-type="fade-in-up">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<h2>Zajerestruj się</h2>
					<hr />
				</div>
			</div>
			<div class="row text-center animate-in" data-anim-type="fade-in-up">
				<div
					class="col-xs-12 col-sm-12 col-md-6 col-md-offset-3 col-lg-6 col-lg-offset-3">
					<div class="contact-wrapper">
						<form:form role="form" 
							modelAttribute="newUser"  method="post">
							<form:errors path="*" />

							<div class="row">
								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
									<div class="form-group">
										<label for="username">Nazwa użytkownika</label>
										<form:input type="text" name="username" id="username"
											class="form-control"
											placeholder="Nazwa użytkownika" path="username"
											pattern="^[A-Za-z0-9_]{5,15}$"
											title="Nazwa uzytkownika od 5 do 15 znakow" required="true"
											autofocus="true" />
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
									<div class="form-group">
										<label for="password">Hasło</label>
										<form:input type="password" name="password" id="password"
											class="form-control" placeholder="Hasło"
											path="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{5,}"
											title="Haslo od 5 znakow zawiera conajmniej jedna duza litere i cyfre"
											onchange="form.repeatedPassword.pattern = this.value; form.repeatedPassword.title = 'Hasła muszą być identyczne';"
											required="true" />
									</div>
								</div>
								<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
									<div class="form-group">
										<label for="repeatedPassword">Powtórzone hasło</label>
										<form:input type="password" name="repeatedPassword"
											id="repeatedPassword" class="form-control"
											placeholder="Powtórz hasło" path="repeatedPassword"
											pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{5,}" required="true" />
									</div>
								</div>
							</div>

							<div class="row">
								<div
									class="col-xs-12 col-sm-12 col-md-8 col-md-offset-2 col-lg-8 col-md-offset-2">
									<div class="form-group">
										<label for="first_name">Imię</label>
										<form:input type="text" name="first_name" id="first_name"
											class="form-control" placeholder="Imię"
											path="imie" required="true" />
									</div>
								</div>
							</div>
							<div class="row">
								<div
									class="col-xs-12 col-sm-12 col-md-offset-2 col-md-8 col-md-offset-2">
									<div class="form-group">
										<label for="last_name">Nazwisko</label>
										<form:input type="text" name="last_name" id="last_name"
											class="form-control" placeholder="Nazwisko"
											path="nazwisko" required="true" />
									</div>
								</div>
							</div>
							<div class="row">
								<div
									class="col-xs-12 col-sm-12 col-md-4 col-md-offset-2 col-lg-4 col-lg-offset-2">
									<div class="form-group">
										<label for="postal_code">Kod pocztowy</label>
										<form:input type="text" name="postal_code" id="postal_code"
											class="form-control" placeholder="Kod pocztowy"
											path="kodPocztowy" pattern="[0-9]{2}\-[0-9]{3}"
											required="true" />
									</div>
								</div>
								<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
									<div class="form-group">
										<label for="city">Miasto</label>
										<form:input type="text" name="city" id="city"
											class="form-control" placeholder="Miasto"
											path="miasto" required="true" />
									</div>
								</div>
							</div>

							<div class="row">
								<div
									class="col-xs-12 col-sm-12 col-md-8 col-md-offset-2 col-lg-8 col-lg-offset-2">
									<div class="form-group">
										<label for="adress">Adres</label>
										<form:input type="text" name="adress" id="adress"
											class="form-control"
											placeholder="Ulica, nr domu/mieszkania" path="adres"
											required="true" />
									</div>
								</div>
							</div>

							<div class="row">
								<div
									class="col-xs-12 col-sm-12 col-md-8 col-md-offset-2 col-lg-8 col-lg-offset-2">
									<div class="form-group">
										<label for="phone">Numer telefonu</label>
										<form:input type="number" name="phone" id="phone"
											class="form-control"
											placeholder="Numer telefonu" path="nrTelefonu"
											pattern="[0-9]{9}" required="true" />
									</div>
								</div>
							</div>

							<div class="row">
								<div
									class="col-xs-8 col-xs-offset-2 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4 col-lg-4 col-lg-offset-4">
									<input type="submit" value="Zarejestruj"
										class="btn btn-block button-custom btn-custom-one"
										role="button" />
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--WORK SECTION END-->

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