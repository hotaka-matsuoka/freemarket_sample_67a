function changeProgressBar() {
  let address = document.getElementById("address");
  let status__address = document.getElementById("status__address");
  let bar__user = document.getElementById("bar__user");
  let payment = document.getElementById("payment");
  let bar__address = document.getElementById("bar__address");
  let status__payment = document.getElementById("status__payment");

  var url = location.href;
  if (url == "http://localhost:3000/addresses"){
    address.style.color = '#ea352d';
    status__address.style.backgroundColor = '#ea352d';
    bar__user.style.backgroundColor = '#ea352d'
  };

  if (url == "http://localhost:3000/card/new") {
    address.style.color = '#ea352d';
    status__address.style.backgroundColor = '#ea352d';
    bar__user.style.backgroundColor = '#ea352d'
    payment.style.color = "#ea352d";
    bar__address.style.backgroundColor = "#ea352d";
    status__payment.style.backgroundColor = "#ea352d";
  };
};
window.addEventListener("load", changeProgressBar);