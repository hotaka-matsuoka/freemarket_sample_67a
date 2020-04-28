<<<<<<< HEAD
document.addEventListener("turbolinks:load",function () {
=======
$(function () {

>>>>>>> parent of 1e8b33d... remove commentout
  // サイズセレクトボックスのオプションを作成
  function appendSizeOption(size){
    var html = `<option value="${size.id}">${size.size}</option>`;
    return html;
  }
  // サイズ・ブランド入力欄の表示作成
  function appendSizeBox(insertHTML){
    var sizeSelectHtml = '';
    sizeSelectHtml = `<div class="item size" >
                        <div class="item__label size">サイズ</div>
                        <div class='item__required' size>必須</div>
                      </div>
                      <div class="selectbox" id= 'size_wrapper'>
                        <select class="selectbox" id="size" name="exhibition[size_id]">
                          <option value="0">選択してください</option>
                          ${insertHTML}
                        </select>
                      </div>`;
    $('#exhibition-container').css('padding-bottom', '300px');
    $('.select-wrapper').append(sizeSelectHtml);
  }
  // カテゴリーセレクトボックスのオプションを作成
  function appendOption(category){
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  // 子カテゴリーの表示作成
  function appendChidrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<div class='select-wrapper__added' id= 'children_wrapper'>
                        <div class='select'>
                          <select class="selectbox" id="child_category" name="exhibition[category_id]">
                            <option value="0" data-category="0">選択してください</option>
                            ${insertHTML}
                          </select>
                        </div>
                      </div>`;
    $('#exhibition-container').css('padding-bottom', '120px');
    $('.select-wrapper').append(childSelectHtml);
  }
  // 孫カテゴリーの表示作成
  function appendGrandchidrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<div class='select-wrapper__added' id= 'grandchildren_wrapper'>
                              <div class='select'>
                                <select class="selectbox" id="grandchild_category" name="exhibition[category_id]">
                                  <option value="0" data-category="0">選択してください</option>
                                  ${insertHTML}
                                </select>
                              </div>
                            </div>`;
    $('#exhibition-container').css('padding-bottom', '190px');
    $('.select-wrapper').append(grandchildSelectHtml);
  }


  // 親カテゴリー選択後のイベント
  $('#parent_category').on('change', function(){
    var parentCategory = document.getElementById('parent_category').value; //選択された親カテゴリーの名前を取得
    if (parentCategory != "選択してください") { //親カテゴリーが初期値でないことを確認
      $.ajax({
        url: 'get_category_children',
        type: 'GET',
        data: { parent_name: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        $('#children_wrapper').remove(); //親が変更された時、子以下を削除する
        $('#grandchildren_wrapper').remove();
        $('#size_wrapper').remove();
        $('.size').remove();
        var insertHTML = '';
        children.forEach(function (child) {
          insertHTML += appendOption(child);
        });
        appendChidrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#children_wrapper').remove(); //親カテゴリーが初期値になった時、子以下を削除する
      $('#grandchildren_wrapper').remove();
      $('#size_wrapper').remove();
      $('.size').remove();
      $('#exhibition-container').css('padding-bottom', '50px');
    }
  });
  // 子カテゴリー選択後のイベント
  $('#exhibition-container').on('change', '#child_category', function(){
    var childId = $('#child_category option:selected').data('category'); //選択された子カテゴリーのidを取得
    if (childId != 0){ //子カテゴリーが初期値でないことを確認
      $.ajax({
        url: 'get_category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#grandchildren_wrapper').remove(); //子が変更された時、孫以下を削除する
          $('#size_wrapper').remove();
          $('.size').remove();
          var insertHTML = '';
          grandchildren.forEach(function (grandchild) {
            if (grandchild.name !== ""){
              insertHTML += appendOption(grandchild);
            }
          });
          if (insertHTML.length != 0) {
            appendGrandchidrenBox(insertHTML);
          }
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#grandchildren_wrapper').remove(); //子カテゴリーが初期値になった時、孫以下を削除する
      $('#size_wrapper').remove();
      $('.size').remove();
      $('#exhibition-container').css('padding-bottom', '120px');
    }
  });
  // 孫カテゴリー選択後のイベント
  $('#exhibition-container').on('change', '#grandchild_category', function(){
    var grandchildId = $('#grandchild_category option:selected').data('category'); //選択された孫カテゴリーのidを取得
    if (grandchildId != 0) { //孫カテゴリーが初期値でないことを確認
      $.ajax({
        url: 'get_size',
        type: 'GET',
        data: { grandchild_id: grandchildId },
        dataType: 'json'
      })
      .done(function(sizes){
        $('#size_wrapper').remove(); //孫が変更された時、サイズ欄以下を削除する
        $('.size').remove();
        if (sizes.length != 0) {
        var insertHTML = '';
          sizes.forEach(function (size) {
            insertHTML += appendSizeOption(size);
          });
          appendSizeBox(insertHTML);
        }
      })
      .fail(function(){
        alert('サイズ取得に失敗しました');
      })
    }else{
      $('#size_wrapper').remove(); //孫カテゴリーが初期値になった時、サイズ欄以下を削除する
      $('.size').remove();
      $('#exhibition-container').css('padding-bottom', '190px');
    }
  });
});