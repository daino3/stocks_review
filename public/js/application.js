$(document).ready(function() {
  $("#loginbutton").on('click', function(){
    $("#login").slideToggle();
  })

  $("#create_new_user").on('submit', function(event){
    event.preventDefault();
    var data = $(this).serialize();
    $.post('/create_new_user', data, function(response){
      $(this).slideUp();
      console.log("HEREEEEE!!")
      $(".container").html("<h1>New user created</h1>" + response);
    })
    console.log(data);
  })
});
