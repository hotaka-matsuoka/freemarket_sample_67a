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
  //DataTransferオブジェクトで、データを格納する箱を作る
  var dataBox = new DataTransfer();
  //querySelectorでfile_fieldを取得
  var file_field = document.querySelector('input[type=file]')
  //fileが選択された時に発火するイベント
  $('#img-file').change(function(){
    //選択したfileのオブジェクトをpropで取得
    var files = $('input[type="file"]').prop('files')[0];
    $.each(this.files, function(i, file){
      //FileReaderのreadAsDataURLで指定したFileオブジェクトを読み込む
      var fileReader = new FileReader();
      //DataTransferオブジェクトに対して、fileを追加
      dataBox.items.add(file)
      //DataTransferオブジェクトに入ったfile一覧をfile_fieldの中に代入
      file_field.files = dataBox.files

      var num = $('.exhibition-image').length + 1 + i
      fileReader.readAsDataURL(file);
    //画像が10枚になったら超えたらドロップボックスを削除する
      if (num == 10){
        $('#image-box__container').css('display', 'none')
      }
    //読み込みが完了すると、srcにfileのURLを格納
    fileReader.onloadend = function() {
      var src = fileReader.result
      var html= `<div class='exhibition-image' data-image="${file.name}">
      <div class=' exhibition-image__content'>
        <div class='exhibition-image__content--icon'>
          <img src=${src} width="124" height="120" >
        </div>
      </div>
      <div class='exhibition-image__operetion'>
        <div class='exhibition-image__operetion--delete'>削除</div>
      </div>
    </div>`
      //image_box__container要素の前にhtmlを差し込む
      $('#image-box__container').before(html);
    };
      //image-box__containerのクラスを変更し、CSSでドロップボックスの大きさを変える。
      $('#image-box__container').attr('class', `exhibition-num-${num}`)
      if (num > 4) {
        $('.exhibition-container').removeClass('img');
      }
    });
  });
  //削除ボタンをクリックすると発火するイベント
  $(document).on("click", '.exhibition-image__operetion--delete', function(){
    //削除を押されたプレビュー要素を取得
    var target_image = $(this).parent().parent()
    //削除を押されたプレビューimageのfile名を取得
    var target_name = $(target_image).data('image')
    //プレビューがひとつだけの場合、file_fieldをクリア
    if(file_field.files.length==1){
      //inputタグに入ったファイルを削除
      $('input[type=file]').val(null)
      dataBox.clearData();
      console.log(dataBox)
    }else{
      //プレビューが複数の場合
      $.each(file_field.files, function(i,input){
        //削除を押された要素と一致した時、index番号に基づいてdataBoxに格納された要素を削除する
        if(input.name==target_name){
          dataBox.items.remove(i) 
        }
      })
      //DataTransferオブジェクトに入ったfile一覧をfile_fieldの中に再度代入
      file_field.files = dataBox.files
    }
    //プレビューを削除
    target_image.remove()
    //image-box__containerクラスをもつdivタグのクラスを削除のたびに変更
    var num = $('.exhibition-image').length
    $('#image-box__container').show()
    $('#image-box__container').attr('class', `exhibition-num-${num}`)
    if (num < 5) {
      $('#1').addClass('img');
    }
  })
});