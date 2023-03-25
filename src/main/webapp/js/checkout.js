const refreshBtn = document.getElementById("btnRefresh");


// function saveGuestCheckOut() {
//     var form = document.getElementById("myForm");
//     var formData = new FormData(form);
//     localStorage.setItem("formData", JSON.stringify(formData));
//     form.submit();
//   }

function handleClick() {
  window.location.reload();
}


function sendRequest() {
  var xmlhr = new XMLHttpRequest();
  xmlhr.open('GET', 'CheckOutServlet', true);
  xhr.onload = function () {
    if (this.status == 200) {
      if (this.responseText === 'true') {
        alert('Sorry you exceeded you card limit');
      } else {
        document.getElementById('checkout').innerHTML;

      }
    }
  };
  xhr.send();
}

function checkOut() {
  //validation 

  $.post("/fusion/user/checkout",
    function success(isSuccess) {
      console.log(isSuccess);
      var result = JSON.parse(JSON.stringify(isSuccess));
      console.log(result);
      if (result.success === "true") {
        window.location.href = "library-page"
      }
      else {
        alert('Sorry you exceeded you card limit');

      }
    }, "json");
}

function deleteGameFromCart(gameId) {
  $.ajax({
    type: "DELETE", 
    url: '/fusion/cart', 
    data: JSON.stringify({ gameId: gameId }),
    dataType: "json", //set data
    success: function sucessDeleted(result){
      console.log(gameId);
      const res = JSON.parse(JSON.stringify(result));
      console.log(res.totalPrice);
      
      document.getElementById(gameId).remove();
      document.getElementById("totalCartNetPrice").innerText = "$" + res.totalNetPrice;
      document.getElementById("totalCartPrice").innerText = "$"+ res.totalPrice;
      document.getElementById("totalCartDiscount").innerText = "%"+res.totalDiscount;
    }
  });
}
