$(function() {
  $(".preview, li").each(function(i) {
    i = i+1;
    $('.item' + i).hide();
  });
    $('.thumbnail li').click(function() {
      var className = $(this).attr("class");
      var num = className.slice(5);
      $('.preview li').hide();
      $('.item' + num).fadeIn();
    });
});