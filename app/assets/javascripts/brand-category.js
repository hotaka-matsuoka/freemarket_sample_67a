document.addEventListener("turbolinks:load", function () {
  $('.category-js').on('click', function () {
    $('.category-js').removeClass('bg-color--selected')
    $(this).addClass('bg-color--selected')
    category_id = $(this).attr('id')
    $('.category-title-js').addClass('none')
    $('.category'+ category_id).removeClass('none');
  })

  $('.scroll-js').click(function() {
    var speed = 1000;
    var href= $(this).attr("href");
    var target = $(href == "#" || href == "" ? 'html' : href);
    var position = target.offset().top;
    $('body,html').animate({scrollTop:position}, speed, 'swing');
  })
})