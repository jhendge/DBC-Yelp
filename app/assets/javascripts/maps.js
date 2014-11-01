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
	  console.log(map);
	  directionsDisplay.setMap(map);

	  // var script = document.createElement('script');
	  // script.type = 'text/javascript';
	  // script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&'
	  // document.body.appendChild(script);
	};

	function calcRoute() {
	  var start = "351 W Hubbard St, Chicago, Il";
	  var end = $("#place_address").text();
	  console.log(end);
	  var request = {
	    origin:start,
	    destination:end,
	    travelMode: google.maps.TravelMode.WALKING
	  };
	  directionsService.route(request, function(result, status) {
	    if (status == google.maps.DirectionsStatus.OK) {
	      directionsDisplay.setDirections(result);
	      console.log(result);
	      var steps = result.routes[0].legs[0].steps;
	      console.log(steps);
	      for(var i = 0; i<steps.length;i++) {
	      	console.log(steps[i].instructions);
	      }
	    }
	  });
	}

	initialize();
	calcRoute();

});