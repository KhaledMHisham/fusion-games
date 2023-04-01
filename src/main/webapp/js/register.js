const firstNameInput = document.getElementById("first-name");
const firstNameError = document.getElementById("first-name-error");
const lastNameInput = document.getElementById("last-name");
const lastNameError = document.getElementById("last-name-error");
const usernameInput = document.getElementById("username");
const usernameError = document.getElementById("username-error");
const emailInput = document.getElementById("email");
const emailError = document.getElementById("email-error");
const phoneNumberInput = document.getElementById("phonenumber");
const phoneNumberError = document.getElementById("phonenumber-error");
const passwordInput = document.getElementById("password");
const passwordError = document.getElementById("password-error");
const confirmPasswordInput = document.getElementById("confirm-password");
const confirmPasswordError = document.getElementById("confirm-password-error");
const creditLimitInput = document.getElementById("credit-limit");
const creditLimitError = document.getElementById("credit-limit-error");
const birthDateInput = document.getElementById("birth-date");
const birthDateError = document.getElementById("birth-date-error");
const countryInput = document.getElementById("country");
const countryError = document.getElementById("country-error");
const genderInput = document.getElementsByName("gender");
const genderError = document.getElementById("gender-error");

function getGender() {
    let genderValue;
    for (let i = 0; i < genderInput.length; i++) {
      if (genderInput[i].checked) {
        genderValue = genderInput[i].value;
        break;
      }
    }
    return genderValue;
}


function validateFirstName(){
    const firstNameValue = firstNameInput.value;
    if(firstNameValue.length !== 0){
        firstNameError.innerHTML = "";
        return true;
    }
    else{
        firstNameError.innerHTML = "First name is required";
        return false;
    }
}

function validateLastName(){
    const lastNameValue = lastNameInput.value;
    if(lastNameValue.length !== 0){
        lastNameError.innerHTML = "";
        return true;
    }
    else{
        lastNameError.innerHTML = "First name is required";
        return false;
    }
}
function validateCreditLimit(){
    const creditLimitValue = creditLimitInput.value;
    if(creditLimitValue.length !== 0 ){
        creditLimitError.innerHTML = "";
        return true;
    }
    else{
        creditLimitError.innerHTML = "Credit is required";
        return false;
    }
}

async function validateUsername() {
    const username = usernameInput.value;
    const url = "/fusion/validate/username";
    const requestBody =  {
        username: username,
    };
    const options = {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(requestBody)
    };
    try {
        const response = await fetch(url, options);
        if (response.ok) {
            const data = await response.json();
            usernameError.innerHTML = data.message;
            return data.status == "valid";
        } else {
            throw new Error("Request failed.");
        }
    } catch (error) {
        console.error(error);
        return false;
    }
}
async function validateEmail() {
    const emailValue = emailInput.value;
    const url = "/fusion/validate/email";
    const requestBody =  {
        email: emailValue,
    };
    const options = {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(requestBody)
    };
    try {
        const response = await fetch(url, options);
        if (response.ok) {
            const data = await response.json();
            emailError.innerHTML = data.message;
            return data.status == "valid";
        } else {
            throw new Error("Request failed.");
        }
    } catch (error) {
        console.error(error);
        return false;
    }
}


async function validatePhoneNumber() {
    const phoneNumberValue = phoneNumberInput.value;
    const url = "/fusion/validate/phonenumber";
    const requestBody =  {
        phoneNumber: phoneNumberValue,
    };
    const options = {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(requestBody)
    };
    try {
        const response = await fetch(url, options);
        if (response.ok) {
            const data = await response.json();
            phoneNumberError.innerHTML = data.message;
            return data.status == "valid";
        } else {
            throw new Error("Request failed.");
        }
    } catch (error) {
        console.error(error);
        return false;
    }
}
function validatePassword(){
    const passwordValue = passwordInput.value;
    const regex = /(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}/;
    if(regex.test(passwordValue)){
        passwordError.innerHTML = "";
        return true;
    }
    else{
        passwordError.innerHTML = "Password must be atleast 8 letters";
        return false;
    }
}

function validateConfirmPassword(){
    const confirmPasswordValue = confirmPasswordInput.value;
    if(confirmPasswordValue == passwordInput.value){
        confirmPasswordError.innerHTML = "";
        return true;
    }
    else{
        confirmPasswordError.innerHTML = "Passwords must match";
        return false;
    }
}

function validateCountry(){
    const countryValue = countryInput.value;
    if(countryValue != "country"){
        countryError.innerHTML = "";
        return true;
    }
    else{
        countryError.innerHTML = "Country is required";
        return false;
    }
}

function isDateInFuture(dateString) {
    const date = new Date(dateString);
    const now = new Date();
    if (date > now) {
        return true; 
    }
    return false;
}
  
function validateBirthDate() {
    if (!isDateInFuture(birthDateInput.value)) {
        birthDateError.innerHTML = "";
        return true;
    } else {
        birthDateError.innerHTML = "Invalid birth date";
        return false;
    }
}

function validateGender() {
    const gender = getGender();
    console.log(gender);
    if(gender != undefined){
        genderError.innerHTML = "";
        return true 
    }
    genderError.innerHTML = "Gender is required";
    return false;
}

async function signUp(){
    let isEmailValid = await validateEmail();
    let isPhoneNumberValid = await validatePhoneNumber();
    let isUsernameValid = await validateUsername();
    if(validateFirstName() & validateLastName() & isUsernameValid & validateCreditLimit()
        & isEmailValid & validatePassword() & validateConfirmPassword()
        & validateBirthDate() & validateCountry() & isPhoneNumberValid & validateGender()){

            
            const url = "/fusion/register";

            const requestBody =  {
                                    firstName: firstNameInput.value,
                                    lastName: lastNameInput.value,
                                    username: usernameInput.value,
                                    email: emailInput.value,
                                    phoneNumber: phoneNumberInput.value,
                                    gender: getGender(),
                                    password: passwordInput.value,
                                    creditLimit: creditLimitInput.value,
                                    country: countryInput.value,
                                    birthDate: birthDateInput.value
                                };
            
                const options = {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json"
                    },
                    body: JSON.stringify(requestBody)
                };
            
            
                fetch(url, options)
                    .then(response => {
                        if (response.ok) {
                            console.log(response);
                            return response.json();
                        } else {
                            throw new Error("Request failed.");
                        }
                    })
                    .then(data => {
                        console.log(data);
                        window.location.href = "login";
                    })
                    .catch(error => {
                        console.error(error);
                    });

    }
}

birthDateInput.addEventListener("change", validateBirthDate);
countryInput.addEventListener("change", validateCountry);
firstNameInput.addEventListener("blur", validateFirstName);
lastNameInput.addEventListener("blur", validateLastName);
emailInput.addEventListener("blur", validateEmail);
usernameInput.addEventListener("blur", validateUsername);
passwordInput.addEventListener("blur", validatePassword);
confirmPasswordInput.addEventListener("blur", validateConfirmPassword);
phoneNumberInput.addEventListener("blur", validatePhoneNumber);