//window resize
var currentWidth = 1100;
$(window).resize(function() {
	var winWidth = $(window).width();
	var conWidth;
	if(winWidth < 660) {
		conWidth = 440;
		col = 2;
	} else if(winWidth < 880) {
		conWidth = 660;
		col = 3;
	} else if(winWidth < 1100) {
		conWidth = 880;
		col = 4;
	} else {
		conWidth = 1100;
		col = 5;
	}

	if(conWidth != currentWidth) {
		currentWidth = conWidth;
		$('#pets-list').width(conWidth);
		$('#pets-list').BlocksIt({
			numOfCol: col,
			offsetX: 8,
			offsetY: 8
		});
	}
});

function masonryLayout() {
	var container = $('#pets-list');
	container.imagesLoaded(function() {
		container.BlocksIt({
			numOfCol: 5			
		});
	});
}

$(document).ready(function() {
	if($('body').data('currentLocation') !== "") {
		console.log('poop');
	}
});