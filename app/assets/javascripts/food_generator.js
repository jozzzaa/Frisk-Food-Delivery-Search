

function ajaxCall(search, location) {

  $.ajax({

    url: '/api/results',
    data: {
      search: search,
      location: location
    },
    method: 'post'

  }).done(function(response) {

    foodGenerator(response)

  })

}

// Store in temp array then appeend to active/results when shown

function foodGenerator(object) {

  var foods = object;
  var active = [];

  for (var i = 0; i < foods.length; i++) {

    var foodHolder = $('<div>').addClass('food');
    var foodImageHolder = $('<div>')
          .addClass('food-image')
    var foodBackground = $('<div>')
          .addClass('food-background')
          .css('background-image', 'url(' + foods[i].image + ')');


    var foodContentHolder = $('<div>').addClass('food-content');
    var contentLeft = $('<div>').addClass('food-left');
    var contentRight = $('<div>').addClass('food-right');

    var foodName = $('<h3>').text(foods[i].name)
    var foodImage = $('<img>').attr('src', foods[i].image);
    var addressCompile = foods[i].address_street + ' ' + foods[i].address_suburb
    // var foodAddress = $('<p>').text(addressCompile)
    var foodProvider = $('<p>').text(foods[i].provider)
    var tags = $('<p>').text( (foods[i].tags).join(' • ') );

    var imageCompile = foodImageHolder
                          .append(foodImage)
                          .append(foodBackground)
    var leftColCompile = contentLeft.append(tags)
    var rightColCompile = contentRight.append(foodProvider)

    var contentCompile = foodContentHolder
                            .append(foodName)
                            // .append(foodAddress)
                            .append(leftColCompile)
                            .append(rightColCompile)

    var finalCompilation = foodHolder
                            .append(imageCompile)
                            .append(contentCompile)

    $('.secondary-results').append(finalCompilation)

  }

}
