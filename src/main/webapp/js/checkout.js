const firstNameInput = document.getElementById("first-name");
const firstNameError = document.getElementById("first-name-error");
const lastNameInput = document.getElementById("last-name");
const lastNameError = document.getElementById("last-name-error");
const emailInput = document.getElementById("email");
const emailError = document.getElementById("email-error");
const phoneInput = document.getElementById("phone");
const phoneError = document.getElementById("phone-error");
const cardNumInput = document.getElementById("card-num");
const cardNumError = document.getElementById("card-num-error");
const cvvNumInput = document.getElementById("cvv-num");
const cvvNumError = document.getElementById("cvv-num-error");
const cardOwnerNameInput = document.getElementById("card-owner-name");
const cardOwnerNameError = document.getElementById("card-owner-name-error");

// const userGames = document.getElementById("user-games");
const myModal = document.querySelector('#exampleModal');
var myModalEl = new bootstrap.Modal(myModal);

function validateFirstName() {
  const regex = /^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$/;
  const firstNameValue = firstNameInput.value;
  if (regex.test(firstNameValue)) {
    firstNameError.innerHTML = "";
    return true;
  }
  else {
    firstNameError.innerHTML = "First name is required";
    return false;
  }
}

function validateLastName() {
  const regex = /^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$/;
  const lastNameValue = lastNameInput.value;
  if (regex.test(lastNameValue)) {
    lastNameError.innerHTML = "";
    return true;
  }
  else {
    lastNameError.innerHTML = "First name is required";
    return false;
  }
}
function validateEmail() {
  const regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
  const emailValue = emailInput.value;
  if (regex.test(emailValue)) {
    emailError.innerHTML = "";
    return true;
  }
  else {
    emailError.innerHTML = "Email is required";
    return false;
  }
}
function validatePhone() {
  const regex = /^\+20 1[0125][0-9]{8}$/;
  const phoneValue = phoneInput.value;
  console.log(phoneValue);
  if (regex.test(phoneValue)) {
    phoneError.innerHTML = "";
    return true;
  }
  else {
    phoneError.innerHTML = "phone is required";
    return false;
  }
}

function validateCreditNum() {
  const regex = /^([0-9]{4}-){3}[0-9]{4}$/

  const cardNumValue = cardNumInput.value;
  if (regex.test(cardNumValue)) {
    cardNumError.innerHTML = "";
    return true;
  }
  else {
    cardNumError.innerHTML = "Card Number is required";
    return false;
  }
}
function validateCVV() {
  const regex = /^[0-9]{3,4}$/;
  const cvvNumValue = cvvNumInput.value;
  if (regex.test(cvvNumValue)) {
    cvvNumError.innerHTML = "";
    return true;
  }
  else {
    cvvNumError.innerHTML = "CVV Number is required";
    return false;
  }
}
function validateCreditowner() {
  const regex = /^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$/;
  const cardOwnerNameValue = cardOwnerNameInput.value;
  if (regex.test(cardOwnerNameValue)) {
    cardOwnerNameError.innerHTML = "";
    return true;
  }
  else {
    cardOwnerNameError.innerHTML = "Card Owner Name is required";
    return false;
  }
}


function checkOut() {
  //validation 
  // console.log(userGames);
  if (validateFirstName() && validateLastName() && validateEmail()
    && validatePhone() && validateCreditNum() && validateCVV()
    && validateCreditowner())
    {
    $.post("/fusion/user/checkout",
      function success(isSuccess) {
        console.log(isSuccess.success);
        var result = isSuccess
        console.log(result);
        if (result.success == "true") {
          window.location.href = "library-page"
        }
        else {
          myModalEl.show();

        }
      }, "json");
  }
  else {
    console.log("error")
  }
}

function hide() {
  console.log("ni")
  myModalEl.hide();
}
function backHome() {
  window.location.href="home";
}


function deleteGameFromCart(gameId) {
  $.ajax({
    type: "DELETE",
    url: '/fusion/cart',
    data: JSON.stringify({ gameId: gameId }),
    dataType: "json", //set data
    success: function sucessDeleted(result) {
      console.log(gameId);
      const res = result;
      console.log(res.totalPrice);

      document.getElementById(gameId).remove();
      document.getElementById("totalCartNetPrice").innerText = "$" + res.totalNetPrice;
      document.getElementById("totalCartPrice").innerText = "$" + res.totalPrice;
      document.getElementById("totalCartDiscount").innerText = "%" + res.totalDiscount;
    }
  });
}
