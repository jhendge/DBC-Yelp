$(document).ready(function(){
	$(".votes-container").on("submit", ".vote-up", function(event) {
		event.preventDefault();
		var button = $(this);
		var data = $(this).serialize();
		var url = $(this).attr("action");
		$.post( url, data,  function(response){
			button.closest('.voteable-container').find(".score").first().text(response);
		}, "json");
	});
});
