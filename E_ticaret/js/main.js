$(document).ready(function () {
	// Declare Carousel jquery object
	var owl = $('.slider-owl-1');

	// Carousel initialization
	owl.owlCarousel({
		loop: true,
		margin: 0,
		navSpeed: 500,
		nav: true,
		navText: ['<i class="fas fa-chevron-left"></i>', '<i class="fas fa-chevron-right"></i>'],
		dots: false,
		autoplay: true,
		autoplayHoverPause: true, // Stops autoplay
		items: 1
	});
});
