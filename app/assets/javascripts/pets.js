var col;
var goal = 4;

// WINDOW RESIZE FOR MASONRY LAYOUT
var currentWidth = 1100;

$(window).resize(function() {
	setColumns();
});

function setColumns() {
	var winWidth = $(window).width();
	var conWidth;
	if(winWidth < 400) {
		conWidth = 320;
		col = 1;
	} else if(winWidth < 660) {
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
}

function masonryLayout(col) {
	var container = $('#pets-list');
	container.imagesLoaded(function() {
		container.BlocksIt({
			numOfCol: col
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
	$('.overlay').animate({height: '100%'}, 200, function() {
		$('#sign-in').data('visibility', true);
		$('#sign-in').fadeIn(200);
		$('#sign-in .email input').focus();
	});
}

function hideModal() {
	$('.modal').each(function(index, value) {
		if ($(value).data('visibility') === true) {
			$(this).data('visibility', false);
			$(this).hide();
		}
	});
	$(this).hide();
	$(this).css('height', '0%');
}

function switchModal() {
	if ($('#sign-in').data('visibility') === true) {
		$('#sign-in').fadeOut(200, function() {
			$('#sign-in').data('visibility', false);
			$('#sign-up').fadeIn(200);
			$('#sign-up').data('visibility', true);
			$('#sign-up .email input').focus();
		});
	} else {
		$('#sign-up').fadeOut(200, function() {
			$('#sign-up').data('visibility', false);
			$('#sign-in').fadeIn(200);
			$('#sign-in').data('visibility', true);
			$('#sign-in .email input').focus();
		});
	}
}

function makeDonationProgress() {
	var currentProgress = $('.donated').length;
	var resultProgress = (100 / goal) * currentProgress;
	var progressView = $('<span>').text(currentProgress + ' / ' + goal).attr('id', 'progress-view');
	$('#progress').html(progressView).animate({width: resultProgress + '%'}, 300, function() {
		if (currentProgress === 0) {
			$('#progress').html('');
		}
	});
}

function toggleDonation() {
	var userStatus = $('body').data('currentUser');
	if (userStatus === "") {
		// SHOW LOG IN MODAL IF NOT SIGNED IN
		$('.user-modal-link').click();
	} else {
		// TOGGLE DONATION
		var star = $(this).children('i');
		if (!$(this).hasClass('donated')) {
			// ENABLE DONATION
			star.removeClass('fa-star-o').addClass('fa-star');
			$(this).addClass('donated animated tada');
			makeDonationProgress();
			$(this).one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function() {
				$(this).removeClass('animated tada');
			});
		} else {
			// DISABLE DONATION
			star.removeClass('fa-star').addClass('fa-star-o');
			$(this).removeClass('donated');
			makeDonationProgress();
		}
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

	// NOTICES
	if ($('.notice').length > 0) {
		$('.notice').delay(3000).fadeOut(200);
	}

	// DONATION STARS
	$('#pets-list').on('click', '#donate', toggleDonation);
}

$(document).ready(function() {
	


});
