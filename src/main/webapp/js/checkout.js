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


function sendRequest(){
        var xmlhr = new XMLHttpRequest();
        xmlhr.open('GET', 'CheckOutServlet', true);
        xhr.onload = function() {
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

function checkOut(){
  //validation 

    $.post("/fusion/user/checkout",
        function success(isSuccess){
          let result = JSON.parse(isSuccess);
          if(result.get("success")==="true"){
            window.location.href="library-page.jsp"
          }
          else{
            alert('Sorry you exceeded you card limit');

          }
      });
}
