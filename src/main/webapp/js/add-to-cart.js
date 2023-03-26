
function addToCart(element,gameId){
    $.post("/fusion/cart",JSON.stringify({gameId:gameId}), sucessAddedToCart(element));
}
function addToCartFromWishList(element,gameId){
    $.post("/fusion/cart",JSON.stringify({gameId:gameId}), sucessAdded(element));
}
function addToCartFromWishList(element,gameId){
    $.post("/fusion/cart",JSON.stringify({gameId:gameId}), sucessAdded(element));
}
function addToWishList(element ,gameId){
    console.log(element);
    console.log(element.classList)
    if(!element.classList.contains("heart-checked")){
        $.post("/fusion/user/add-to-wish-list",JSON.stringify({gameId:gameId}), sucessAddedToWishList(element));
    }
    else{
        //$.delete("/fusion/user/add-to-wish-list",JSON.stringify({gameId:gameId}), sucessDeletedFromWishList(element));
        $.ajax({
            type: "DELETE", //we are using GET method to get data from server side
            url: '/fusion/user/add-to-wish-list', // get the route value
            data: JSON.stringify({gameId:gameId}), //set data
            success: sucessDeletedFromWishList(element)
        });
       
    }

    
}
function deleteFromWishList(gameId){
    $.ajax({
        type: "DELETE", //we are using GET method to get data from server side
        url: '/fusion/user/add-to-wish-list', // get the route value
        data: JSON.stringify({gameId:gameId}), //set data
        success: deletedFromWishList(gameId)
    });
}
function sucessAddedToCart(element){

    console.log("success");
    console.log(element.getAttribute("id"));
    element.removeAttribute("onclick");
    element.innerText = "View In Cart";
    element.classList.add("btn-black");
    element.setAttribute("onclick","viewInCart()");
    // btn.ariaDisabled;
}
function sucessAdded(element){
    console.log("success");
    element.removeAttribute("onclick");
    element.classList.add("text-gold");
    element.setAttribute("onclick","viewInCart()");
    // btn.ariaDisabled;
}

function sucessAddedToWishList(element){
    element.classList.add("heart-checked");
    element.classList.add("border-gold");
    element.querySelector("i").classList.add("text-gold");
    element.querySelector("i").classList.remove("text-white");
   
}
function sucessDeletedFromWishList(element){
    element.classList.remove("border-gold");
    element.classList.remove("heart-checked");
    element.querySelector("i").classList.remove("text-gold");
    element.querySelector("i").classList.add("text-white");
}
function buyNowGame(gameId){
    console.log(gameId);
    $.post("/fusion/cart",JSON.stringify({gameId:gameId}),viewInCart);
    }
function viewInCart(){
        window.location.href="cart";
}
function deletedFromWishList(gameId){
    document.getElementById(gameId).remove();
}