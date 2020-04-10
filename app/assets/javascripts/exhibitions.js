$(function(){
  $("#exibition_explanation").on('keyup', function(){
    $(".count").text($(this).val().length + '/1000');
  });

  $("#exibition_price.price").on('keyup', function () {
    if ($(this).val() >= 300 && $(this).val() < 10000000) {
      var commission = Math.trunc($(this).val() / 10)
      $(".sale__right").text('¥' + commission + '');
      $(".sale__right.two").text('¥' + ($(this).val() - commission) + '');
    } else {
      $(".sale__right").text('ー');
    }
  });
})