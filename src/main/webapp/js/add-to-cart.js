
function addToCart(gameId){
    $.post("/fusion/user/add-to-cart",JSON.stringify({gameId:gameId}), sucessAddedToCart);
}
function addToWishList(gameId){
    $.post("/fusion/user/add-to-wish-list",JSON.stringify({gameId:gameId}), sucessAddedToWishList);
}
function sucessAddedToCart(){
    console.log("success")
    var btn = document.querySelector(".add-to-cart");
    btn.removeAttribute("onclick")
    btn.setAttribute("onclick","viewInCart()")
    // btn.ariaDisabled;
}
function viewInCart(){
    window.location.href="/fusion/user/cart";

}