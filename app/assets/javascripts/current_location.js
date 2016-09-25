

function getLocation() {

  var lat = '';
  var long = '';
  var reverseGeocode = '';

  function success(position) {

    lat = position.coords.latitude;
    long = position.coords.longitude;
    reverseGeocode = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=' + lat + ',' + long + '&key=AIzaSyByqzNhmIRqVXcWntykZpdoeJ4zRjVxYFY'

    $.ajax({

      url: reverseGeocode,
      method: 'get'

    }).done(function(response) {

      var location = response
      var street = location.results[0].address_components[1].long_name
      var suburbName = location.results[0].address_components[2].long_name
      var city = location.results[0].address_components[3].long_name
      var postcode = location.results[0].address_components[6].long_name

      var fullAddress = street + ', ' + suburbName + ', ' + city + ' ' + postcode;
      var suburb = suburbName + ' - ' + postcode;

      $('#location-input').val(fullAddress);

      setTimeout(
        function(){
          stageTwoSearch();
        }, 2000);


    });

  };

  navigator.geolocation.getCurrentPosition(success);

}


// HOMEPAGE SEARCH PROGRESSION


function stageTwoSearch() {
  var addressBox = $('.address-search');
  var foodBox = $('.food-search');

  addressBox.css({
    'transition': '1.5s',
    'transform': 'translateY(-40px)',
    'opacity': '0',
  });

  foodBox
      .delay(800)
      .queue(function (next) {
        $(this).css({
          'transition': '2s',
          'transform': 'translateY(-30px)',
          'opacity': '1',
          'z-index': '10'
        });
        next();
      });
}


// MAP INITIALISER

function initMap(coordinates) {
  var myLatLng = coordinates

  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 14,
    center: myLatLng
  });

  var marker = new google.maps.Marker({
    position: myLatLng,
    map: map,
    title: 'Hello World!'
  });
}


function displayLocationNav(address) {

  $.ajax({

    url: 'https://maps.googleapis.com/maps/api/geocode/json?address=' + address,
    method: 'get'

  }).done(function(response) {

    var geometricCoor = response.results[0].geometry.location;
    initMap(geometricCoor);

  })

}

// function locationSuggestions(input) {
//
//   $.ajax({
//
//     url: 'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=' + input + '&types=address&key=AIzaSyCX98j2ahXOgcR13Cb2Pos1UQtVRBCzv7U',
//     method: 'get'
//
//   }).done(function(response) {
//
//     var suggestions = response
//     console.log(suggestions);
//
//   })
//
// }
