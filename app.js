$(document).ready(function(){

  $('.morius').on('click',function(){


    $.getJSON( "latim.json", function(data) {
      var items = [];

      $.each( data, function(key, val) {
        items.push( val + '<br /> <br />');
      });

      randomArray = []
      for(var i=0; i<5; i+=1){
        randomArray.push(items[Math.floor(Math.random()*items.length)]);
      }

      $('#text').html('Sergius Morus lavaris jatus Lulius presus. ' + randomArray.join(''));

    });



  })



})
