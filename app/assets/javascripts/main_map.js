$(document).ready(function() {
	var map;
	var geocoder;
	var DBC = new google.maps.LatLng(41.889929, -87.637654);
	// var DBCIcon = {
	// 	url: '<%= asset_path("unnamed.png") %>',
	// 	size: new google.maps.Size(20, 32),
	// 	origin: new google.maps.Point(0,0),
	// 	anchor: new google.maps.Point(0, 0)
	// }

	function multipleMarkerInitialize() {
	  geocoder = new google.maps.Geocoder();
	  var mapOptions = {
	    zoom: 15,
	    center: DBC
	  };

	  var root = document.getElementById('places_map')
	  map = new google.maps.Map(root,
	      mapOptions);

	};

	function addDBCMarker(){
		var marker = new google.maps.Marker({
			map: map,
			position: DBC,
			title: 'DBC'
			// icon: DBCIcon
		});
	};

	function codeAddress() {
		var placesNames = $('h3').children('a');
		console.log(placesNames);
		var placesLat = $(".place_lat");
		var placesLng = $(".place_lng");
		for(var i = 0; i < placesNames.length; i++) {
			var url = $(placesNames[i]).attr('href');
			var myLatlng = new google.maps.LatLng(placesLat[i].innerHTML, placesLng[i].innerHTML);
			var label = placesNames[i].innerHTML;
	        var marker = new google.maps.Marker({
	              position: myLatlng,
	              map: map,
	              title: label,
	              url: url
	        });
	        google.maps.event.addListener(marker, 'click', function() {
	              window.location.href = this.url;  //changed from markers[i] to this[i]
	        });
		}
	};

	multipleMarkerInitialize();
	addDBCMarker();
	codeAddress();
});