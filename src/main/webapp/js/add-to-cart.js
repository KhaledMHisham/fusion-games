
function addToCart(element,gameId){
    $.post("/fusion/user/add-to-cart",JSON.stringify({gameId:gameId}), sucessAddedToCart(element));
}
function addToWishList(element ,gameId){
    $.post("/fusion/user/add-to-wish-list",JSON.stringify({gameId:gameId}), sucessAddedToWishList(element));
}
function sucessAddedToCart(element){
    console.log("success");
    console.log(element.getAttribute("id"));
    element.removeAttribute("onclick");
    element.innerText = "View In Cart";
    element.classList.add("view-in-cart");
    element.setAttribute("onclick","viewInCart()");
    // btn.ariaDisabled;
}
function viewInCart(){
    window.location.href="cart.jsp";

}
function sucessAddedToWishList(){
    element.setAttribute("checked");
}