$(document).ready(function () {

/*====================================
SCROLLING SCRIPTS
======================================*/

$('.scroll-me a').bind('click', function (event) { //just pass scroll-me in design and start scrolling
var $anchor = $(this);
$('html, body').stop().animate({
scrollTop: $($anchor.attr('href')).offset().top
}, 1200, 'easeInOutExpo');
event.preventDefault();
});


/*====================================
SLIDER SCRIPTS
======================================*/


$('#carousel-slider').carousel({
interval: 2000 //TIME IN MILLI SECONDS
});

/*====================================
VAGAS SLIDESHOW SCRIPTS
======================================*/

$.vegas('slideshow', {
	backgrounds: [
	{ src: '/KurierFlex/resources/img/Express.jpg' },
	]
	})('overlay', {
	/** SLIDESHOW OVERLAY IMAGE **/
	src: '/KurierFlex/resources/js/vegas/overlays/05.png' // THERE ARE TOTAL 01 TO 15 .png IMAGES AT THE PATH GIVEN, WHICH YOU CAN USE HERE
	});


/*====================================
POPUP IMAGE SCRIPTS
======================================*/
$('.fancybox-media').fancybox({
openEffect: 'elastic',
closeEffect: 'elastic',
helpers: {
title: {
type: 'inside'
}
}
});


/*====================================
FILTER FUNCTIONALITY SCRIPTS
======================================*/
$(window).load(function () {
var $container = $('#work-div');
$container.isotope({
filter: '*',
animationOptions: {
duration: 750,
easing: 'linear',
queue: false
}
});
$('.caegories a').click(function () {
$('.caegories .active').removeClass('active');
$(this).addClass('active');
var selector = $(this).attr('data-filter');
$container.isotope({
filter: selector,
animationOptions: {
duration: 750,
easing: 'linear',
queue: false
}
});
return false;
});

});



/*====================================
OTHER CUSTOM SCRIPTS BELOW
======================================*/



});
