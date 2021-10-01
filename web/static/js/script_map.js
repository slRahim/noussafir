function initMap() {
    var directionsService = new google.maps.DirectionsService;
    var directionsDisplay = new google.maps.DirectionsRenderer;

    var map  = new google.maps.Map(document.getElementById('map'), {
        center: {lat:35.36, lng:2.6},
        zoom: 6
    });
    directionsDisplay.setMap(map);

    var originAutocomplete = new google.maps.places.Autocomplete(start);
    var destinationAutocomplete = new google.maps.places.Autocomplete(end);

    var onChangeHandler = function() {
        calculateAndDisplayRoute(directionsService, directionsDisplay);
    };
    document.getElementById('end').addEventListener('change', onChangeHandler);


}

function calculateAndDisplayRoute(directionsService, directionsDisplay) {

    directionsService.route({
        origin: document.getElementById('start').value,
        destination: document.getElementById('end').value,
        travelMode: 'DRIVING'
    }, function(response, status) {
        if (status === 'OK') {
            directionsDisplay.setDirections(response);
        } else {
            window.alert('Directions request failed due to ' + status);
        }
    });
}

function initAutocomplete() {
    var originAutocomplete = new google.maps.places.Autocomplete(start);
    var destinationAutocomplete = new google.maps.places.Autocomplete(end);
    var arret_1= new google.maps.places.Autocomplete(ar_1);
    var arret_2= new google.maps.places.Autocomplete(ar_2);
    var arret_3= new google.maps.places.Autocomplete(ar_3);
}

