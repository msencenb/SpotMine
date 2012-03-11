// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


jQuery(function(){	
	jQuery('#main-nav ul.sf-menu').superfish();
	jQuery('.sf-menu').mobileMenu();
	/* ====== PrettyPhoto ====== */
	jQuery("a[data-rel^='prettyPhoto']").prettyPhoto({hook: 'data-rel'});
	jQuery('a[data-rel]').each(function() {
		jQuery(this).attr('rel', jQuery(this).attr('data-rel')).removeAttr('data-rel');
	});
	jQuery('#portfolio-scroll').carouFredSel({
		responsive  : true,
		items: {
				visible		: {
					min			: 1,
					max			: 3
				},
				width: 300,
				height: '100%'
			},
		scroll: 1,
		auto : {
				easing		: "linear",
				duration	: 1000,
				pauseDuration: 4000,
				pauseOnHover: true
				},
		prev : "#portfolio-scroll-prev",
		next : "#portfolio-scroll-next",
		pagination: "#portfolio-scroll-pagination"
	});
	
	jQuery('ul.widget-carousel').carouFredSel({
		auto:false,
		responsive  : true,
		items: {
				visible: 1, 
				width: 260
			},
		prev : "#widget-carousel-prev",
		next : "#widget-carousel-next",
		scroll: 1
	});
});
$(document).ready(function(){
	$('.flexslider').flexslider({
		directionNav: true
	});
});