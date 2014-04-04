$(document).ready(function () {
	$("button").click(function () {
		var parent = $(this).parent();
		var n = parent.find(".num").text();
		var result = parent.find(".result");
		switch (parent.attr("id")) {
			case "problem1":
				var sum = 0;
				for (var i = 0; i < n; i++) {
					if ((i % 3 == 0) || (i % 5 == 0)) {
					sum += i;
					};
				};
				result.html("The result is: <strong>" + sum + "</strong>");
				return;
			case "problem2":
				var fibo = [1, 1, 2], sum = 0;
				while (fibo[2] <= n) {
					if (fibo[2] % 2 == 0) { sum += fibo[2] };
					fibo[2] = fibo[0] + fibo[1];
					fibo[0] = fibo[1]
					fibo[1] = fibo[2]
				}
				result.html("The result is: <strong>" + sum + "</strong>");
				return;
			case "problem3":
				var max = 2, divisor;
				var max_divisor = (n % 3 == 0) ? 3 : (n % 2 == 0) ? 2 : 1 ;
				divisor = 5;
				inter = 2;
				while ( divisor <= n/max_divisor) {
					if ((n % divisor == 0) && isPrime(divisor)) {
						max_divisor = divisor;
					}
					divisor += inter;
					inter = 6 - inter;
				}
				result.html("The result is: <strong>" + max_divisor + "</strong>");
				return;
		}
	});

	$("input").blur(function() {
		$(this).parent().find(".num").text($(this).val())
	});
});

function isPrime (n) {
	if (n < 2) { return false; };
	if (n == 2 || n == 3) { return true; };
	if ((n % 2 == 0) || (n % 3 == 0)) { return false; }
	max_divisor = parseInt(Math.sqrt(n));
	divisor = 5;
	while (divisor <= max_divisor) {
		if ((n % divisor == 0) || (n % (divisor + 2) == 0)) { return false };
		divisor += 6;
	};
	return true;
}