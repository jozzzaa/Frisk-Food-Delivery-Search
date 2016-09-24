

// Info Window on Current Location Icon Hover

$('#current-location-btn').hover(function() {
  $('.location-info').css('opacity', '1');
  $('.location-info').css('top', '-8px');
}, function() {
  $('.location-info').css('opacity', '0');
  $('.location-info').css('top', '0px');

});

// Get Current Location

$('#current-location-btn').on('click', function() {
  getLocation()
});

// Search Button Handler

$('#main-search-btn').on('click', function() {
  searchManipulation();
})

$(document).keypress(function(key) {

  if(key.which == 13) {
    searchManipulation();
  }

});

var locationValue = '';
var searchValue = '';

function searchManipulation() {

  var searchButton = $('#main-search-btn');
  var addressInput = $('.address-search input').val();
  var searchInput = $('.food-search input').val();


  if( searchButton.hasClass('unclicked') && addressInput.length >= 8 ) {

    locationValue = addressInput;
    stageTwoSearch();
    searchButton.addClass('clicked');
    searchButton.removeClass('unclicked');

  } else if ( searchButton.hasClass('unclicked') && addressInput.length < 8 ) {



  } else if( searchButton.hasClass('clicked') && searchInput.length >= 3 ) {

    searchValue = searchInput;
    window.location = "/foods?search=" + searchValue + "&location=" + locationValue;

  } else if ( searchButton.hasClass('clicked') && searchInput.length < 3 ) {



  }

}
