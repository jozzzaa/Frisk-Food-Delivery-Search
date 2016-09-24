


function imageCanvas() {

  var canvas = $('.scrolling-canvas')[0]
  var context = canvas.getContext('2d');
  var image = new Image();

  image.onload = function() {

    var x = 0;
    var height = image.height;
    var min = 0 - height;
    var step = 1;

    var loop = function() {
      context.drawImage(image, 0, x);
      context.drawImage(image, 0, x + height);
      x -= step;
      if (x < min) {
        x = 0;
      }
    };

    setInterval(loop, 1000/30);

  };

  image.src = '/images/bg-scroll/bg-scroll-resize.png';

}









// var canvas = document.getElementById('myCanvas');
//   var context = canvas.getContext('2d');
//   var image = new Image();
//
//   image.onload = function() {
//     var x = 0;
//     var width = image.width;
//     var min = 0-width;
//     var step = 1;
//
//     var loop = function() {
//       context.drawImage(image, x, 0);
//       context.drawImage(image, x + width, 0);
//       x -= step;
//       if (x < min) {
//         x = 0;
//       }
//     };
//     setInterval(loop, 1000 / 60);
//   };
//
//   image.src = 'norman-the-french-bulldog.jpg';
