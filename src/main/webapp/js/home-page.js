// const searchInput = document.getElementById('search-input');
// const searchLabel = document.getElementById('search-label');

// searchInput.addEventListener('focus', function() {
//   searchLabel.classList.add("search-label");
// });

// searchInput.addEventListener('blur', function() {
//   searchLabel.classList.remove("search-label");
// });
const scrollContainer = document.querySelector('.collapsible-scrollspy');
const scrollStep = 600;

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

//function onClickGameCard

 function onClickGame(th){
   //var text = th.firstChild.firstChild.childNodes.img.getAttribute('src');
   //document.getElementById("card-banner").style.backgroundImage = "url(images/hellblade.jpg)";
   var gameImgSrc = th.children[0].children[0].children[0].children[0].getAttribute('src');
   var gameName = th.children[0].children[0].children[0].children[1].innerText;
   console.log(gameName);
   document.getElementById("card-banner").style.backgroundImage = "url("+gameImgSrc+")";
   document.getElementById("game-name").innerText = gameName;
 }

