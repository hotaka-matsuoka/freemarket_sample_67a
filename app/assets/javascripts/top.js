document.addEventListener("turbolinks:load",function () {

  $('.category-js').hover(function() {
    $('.category').removeClass('none');
  }, function() {
    $('.category').addClass('none');
  });
  function getId() {
    $('.category__list').hover(function () {
      var val = $(this).attr('id')
      $('#child' + val).removeClass('none');
      $('#child' + val).addClass('category-js')
      return val;
    }, function () {
        var val = $(this).attr('id');
      $('#child' + val).addClass('none');
      $('#child' + val).removeClass('category-js')
        return val;
    })
  }
  $('.category-js').hover(function(){
    $('.category-child').hover(function () {
      $('#child' + getId()).removeClass('none')
    })
  }, function () {
      $('#child'+getId()).addClass('none')
  })

  $('.brand-js').hover(function() {
    $('.brand').removeClass('none');
  }, function() {
    $('.brand').addClass('none');
 
  });
});