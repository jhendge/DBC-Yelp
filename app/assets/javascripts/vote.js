$(document).ready(function(){
	$(".votes-container").on("submit", ".vote-up", function(event) {
		event.preventDefault();
		var button = $(this);
		console.log(button);
		var data = $(this).serialize();
		var url = $(this).attr("action");
		console.log(url);
		$.post( url, data,  function(response){
			console.log(response);
			button.closest('.voteable-container').find(".score").first().text(response);
		}, "json");
	});
});
