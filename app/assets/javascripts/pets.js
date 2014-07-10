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

	if (conWidth != currentWidth) {
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

function matchForm() {
	$('.match-box').on('click', 'button', function(e) {
		progressForm(e.target.id);
	});
	$('#match-1').fadeIn('slow');
}

function progressForm(stage) {
	var nextStage = parseInt(stage) + 1;
	$('#match-' + stage).fadeOut('slow');
	$('#match-' + nextStage).fadeIn('slow');
}

function showModal() {
	$('.overlay').show();
	$('#sign-in').data('visibility', true);
	$('#sign-in').show();
}

function hideModal() {
	$('.modal').each(function(index, value) {
		if ($(value).data('visibility') === true) {
			$(this).data('visibility', false);
			$(this).hide();
		}
	});
	$(this).hide();
}

function switchModal() {
	if ($('#sign-in').data('visibility') === true) {
		$('#sign-in').hide();
		$('#sign-in').data('visibility', false);
		$('#sign-up').show();
		$('#sign-up').data('visibility', true);
	} else {
		$('#sign-up').hide();
		$('#sign-up').data('visibility', false);
		$('#sign-in').show();
		$('#sign-in').data('visibility', true);
	}
}

function initializeEvents() {
	// MODAL WINDOW EVENTS
	$('body').on('click', '.user-modal-link', showModal);
	$('body').on('click', '.overlay', hideModal);
	$('body').on('click', '.switch', switchModal);

	// DROPDOWN EVENTS
	$('.menu .dropdown').click(function(e) {
		e.stopPropagation();
		$('.dropdown-list').addClass('visible').show();
		$(document).one('click', function(e){
			$('.visible').hide();
		});
	});
}

$(document).ready(function() {
	


});