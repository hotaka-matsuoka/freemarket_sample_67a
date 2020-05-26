// $(document).on('turbolinks:load', function(){
//   function buildHTML() {
//     var html = 
//       `<div class="error_meesage">入力してください</div>`
//     return html;
//   };


//   var id = $(".edit_exhibition").attr('id').slice(16);
//   $(`#edit_exhibition_${id}`).on('submit', function (e){
//     e.preventDefault();
//     var formData = new FormData(this);
//     var url = $(this).attr('action');
//     $.ajax({
//       url: url,
//       type: "POST",
//       data: formData,
//       dataType: 'json',
//       processData: false,
//       contentType: false
//     })
//     .done(function() {
//       $('.actions--blue').prop('disabled', false);

//     })
//     .fail(function() {
//       location.href = url;
//     });
//   });
// });