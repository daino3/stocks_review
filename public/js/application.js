$(document).ready(function() {
  $("#loginbutton").on('click', function(){
    console.log("yo");
    $("#login").slideToggle();
  });

  $(".buy_stock").on('click', function(e){
    e.preventDefault();
    var data = $(this).text()
    console.log(data)
    $.get('/get_data', data, function(response){
      // console.log(response)
      $("#buy_form").show();
      $("<p>response</p>").appendTo("#buy_form");
    });
  })


  $("#hide_form").on('click', function(event){
    event.preventDefault();
    console.log("here");
    $("#buy_form").toggle();
  })
});
