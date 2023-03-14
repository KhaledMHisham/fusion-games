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
const scrollStep = 600;
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
//function onClickGameCard

 function onClickGame(th,gameName,gamePrice,gameDiscount){
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
 }
