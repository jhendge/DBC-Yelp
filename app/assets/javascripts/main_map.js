// $(document).ready(function() {
// 	var map;
// 	var geocoder;
// 	var DBC = new google.maps.LatLng(41.889929, -87.637654);

// 	function initialize() {
// 	  geocoder = new google.maps.Geocoder();
// 	  var mapOptions = {
// 	    zoom: 15,
// 	    center: DBC
// 	  };

// 	  var root = document.getElementById('places_map')
// 	  map = new google.maps.Map(root,
// 	      mapOptions);

// 	};

// 	function codeAddress() {
// 		var addresses = $(".place_address");
// 		for(var i = 0; i < addresses.length; i++) {
// 			console.log(addresses[i]);
// 			geocoder.geocode( { 'address': addresses[i].innerHTML}, function(results, status) {
// 			    if (status == google.maps.GeocoderStatus.OK) {
// 			      map.setCenter(results[0].geometry.location);
// 			      var marker = new google.maps.Marker({
// 			          map: map,
// 			          position: results[0].geometry.location
// 			      });
// 			  }
// 			    // } else {
// 			    //   alert('Geocode was not successful for the following reason: ' + status);
// 			    // }
// 		    });

// 		}
// 	};

// 	initialize();
// 	codeAddress();
// });