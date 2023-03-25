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
const userGames = document.getElementById("user-games");

function validateFirstName() {
  const firstNameValue = firstNameInput.value;
  if (firstNameValue.length !== 0) {
    firstNameError.innerHTML = "";
    return true;
  }
  else {
    firstNameError.innerHTML = "First name is required";
    return false;
  }
}

function validateLastName() {
  const lastNameValue = lastNameInput.value;
  if (lastNameValue.length !== 0) {
    lastNameError.innerHTML = "";
    return true;
  }
  else {
    lastNameError.innerHTML = "First name is required";
    return false;
  }
}
function validateEmail() {
  const emailValue = emailInput.value;
  if (emailValue.length !== 0) {
    emailError.innerHTML = "";
    return true;
  }
  else {
    emailError.innerHTML = "Email is required";
    return false;
  }
}
function validatePhone() {
  const phoneValue = phoneInput.value;
  if (phoneValue.length !== 0) {
    phoneError.innerHTML = "";
    return true;
  }
  else {
    phoneError.innerHTML = "phone is required";
    return false;
  }
}

function validateCreditNum() {
  const cardNumValue = cardNumInput.value;
  if (cardNumValue.length !== 0) {
    cardNumError.innerHTML = "";
    return true;
  }
  else {
    cardNumError.innerHTML = "Card Number is required";
    return false;
  }
}
function validateCVV() {
  const cvvNumValue = cvvNumInput.value;
  if (cvvNumValue.length !== 0) {
    cvvNumError.innerHTML = "";
    return true;
  }
  else {
    cvvNumError.innerHTML = "CVV Number is required";
    return false;
  }
}
function validateCreditowner() {
  const cardOwnerNameValue = cardOwnerNameInput.value;
  if (cardOwnerNameValue.length !== 0) {
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
  console.log(userGames);
  if (userGames && validateFirstName() && validateLastName() && validateEmail()
    && validatePhone() && validateCreditNum() && validateCVV()
    && validateCreditowner() ) {
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
  else{
    console.log("error")
  }
}

function deleteGameFromCart(gameId) {
  $.ajax({
    type: "DELETE",
    url: '/fusion/cart',
    data: JSON.stringify({ gameId: gameId }),
    dataType: "json", //set data
    success: function sucessDeleted(result) {
      console.log(gameId);
      const res = JSON.parse(JSON.stringify(result));
      console.log(res.totalPrice);

      document.getElementById(gameId).remove();
      document.getElementById("totalCartNetPrice").innerText = "$" + res.totalNetPrice;
      document.getElementById("totalCartPrice").innerText = "$" + res.totalPrice;
      document.getElementById("totalCartDiscount").innerText = "%" + res.totalDiscount;
    }
  });
}
