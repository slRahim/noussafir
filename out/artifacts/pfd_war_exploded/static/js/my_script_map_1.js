function initMap() {
    var directionsService = new google.maps.DirectionsService;
    var directionsDisplay = new google.maps.DirectionsRenderer;
    var service= new google.maps.DistanceMatrixService();

    var map  = new google.maps.Map(document.getElementById('map'), {
        center: {lat:35.36, lng:2.6},
        zoom: 6
    });
    directionsDisplay.setMap(map);

    var originAutocomplete = new google.maps.places.Autocomplete(start);
    var destinationAutocomplete = new google.maps.places.Autocomplete(end);
    var arret1= new google.maps.places.Autocomplete(ar1);
    var arret2= new google.maps.places.Autocomplete(ar2);
    var arret3= new google.maps.places.Autocomplete(ar3);



    var onChangeHandler = function() {
        calculateAndDisplayRoute(directionsService, directionsDisplay);
        //pour le calcule de la distansce et le prix
        service.getDistanceMatrix(
            {
                origins: [document.getElementById('start').value],
                destinations: [document.getElementById('end').value],
                travelMode: 'DRIVING',
            }, callback);

    };
    document.getElementById('end').addEventListener('change', onChangeHandler);
}

function calculateAndDisplayRoute(directionsService, directionsDisplay) {
    var arrets = [] ;

    if(document.getElementById('ar1').value!=""){
        arrets.push({location:document.getElementById('ar1').value,stopover:true});
    }

    if(document.getElementById('ar2').value!=""){
        arrets.push({location:document.getElementById('ar2').value,stopover:true});
    }

    if(document.getElementById('ar3').value!="") {
        arrets.push({location: document.getElementById('ar3').value, stopover: true});
    }



    directionsService.route({
        origin: document.getElementById('start').value,
        destination: document.getElementById('end').value,
        waypoints: arrets,
        travelMode: 'DRIVING'
    }, function(response, status) {
        if (status === 'OK') {
            directionsDisplay.setDirections(response);
        } else {
            window.alert('Directions request failed due to ' + status);
        }
    });
}

function callback(response, status) {
    if (status == 'OK') {
        var results = response.rows[0].elements;
        var element = results[0];
        var distance = element.distance.text;

        var prix=parseFloat(distance)*1.5 ;
        document.getElementById('p_place').value=prix ;

    }
}

function publierVerefie() {
    if (document.getElementById('start').value!='' && document.getElementById('end').value!='' && document.getElementById('d_depart').value!='' && document.getElementById('h_depart').value!=''
            && document.getElementById('n_place').value!='' && document.getElementById('p_place').value!='' && document.getElementById('mat').value!='' && document.getElementById('marque').value!=''){

        document.getElementById('valider').disabled=false ;
    }
    else {
        swal("Ooops!", "Veulleirz remplir tout les champs SVP !", "info");
    }

}

