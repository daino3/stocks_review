$(document).ready(function() {
  $("#loginbutton").on('click', function(){
    console.log("yo");
    $("#login").slideToggle();
  });

  $(".buy_stock").on('click', function(e){
    e.preventDefault();

    var data = $(this).text();
    var that = $(this).parent().parent().get(0);
    $.get('/get_data', data, function(response){
      $('#buy_form').remove();
      $(that).after(response);
      $('#buy_form').hide().fadeIn(1000);
      console.log("here1");
    });
    // $("#hide_form").on('click', function(event){
    //     event.preventDefault();
    //     console.log("here2");
    //     $("#buy_form").remove();
    //   });
  });
    $("#toggle").on('click', function(){ 
    $("#list_to_hide").animate({height: "toggle"},"slow", function(){
      $(this).parent().toggleClass("contracted");
      // console.log($(this).parent().attr("class"))
      if ($(this).parent().attr("class") === "contracted") {
        $(this).prev().text("open nav bar");
      }
      else
        $(this).prev().text("close nav bar");
    });
  });
});
