/**
 * Google Maps
 */

var map;
function initMap() {
  var myLatLng = {lat: 34.048233, lng:  -118.256015};
  
  var styleArray = [
        {
            "featureType": "administrative",
            "elementType": "labels.text.fill",
            "stylers": [
                {
                    "color": "#444444"
                }
            ]
        },
        {
            "featureType": "landscape",
            "elementType": "all",
            "stylers": [
                {
                    "color": "#f2f2f2"
                }
            ]
        },
        {
            "featureType": "poi",
            "elementType": "all",
            "stylers": [
                {
                    "visibility": "off"
                }
            ]
        },
        {
            "featureType": "road",
            "elementType": "all",
            "stylers": [
                {
                    "saturation": -100
                },
                {
                    "lightness": 45
                }
            ]
        },
        {
            "featureType": "road.highway",
            "elementType": "all",
            "stylers": [
                {
                    "visibility": "simplified"
                }
            ]
        },
        {
            "featureType": "road.highway",
            "elementType": "geometry.fill",
            "stylers": [
                {
                    "color": "#ef7521"
                },
                {
                    "saturation": "3"
                },
                {
                    "lightness": "17"
                },
                {
                    "gamma": "1.11"
                }
            ]
        },
        {
            "featureType": "road.arterial",
            "elementType": "labels.icon",
            "stylers": [
                {
                    "visibility": "off"
                }
            ]
        },
        {
            "featureType": "transit",
            "elementType": "all",
            "stylers": [
                {
                    "visibility": "off"
                }
            ]
        },
        {
            "featureType": "water",
            "elementType": "all",
            "stylers": [
                {
                    "color": "#a5c4c7"
                },
                {
                    "visibility": "on"
                }
            ]
        }
    ]

    var mapOptions = {
        zoom: 12,
        center: myLatLng,
        styles: styleArray,
        scrollwheel: false
    };

    map = new google.maps.Map(document.getElementById('map'), mapOptions);

    var image = 'assets/img/map_marker.png';

    var marker = new google.maps.Marker({
        position: myLatLng,
        map: map,
        icon: image,
        title: 'Groggery'
    });

    };