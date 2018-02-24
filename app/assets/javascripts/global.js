document.addEventListener("turbolinks:load", function() {
 	// init Masonry
 	var $grid = $('.grid').masonry({
 	  // options...
 	});
 	// layout Masonry after each image loads
 	$grid.imagesLoaded().progress( function() {
 	  $grid.masonry('layout');
 	});


 	$('.photo').each(function() {
	  var rotation = Math.random() * 20 - 10;
	  var depth = Math.floor(Math.random() * 256);
	  $(this).css({
	    'transform' : 'rotateZ(' + rotation + 'deg)',
	    'z-index' : depth
	  });        
	});

});
