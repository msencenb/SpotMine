jQuery(window).load(function() {  
$div = null;
  $('#thumbs').children().each(function(i) {
	  if ( i % 9 == 0) {
		  $div = $( '<div />' );
		  $div.appendTo( '#thumbs' );
	  }
	  $(this).appendTo( $div );
	  $(this).addClass( 'itm'+i );
	  $(this).click(function() {
		  $('#images').trigger( 'slideTo', [i, 0, true] );
	  });
  });
	
	$('#thumbs article.itm0').addClass( 'selected' );

	$('#images').carouFredSel({
		circular: true,
		infinite: true,
		responsive  : true,
		items: {
				visible:1,
				width: 627
			},
		auto: false,
		prev: '#prev .images',
		next: '#next .images',
		scroll: {
			fx: 'directscroll',
			onBefore: function() {
				var pos = $(this).triggerHandler( 'currentPosition' );
				$('#thumbs article').removeClass( 'selected' );
				$('#thumbs article.itm'+pos).addClass( 'selected' );
				
				var page = Math.floor( pos / 9 );
				$('#thumbs').trigger( 'slideToPage', page );
			}
		}
	});

	$('#thumbs').carouFredSel({
		direction: 'up',
		circular: true,
		infinite: true,
		responsive:true,
		items: {
				visible:1,
				width: 300
			},
		align: false,
		auto: false,
		prev: '#prev .thumbs',
		next: '#next .thumbs'
	});
	jQuery('ul.blog-gallery').carouFredSel({
		responsive  : true,
		items: {
				visible:1,
				width: 627
			},
		auto: false,
		scroll: 1,
		pagination: "#blog-gallery-scroll-pagination"
	});
});	