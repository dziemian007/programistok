// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

var map1, map2;
var geocoder;

function initialize() {
	geocoder = new google.maps.Geocoder();
	var myOptions2 = {zoom: 14,	mapTypeId: google.maps.MapTypeId.ROADMAP, disableDefaultUI: true, draggable: false, scrollwheel: false};
  map2 = new google.maps.Map(document.getElementById('map_canvas_2'), myOptions2);
  codeAddress($("#meeting-address-2").html(), 2);
	var myOptions1 = {zoom: 14,	mapTypeId: google.maps.MapTypeId.ROADMAP };
	map1 = new google.maps.Map(document.getElementById('map_canvas_1'), myOptions1);
	codeAddress($("#meeting-address-1").html(), 1);
}

function codeAddress(address, m) { 
  var map;
  if(m==1)
    map = map1;
  else if(m==2)
    map = map2;
	geocoder.geocode( { 'address': address}, function(results, status) {
		if (status == google.maps.GeocoderStatus.OK) {
			map.setCenter(results[0].geometry.location);
			var marker = new google.maps.Marker({ map: map, position: results[0].geometry.location});
		}
		else{
      $("#map_canvas_" + m).addClass('hidden');
      $("#map_canvas_" + m).after('mapa: <strong>niepoprawny adres!</strong>');
		}
 });
}

