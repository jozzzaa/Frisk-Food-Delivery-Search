
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

// Windw.location.pathname
// Store in temp array then appeend to active/results when shown


function foodGenerator(object) {

  var foods = object

  for (var i = 0; i < foods.length; i++) {

    var foodHolder = $('<div>').addClass('food')
    var foodImageHolder = $('<div>').addClass('food-image')
    var foodContentHolder = $('<div>').addClass('food-content')

    var foodName = $('<h3>').text(foods[i].name)
    var foodImage = $('<img>').attr('src', foods[i].image_url);
    var addressCompile = foods[i].address_street + ' ' + foods[i].address_suburb
    var foodAddress = $('<p>').text(addressCompile)
    var foodProvider = $('<p>').text(foods[i].provider)
    var tags = "nil"

    var imageCompile = foodImageHolder.append(foodImage)
    var contentCompile = foodContentHolder
                            .append(foodName)
                            .append(foodAddress)
                            .append(foodProvider)

    var finalCompilation = foodHolder
                            .append(imageCompile)
                            .append(contentCompile)

    $('.results').append(finalCompilation)

  }

}
