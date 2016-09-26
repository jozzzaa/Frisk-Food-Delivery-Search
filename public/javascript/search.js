

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
  var navSearch = $('.nav-search input').val();


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



  } else if ( navSearch.length >= 3 ) {

    searchValue = navSearch;
    locationValue = $('.address-bottom p').text()
    window.location = "/foods?search=" + searchValue + "&location=" + locationValue;


  }

}


// Share CTA Handlers

$('.support button').on('click', function() {

  $('.share-window').fadeIn('700');

});

$('.esc-btn').on('click', function() {

  $('.share-window').fadeOut('700');

});

// Address Change Handlers

$('.address-esc i').on('click', function() {

  $('.address-popup').css('display', 'none');

});

$('.address-update-btn').on('click', function() {

  var newAddress = $('.address-change-input input').val()
  displayLocationNav(newAddress);
  $('.secondary-results').empty();
  ajaxCall('<%= params[:search] %>', newAddress)


});


// Address Suggestions

var indexAddress = $('#location-input')[0];
var navAddress = $('#address-input')[0];

function locationSuggestions(inputElem) {

  var input = inputElem;
  if(input != undefined) {
    var autocomplete = new google.maps.places.Autocomplete(input);
  }

}

google.maps.event.addDomListener( window, 'load', locationSuggestions(indexAddress) );
google.maps.event.addDomListener( window, 'load', locationSuggestions(navAddress) );


// $(window).load(function(){
//
//   var homeFormWidth = $('.search-input-holder').width();
//   // $('.pac-container').css('width', homeFormWidth);
//   $('.pac-container').css('cssText', 'width: ' + (homeFormWidth + 3) + ' !important;');
//
//
//   console.log('hey');
//
// });
//
// // $(window).on('resize', function(){
// //
// //   var homeFormWidth = $('.search-input-holder').width();
// //   $('.pac-container').css('width', ( homeFormWidth + 3 ));
// //
// // });


// List style

// function backgroundHandler(image, background) {
//
//   var sourceImage = image;
//   var colorThief = new ColorThief();
//   var color = colorThief.getColor(sourceImage);
//   console.log(color);
//   background.css( 'background-color', 'rgb(' + color + ')' )
//
// }
//
// window.onload = function() {
//
//   var listItems = document.getElementsByClassName('food');
//
//   for (var p = 0; p < listItems.length; p++) {
//
//     var listImage = listItems[p].getElementsByTagName('img')[0];
//     var imageBackground = listItems[p].getElementsByClassName('food-image')[0]
//
//     backgroundHandler(listImage, imageBackground);
//
//   }
//
// }
