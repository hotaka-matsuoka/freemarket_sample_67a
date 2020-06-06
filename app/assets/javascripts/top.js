document.addEventListener("turbolinks:load",function () {

  $('.top-category-js').hover(function() {
    $('.top-category').removeClass('none');
  }, function() {
      $('.top-category').addClass('none');
      $('.child-js').addClass('none');
      $('.grandchild-js').addClass('none');
  });

  $('.brand-js').hover(function() {
    $('.brand').removeClass('none');
  }, function() {
    $('.brand').addClass('none');
 
  });
});