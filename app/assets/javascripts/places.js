$(document).ready(function(){
	$(".list-group").on("submit", ".vote-up", function(event) {
		event.preventDefault();
		var button = $(this);
		console.log(button);
		var data = $(this).serialize();
		var url = $(this).attr("action");
		console.log(url);
		$.post( url, data,  function(response){
			button.closest('.list-group-item').find(".place-score").text(response);
		}, "json");
	});
});
