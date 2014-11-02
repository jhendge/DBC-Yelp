$(document).ready(function() {

	var directionsDisplay;
	var directionsService = new google.maps.DirectionsService();
	var map;
	var DBC = new google.maps.LatLng(41.889929, -87.637654);


	function initialize() {
	  directionsDisplay = new google.maps.DirectionsRenderer();
	  var mapOptions = {
	    zoom: 15,
	    center: DBC
	  };

	  var root = document.getElementById('place_map_container')
	  map = new google.maps.Map(root,
	      mapOptions);
	  directionsDisplay.setMap(map);

	};

	function calcRoute() {
	  var start = "351 W Hubbard St, Chicago, Il";
	  var end = $("#place_address").text();
	  var request = {
	    origin:start,
	    destination:end,
	    travelMode: google.maps.TravelMode.WALKING
	  };
	  console.log(request);
	  directionsService.route(request, function(result, status) {
	    if (status == google.maps.DirectionsStatus.OK) {
	      directionsDisplay.setDirections(result);
	      console.log(result);
	      var steps = result.routes[0].legs[0].steps;
	      console.log(steps);
	      for(var i = 0; i<steps.length;i++) {
	      	var instructions = "<li>"+steps[i].instructions+"</li>";
	      	$("#directions").append(instructions);
	      }
	    }
	  });
	}

	initialize();
	calcRoute();

});
