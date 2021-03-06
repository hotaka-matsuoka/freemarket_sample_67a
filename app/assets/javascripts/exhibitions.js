
document.addEventListener("turbolinks:load",function () {

  // 商品説明文字数

  $("#exhibition_explanation").on('keyup', function () {
    $(".count").text($(this).val().length + '/1000');
  });
  // 販売手数料・利益
  $("#exhibition_price.price").on('keyup', function () {
    if ($(this).val() >= 300 && $(this).val() < 10000000) {
      var commission = Math.trunc($(this).val() / 10)
      $(".sale__right").text('¥' + commission + '');
      $(".sale__right.two").text('¥' + ($(this).val() - commission) + '');
    } else {
      $(".sale__right").text('ー');
    }
  });

  const buildFileField = (index)=> {
    const html = `<div  class="js-file_group" data-index="${index}">
                    <input class="js-file" type="file"
                    name="exhibition[images_attributes][${index}][image_url]"
                    id="exhibition_images_attributes_${index}_image_url">
                  </div>`;
    return html;
  }
  $('.hidden-destroy').hide();
  const buildImg = (index, url)=> {
    const html = `<div data-index="${index}" class="image-wrapper">
                    <img data-index="${index}" src="${url}" width="120px" height="120px">
                    <div class="img-buttom">
                      <div class="js-remove">削除</div>
                      <label for="exhibition_images_attributes_${index}_image_url" class="edit-label">編集</>
                    </div>
                  </div>`;
    $('.label-content').before(html);
  }
  let fileIndex = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);
  sizingLabel();

  function sizingLabel() {
    var i = $('.image-wrapper').length
    $('.label-content').show();
    if (i == 1 || i == 6) {
      $('.label-content').css('width', '80%');
    } else if (i == 2 || i == 7) {
      $('.label-content').css('width', '60%');
    } else if (i == 3 || i == 8) {
      $('.label-content').css('width', '40%');
    } else if (i == 4 || i == 9) {
      $('.label-content').css('width', '20%');
    } else if (i == 5 || i == 0) {
      $('.label-content').css('width', '100%');
    } else if (i == 10){
      $('.label-content').hide();
    };
    id = $('.js-file_group:last').data('index');
    $('.label-box').attr({id: `label-box--${id}`,for: `exhibition_images_attributes_${id}_image_url`});
  };
 
  $('#image-box').on('change', '.js-file', function(e) {
    var targetIndex = $(this).parent().data('index');
    var file = e.target.files[0];
    var blobUrl = window.URL.createObjectURL(file);
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {  
      $('#previews').append(buildImg(targetIndex, blobUrl));
      $('#image-box').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    };
    sizingLabel();
  });

  $('#image-box').on('click', '.js-remove', function() {
    var targetIndex = $(this).parent().parent().data('index');
    var hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    var targetFile = $(`#exhibition_images_attributes_${targetIndex}_image_url`);
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    $(this).parent().parent().remove();
    $(targetFile).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
    sizingLabel();
  });

});