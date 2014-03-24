(function($) {
    "use strict";

    $(".typo_failed span.close").click(function () {
		$(".typo_failed").fadeOut("slow");
	});

	$(".typo_success span.close").click(function () {
		$(".typo_success").fadeOut("slow");
	});

	$(".typo_info span.close").click(function () {
		$(".typo_info").fadeOut("slow");
	});

})(jQuery);