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

  $('#q_sorts').change(function () {
    $('.exhibition_search').submit();
  })
    
  $('#q_price').change(function () {
    var val = $('#q_price').val();
    var price_gteq = val.match(/^\d+/);
    var price_lteq = val.match(/\d+$/);
    $('#q_price_gteq').val(price_gteq);
    $('#q_price_lteq').val(price_lteq);
  })

  if ($("#condition_boxes :checked").length == $("input[name='q[condition_id_in][]'").length - 1) {
    $('#condition_id').prop('checked', true);
  } else { 
    $('#condition_id').prop('checked', false);
  }
  $(".condition-all").on('click', function () {
    if ($("#condition_boxes :checked").length == $("input[name='q[condition_id_in][]'").length - 1) {
      $("input[name='q[condition_id_in][]'").prop('checked', false);
    } else {
      $("input[name='q[condition_id_in][]'").prop('checked', true);
    }
  });
  // 2. 「全選択」以外のチェックボックスがクリックされたら、
  $("input[name='q[condition_id_in][]'").on('click', function () {
    if ($("#condition_boxes :checked").length == $("input[name='q[condition_id_in][]'").length - 1) {
      // 全てのチェックボックスにチェックが入っていたら、「全選択」 = checked
      $('#condition_id').prop('checked', true);
    } else {
      // 1つでもチェックが入っていたら、「全選択」 = checked
      $('#condition_id').prop('checked', false);
    }
  });

  if ($("#shipping_method_boxes :checked").length == $("input[name='q[shipping_method_id_in][]'").length - 1) {
    $('#shipping_method_id').prop('checked', true);
  } else { 
    $('#shipping_method_id').prop('checked', false);
  }
  $(".shipping_method-all").on('click', function () {
    if ($("#shipping_method_boxes :checked").length == $("input[name='q[shipping_method_id_in][]'").length - 1) {
      $("input[name='q[shipping_method_id_in][]'").prop('checked', false);
    } else {
      $("input[name='q[shipping_method_id_in][]'").prop('checked', true);
    }
  });
  // 2. 「全選択」以外のチェックボックスがクリックされたら、
  $("input[name='q[shipping_method_id_in][]'").on('click', function () {
    if ($("#shipping_method_boxes :checked").length == $("input[name='q[shipping_method_id_in][]'").length - 1) {
      // 全てのチェックボックスにチェックが入っていたら、「全選択」 = checked
      $('#shipping_method_id').prop('checked', true);
    } else {
      // 1つでもチェックが入っていたら、「全選択」 = checked
      $('#shipping_method_id').prop('checked', false);
    }
  });
  
  if ($("#sales_status_boxes :checked").length == $("input[name='q[sales_status_in][]'").length) {
    $('#sales_status').prop('checked', true);
  } else { 
    $('#sales_status').prop('checked', false);
  }
  $(".sales_status-all").on('click', function () {
    if ($("#sales_status_boxes :checked").length == $("input[name='q[sales_status_in][]'").length) {
      $("input[name='q[sales_status_in][]'").prop('checked', false);
    } else {
      $("input[name='q[sales_status_in][]'").prop('checked', true);
    }
  });
  // 2. 「全選択」以外のチェックボックスがクリックされたら、
  $("input[name='q[sales_status_in][]'").on('click', function () {
    if ($("#sales_status_boxes :checked").length == $("input[name='q[sales_status_in][]'").length) {
      // 全てのチェックボックスにチェックが入っていたら、「全選択」 = checked
      $('#sales_status').prop('checked', true);
    } else {
      // 1つでもチェックが入っていたら、「全選択」 = checked
      $('#sales_status').prop('checked', false);
    }
  });


  var parentCategory = document.getElementById('q_category_id_in').value; 
  if (parentCategory != "") { 
    $.ajax({
      url: '/exhibitions/get_category_children',
      type: 'GET',
      data: { parent_name: parentCategory },
      dataType: 'json'
    })
      .done(function (children) {
        $('#children_wrapper').remove(); 
        $('#grandchild_category').remove();
      var insertHTML = '';
      children.forEach(function (child) {
        insertHTML += appendOption(child);
      });
      appendChidrenBox(insertHTML, parentCategory);
    })
    .fail(function(){
      alert('カテゴリー取得に失敗しました');
    })
  } else {
    $('#children_wrapper').remove(); 
    $('#grandchildren_wrapper').remove();
  }


  var childId = $('.set-child-category').text(); 
    if (childId != 0){ 
      $.ajax({
        url: '/exhibitions/get_category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#grandchildren_wrapper').remove(); 
          var insertHTML = '';
          grandchildren.forEach(function (grandchild) {
            if (grandchild.name !== ""){
              insertHTML += appendCheckBox(grandchild);
            }
          });
          if (insertHTML.length != 0) {
            appendGrandchidrenBox(insertHTML, childId);
          }
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#grandchildren_wrapper').remove(); 
    }

    var parentSizeId = $('#q_size_id_in option:selected').val();
  $('#size_wrapper').remove();
    if (parentSizeId != 0) { 
      $.ajax({
        url: '/exhibitions/get_size',
        type: 'GET',
        data: { parent_size_id: parentSizeId },
        dataType: 'json'
      })
        .done(function (sizes) {
        if (sizes.length != 0) {
        var insertHTML = '';
          sizes.forEach(function (size) {
            insertHTML += appendSizeCheckBox(size);
          });
          appendSizeCheckBoxes(insertHTML);
        }
      })
      .fail(function(){
        alert('サイズ取得に失敗しました');
      })
    }else{
      $('#exhibition-container').css('padding-bottom', '190px');
    }

  












  function appendSizeCheckBox(size) {
    var size_ids = $('.set-size').text().replace('[', " ").replace(']', "").replace(/\s+|\s+$/g, "").replace(/\"/g, "").split(',');
    var sizeSwitch = false;
    size_ids.forEach(function (size_id) {
      if (+size_id == size.id) {
        sizeSwitch = true;
      }
    })
    if (sizeSwitch) {
      var html = `<input type= checkbox value="${size.id}" checked="checked" id="q_size_id_in_${size.id}" name="q[size_id_in][]">
                  <label for="q_size_id_in_${size.id}">${size.size}</label>`;
      return html;
    } else {
      var html = `<input type= checkbox value="${size.id}" id="q_size_id_in_${size.id}" name="q[size_id_in][]">
                  <label for="q_size_id_in_${size.id}">${size.size}</label>`;
      return html;
    }
  }
  function appendSizeCheckBoxes(insertHTML) {
    var sizeSelectHtml = '';
    sizeSelectHtml = `<div class="item size" >
                      <div class="selectbox" id= 'size_wrapper'>
                          ${insertHTML}
                      </div>`;
    $('.search-size').append(sizeSelectHtml);
  }
  // カテゴリーセレクトボックスのオプションを作成
  function appendOption(category) {
    if ($('.set-child-category').text() == category.id) {
      var html = `<option selected='selected' value="${category.id}" data-category="${category.id}" class="child_category">${category.name}</option>`;
  return html;
    } else {
  var html = `<option value="${category.id}" data-category="${category.id}" class="child_category">${category.name}</option>`;
  return html;
}
  }
  function appendCheckBox(category) {
    
    var grand_child_ids = $('.set-grandchild-category').text().replace('[', " ").replace(']', "").replace(/\s+|\s+$/g, "").replace(/\"/g, "").split(',');
    var categorySwitch = false;
    grand_child_ids.forEach(function (grand_child_id) {
      if (+grand_child_id == category.id) {
        categorySwitch = true;
      }
    })
    if (categorySwitch) {
      var html = `<input type= checkbox value="${category.id}" checked="checked" 
                  id="q_category_id_in_${category.id}" name="q[category_id_in][]">
                  <label for="q_category_id_in_${category.id}">${category.name}</label>`;
      return html;
    } else {
      var html = `<input type= checkbox value="${category.id}" 
          id="q_category_id_in_${category.id}" name="q[category_id_in][]">
          <label for="q_category_id_in_${category.id}">${category.name}</label>`;
      return html;
    }
  }
  // 子カテゴリーの表示作成
  function appendChidrenBox(insertHTML, parentCategory) {
    var childSelectHtml = '';
    childSelectHtml = `<div class='select-wrapper__added' id= 'children_wrapper'>
                        <div class='select'>
                          <div class="detailed-select">
                            <select class="selectboxes" id="child_category" name="q[category_id_in][]">
                              <option value=${parentCategory} data-category="">すべて</option>
                              ${insertHTML}
                            </select>
                            <i class="fas fa-angle-down"></i>
                          </div>
                        </div>
                      </div>`;
    $('.search-category').append(childSelectHtml);
  }
  // 孫カテゴリーの表示作成
  function appendGrandchidrenBox(insertHTML) {
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<div class='select-wrapper__added' id= 'grandchildren_wrapper'>
                              <div class='select' id='grandchildren_wrapper'>
                                  ${insertHTML}
                              </div>
                            </div>`;
    $('.search-category').append(grandchildSelectHtml);
  }

  // 親カテゴリー選択後のイベント
  $('#q_category_id_in').on('change', function () {
    var parentCategory = document.getElementById('q_category_id_in').value;
    if (parentCategory != "") { 
      $.ajax({
        url: '/exhibitions/get_category_children',
        type: 'GET',
        data: { parent_name: parentCategory },
        dataType: 'json'
      })
        .done(function (children) {
          $('#children_wrapper').remove(); 
          $('#grandchildren_wrapper').remove();
        var insertHTML = '';
        children.forEach(function (child) {
          insertHTML += appendOption(child);
        });
        appendChidrenBox(insertHTML, parentCategory);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    } else {
      $('#children_wrapper').remove(); 
      $('#grandchildren_wrapper').remove();
    }
    
  });
  // 子カテゴリー選択後のイベント
  $('.search-category').on('change', '#child_category', function () {
    $('#child_category option:selected').prop('selected', true);
    var childId = $('#child_category option:selected').data('category'); 
    if (childId != 0){ 
      $.ajax({
        url: '/exhibitions/get_category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
        .done(function (grandchildren) {
        if (grandchildren.length != 0) {
          $('#grandchildren_wrapper').remove(); 
  
          var insertHTML = '';
          grandchildren.forEach(function (grandchild) {
            if (grandchild.name !== ""){
              insertHTML += appendCheckBox(grandchild);
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
      $('#grandchildren_wrapper').remove(); 
    }
  });

  $('#q_size_id_in').on('change', function(){
    var parentSizeId = $('#q_size_id_in option:selected').val();
    $('#size_wrapper').remove();
    if (parentSizeId != 0) { //孫カテゴリーが初期値でないことを確認
      $.ajax({
        url: '/exhibitions/get_size',
        type: 'GET',
        data: { parent_size_id: parentSizeId },
        dataType: 'json'
      })
        .done(function (sizes) {
        if (sizes.length != 0) {
        var insertHTML = '';
          sizes.forEach(function (size) {
            insertHTML += appendSizeCheckBox(size);
          });
          appendSizeCheckBoxes(insertHTML);
        }
      })
      .fail(function(){
        alert('サイズ取得に失敗しました');
      })
    }else{
      $('#exhibition-container').css('padding-bottom', '190px');
    }
  });
  $('.reset-btn').on('click', function () {
    var searchText = $(".header__inner-top--search-window").val();
    $("input:checkbox").attr("checked", false);
    $("option").attr("selected", false);
    $('#children_wrapper').remove(); 
    $('#grandchildren_wrapper').remove();
    $('#size_wrapper').remove();
    $('form').find(':text').val("");
    $(".header__inner-top--search-window").val(searchText);
  })

})