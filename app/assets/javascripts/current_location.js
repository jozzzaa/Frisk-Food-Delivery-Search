

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

      $('#location-search').val(fullAddress);

    });

  };

  navigator.geolocation.getCurrentPosition(success);

}
