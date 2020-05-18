$(document).on('turbolinks:load', function(){
  function buildHTML(comment) {
    var html = 
      `<div class="comments-field__comment">
        <div class="comments-field__comment--user">
          <i class="fas fa-user-circle"></i>
          <div class="comments-field__comment--username">${comment.user_name}</div>
        </div>
          <div class="comments-field__comment--wrapper">
            <p>${comment.content}</p>
            <div class="message-info__date">
              ${time_ago_in_words(comment.created_at)}
            </div>
          </div>
      </div>`
    return html;
  };
  $("#new_comment").on('submit', function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data) {
      var html = buildHTML(data);
      $('.comment-field').append(html);
      $('#new_comment')[0].reset();
      $('.comment-form__comment-btn').prop('disabled', false);
      console.log(data);
    })
    .fail(function() {
      alert("コメントを入力してください");
      $('.comment-form__comment-btn').prop('disabled', false);
    });
  });
});