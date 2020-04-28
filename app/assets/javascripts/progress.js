window.addEventListener("load", function() {
  var path = location.pathname;
  if (path == "/users/sign_up") {
    $(".user").css('font-weight', 'bold');
  };
  if (path == "/addresses") {
    $(".address").css('color','#ea352d');
    $(".address").css('font-weight', 'bold');
    $("#status__address").css('background-color', '#ea352d');
    $("#bar__user").css('background-color', '#ea352d');
  };
  if (path == "/card/new") {
    $(".address").css('color','#ea352d');
    $("#status__address").css('background-color', '#ea352d');
    $("#bar__user").css('background-color', '#ea352d');
    $(".payment").css('color','#ea352d');
    $(".payment").css('font-weight', 'bold');
    $("#status__payment").css('background-color', '#ea352d');
    $("#bar__address").css('background-color', '#ea352d');
  };
});
