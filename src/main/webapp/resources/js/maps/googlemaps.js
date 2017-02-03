/* HARD CODED FIELD OFFICES FOR DEMO */
var fieldOffices = [
	{title : 'Owings Mills Field Office', location : {lat : 39.3986522, lng : -76.7560737}, backlogs : 457},
	{title : 'Glen Burnie, MD Field Office', location : {lat : 39.1411169, lng : -76.6333695}, backlogs : 542},
	{title : 'Rosedale, MD Field Office', location : {lat : 39.3476687, lng : -76.4769252}, backlogs : 390},
	{title : 'Towson, MD Field Office', location : {lat : 39.4020425, lng : -76.6065217}, backlogs : 528},
	{title : 'Columbia, MD Field Office', location : {lat : 39.2677747, lng : -76.8853398}, backlogs : 386},
	{title : 'Abingdon, MD Field Office', location : {lat : 39.4691137, lng : -76.3050544}, backlogs : 321},
	{title : 'Elkton, MD Field Office', location : {lat : 39.604886, lng : -75.7903816}, backlogs : 195},
	{title : 'Cambridge, MD Field Office', location : {lat : 38.5519279, lng : -76.0547607}, backlogs : 354},
	{title : 'Annapolis, MD Field Office', location : {lat : 38.9729515, lng : -76.5535048}, backlogs : 502}, 
	{title : 'Rockville, MD Field Office', location : {lat : 39.1990697, lng : -77.2221976}, backlogs : 488},
	{title : 'Frederick, MD Field Office', location : {lat : 39.3791353, lng : -77.4051583}, backlogs : 343},
	{title : 'Westminister, MD Field Office', location : {lat : 39.6053291, lng : -77.0012734}, backlogs : 249},
	{title : 'Hagerstown, MD Field Office', location : {lat : 39.6294316, lng : -77.7709097}, backlogs : 277},
	{title : 'Chambersburg, PA Field Office', location : {lat : 39.7907502, lng : -77.7836706}, backlogs : 267},
	{title : 'Alexandria, VA Field OFfice', location : {lat : 38.8028378, lng : -77.1459344}, backlogs : 599},
	{title : 'Fairfax, VA Field Office', location : {lat : 38.8506571, lng : -77.3514322}, backlogs : 473}
];


/* Initialize Variables */
var infowindow;
var map;
var greenPin = 'resources/images/mapIcons/green-dot.png';
var yellowPin = 'resources/images/mapIcons/yellow-dot.png';
var redPin = 'resources/images/mapIcons/red-dot.png';

/* Create map centered on SSA HQ and zoomed to level 8 for demo, after creating call dropPins function */
function initMap() {
	var ssaHQ = {
		lat : 39.3061886,
		lng : -76.7278801
	};
	
	map = new google.maps.Map($('#map')[0], {
		zoom : 8,
		center : ssaHQ
	});
	
	infowindow = new google.maps.InfoWindow();
	
	dropPins();
	
}


/* Cycle through each field office in array and call addMarkerWithTimeout function */
function dropPins() {
	for (var i = 0; i < fieldOffices.length; i++) {
		addMarkerWithTimeout(fieldOffices[i], fieldOffices[i].title, i * 200);
	}
}

/* Place a pin on map with the title in the tooltop and an info window showing the title and number of backlogs */
function addMarkerWithTimeout(office, timeout) {
	window.setTimeout(function() {
		var tempMarker = new google.maps.Marker({
			position: office.location,
			map: map,
			title: office.title,
			animation: google.maps.Animation.DROP,
			icon: getColor(office.backlogs)
		})
		
		google.maps.event.addListener(tempMarker, 'click', function() {
			infowindow.setContent('<p><b>' + office.title + '</b></p>' + '<p>Backlogs: ' + office.backlogs + '</p>');
			infowindow.open(map, this);
		});
		
	}, timeout);
}

/* Determine which color pin to place on the map based on the number of backlogs for that field office */
function getColor(backlogs) {
	if (backlogs < 250) {
		return greenPin;
	} else if (backlogs < 450) {
		return yellowPin;
	} else {
		return redPin;
	}
}