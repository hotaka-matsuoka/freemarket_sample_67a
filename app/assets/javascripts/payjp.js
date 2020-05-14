document.addEventListener("turbolinks:load", e => {
    if (document.getElementById("token_submit") != null) {
      Payjp.setPublicKey("pk_test_4736003f33400cd0cfbdcd6c");
      let btn = document.getElementById("token_submit");
      btn.addEventListener("click", e => {
        e.preventDefault();
        let card = {
          number: document.getElementById("card_number").value,
          cvc: document.getElementById("cvc").value,
          exp_month: document.getElementById("exp_month").value,
          exp_year: document.getElementById("exp_year").value
        };
        Payjp.createToken(card, (status, response) => {
          if (status === 200) {
            $("#card_number").removeAttr("name");
            $("#cvc").removeAttr("name");
            $("#exp_month").removeAttr("name");
            $("#exp_year").removeAttr("name"); 
            $("#card_token").append(
              $('<input type="hidden" name="payjp-token">').val(response.id)
            );
            document.inputForm.submit();
            alert("登録が完了しました");
          } else {
            alert("カード情報が正しくありません。"); 
          }
        });
      });
    }
    var cardLogo = $(".card-logo__wrapper").children('img').attr('src');
    if ( cardLogo.match("Visa")){
      $("#card_logo").css('width', '55px');
      $("#card_logo").css('height', '20px');
    } else if ( cardLogo.match("Mastercard")) {
      $("#card_logo").css('width', '50px');
      $("#card_logo").css('height', '40px');
    } else if ( cardLogo.match("JCB")){
      $("#card_logo").css('width', '45px');
      $("#card_logo").css('height', '35px');
    } else if ( cardLogo.match("American_Express")){
      $("#card_logo").css('width', '40px');
      $("#card_logo").css('height', '40px');
    } else if ( cardLogo.match("Diners_Club")){
      $("#card_logo").css('width', '55px');
      $("#card_logo").css('height', '40px');
    } else if ( cardLogo.match("Discover")){
      $("#card_logo").css('width', '55px');
      $("#card_logo").css('height', '35px');
    };
  },
  false
);