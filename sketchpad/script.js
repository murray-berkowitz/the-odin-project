$(document).ready(function () {
	displayGrid(16);
	$('.square').mouseenter(function() {
		$(this).css("background", "white");
	});
	$('.clear').click(function() {
		clean();
	});

	$(".normal").click(function() {
		setGrid();
		$(".square").unbind();
		$(".square").mouseenter(function() {
			$(this).css("background", "white");
		});
	});

	$(".random").click(function() {
		setGrid();
		$(".square").unbind();
		$(".square").mouseenter(function() {
			$(this).css("background", randomColor());
		});
	});
	$(".opacity").click(function() {
		setGrid();
		$(".square").unbind();
		$(".square").mouseenter(function() {
			reduceOpacity($(this));
		})
	});
	$(".trail").click(function () {
		setGrid();
		$(".square").unbind();
		$(".square").hover(function() {
			$(this).css("opacity", 0);
		}, function () {
			$(this).fadeTo('fast', 1);
		});
	});
});

function setGrid() {
	var col = prompt("Enter number of columns: ");
	displayGrid(col);
	clean();
}

function clean() {
	$(".square").css("background", "#34495e").css('opacity', '1');
}

function reduceOpacity(elem) {
	var opacity = elem.css('opacity');
	var nextOpacity = opacity - 0.1
	if (nextOpacity > 0) { elem.css('opacity', nextOpacity); }
	else { elem.css('opacity', '0'); }
}

function displayGrid (n) {
	var length = n*n;
	var size = 960;
	var boxSize = parseInt((960 - 4*n)/n);1
	var wrap = $(".wrap").html("");
	for (var i = 0; i < length; i++) {
		wrap.append( $("<div></div>").addClass("square").height(boxSize).width(boxSize) );
	}
}

function randomColor() {
	var red = Math.floor(Math.random()*256)
	var blue = Math.floor(Math.random()*256)
	var green = Math.floor(Math.random()*256)
	return "#" + red.toHex() + blue.toHex() + green.toHex();
}

Number.prototype.toHex = function() {
	if (this < 16) { return '0' + this.toString(16); }
	return this.toString(16);
}