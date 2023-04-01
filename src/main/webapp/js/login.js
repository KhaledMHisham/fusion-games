const emailInput = document.getElementById("email");
const emailError = document.getElementById("email-error");
const passwordInput = document.getElementById("password");
const passwordError = document.getElementById("password-error");




function validateEmail(){
    const emailValue = emailInput.value;
            const regex = /^[a-zA-Z0-9.!#$%&'\\+/=?^_`{|}~\-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+){1,4}$/;
    if(regex.test(emailValue)){
        emailError.innerHTML = "";
        return true;
    }
    else{
        emailError.innerHTML = "Invalid Email Format";
        return false;
    }
}


function login(){

    if(validateEmail()){

        const url = "/fusion/login";

        const requestBody =  {
            email: emailInput.value,
            password: passwordInput.value
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
                window.location.href = "home";
            })
            .catch(error => {
                console.error(error);
            });

    }
}

emailInput.addEventListener("blur", validateEmail);
