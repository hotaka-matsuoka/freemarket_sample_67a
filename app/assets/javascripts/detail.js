document.addEventListener("turbolinks:load",function () {
  $('.thumbnail li').click(function() {
    var className = $(this).attr("class");
    var num = className.slice(5);
    $('.preview li').hide();
    $('.item' + num).fadeIn();
  });
});