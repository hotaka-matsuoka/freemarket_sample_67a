function changeProgressBar() {
  let address = document.getElementById("address");
  let status__address = document.getElementById("status__address");
  let bar__address = document.getElementById("bar__user");
  var url = location.href;
  if (url == "http://localhost:3000/addresses"){
    address.style.color = '#ea352d';
    status__address.style.backgroundColor = '#ea352d';
    bar__address.style.backgroundColor = '#ea352d'
  }
};
window.addEventListener("load", changeProgressBar);