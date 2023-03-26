// const searchInput = document.getElementById('search-input');
// const searchLabel = document.getElementById('search-label');

// searchInput.addEventListener('focus', function() {
//   searchLabel.classList.add("search-label");
// });

// searchInput.addEventListener('blur', function() {
//   searchLabel.classList.remove("search-label");
// });



const scrollContainer = document.querySelector('.collapsible-scrollspy');
const scrollArrows = document.querySelector('.arrows');
const scrollStep = 1100;
if(scrollArrows!=null){
document.querySelector('.arrow-left').addEventListener('click', () => {
  scrollContainer.scrollBy({
    left: -scrollStep,
    behavior: 'smooth'
  });
});

document.querySelector('.arrow-right').addEventListener('click', () => {
  scrollContainer.scrollBy({
    left: scrollStep,
    behavior: 'smooth'
  });
});
}

const scrollContainerBest = document.querySelector('.collapsible-scrollspy-BestSellerList');
const scrollArrowsBest = document.querySelector('.arrows-BestSellerList');
if(scrollArrowsBest!=null){
document.querySelector('.arrow-left-BestSellerList').addEventListener('click', () => {
  scrollContainerBest.scrollBy({
    left: -scrollStep,
    behavior: 'smooth'
  });
});

document.querySelector('.arrow-right-BestSellerList').addEventListener('click', () => {
  scrollContainerBest.scrollBy({
    left: scrollStep,
    behavior: 'smooth'
  });
});
}


//function onClickGameCard
const params = new URLSearchParams(window.location.search);
console.log(params);
var gameBannerId=document.getElementById("bannerGameId").value;
 function onClickGame(th,gameName,gamePrice,gameDiscount,gameId){
  
   //var text = th.firstChild.firstChild.childNodes.img.getAttribute('src');
   //document.getElementById("card-banner").style.backgroundImage = "url(images/hellblade.jpg)";
   var gameImgSrc = th.querySelector("#img-src").getAttribute('src');
  //  var gameName =th.querySelector("#clicked-game-name").innerText;
  //  var gamePrice = th.querySelector("#clicked-game-price").innerText;
  //  var gameNetPrice = th.querySelector("#clicked-game-net-price").innerText;
   console.log(gameName);
   document.getElementById("card-banner").style.backgroundImage = "url("+gameImgSrc+")";
   document.getElementById("game-name").innerText = gameName;
   document.getElementById("game-price").innerText = "$"+gamePrice;
   document.getElementById("game-net-price").innerText = "$"+(gamePrice - (gameDiscount/100));
   gameBannerId = gameId;
 }
 function buyNowGameBanner(){
 if(gameBannerId!=null)
    $.post("/fusion/cart",JSON.stringify({gameId:gameBannerId}),viewInCart);

 }
 
function addToCartGameBanner(element){
 if(gameBannerId!=null)
    $.post("/fusion/cart",JSON.stringify({gameId:gameBannerId}),sucessAddedToCart(element));

 }
 function sucessAddedToCart(element){
     console.log("success");
     console.log(element.getAttribute("id"));
     element.removeAttribute("onclick");
     element.innerText = "View In Cart";
     element.setAttribute("onclick","viewInCart()");
     // btn.ariaDisabled;
 }
function viewInCart(){
    window.location.href="cart";
}