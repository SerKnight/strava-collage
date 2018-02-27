document.addEventListener("turbolinks:load", function() {
 	var $grid = $('.grid').masonry({
 	  // options...
 	});
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

	document.getElementById('twitter-url').href = "https://twitter.com/intent/tweet?text=#GamifyYourExercise%20#strava " + document.URL

});
