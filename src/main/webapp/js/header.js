 
var suggestions;
$.post("/fusion/home", function(gameJson) {
  console.log(gameJson); 
  // logs ["item1", "item2", "item3"]
  suggestions = gameJson;
});

const searchInput = document.querySelector(".searchInput");
const input = searchInput.querySelector("input");
const resultBox = document.querySelector(".resultBox");
let linkTag = document.querySelector("a");
let webLink;

// if user press any key and release
input.onkeyup = (e)=>{
    let userData = e.target.value; //user enetered data
    let emptyArray = [];
    if(userData){
        emptyArray = suggestions.filter((data)=>{
            //filtering array value and user characters to lowercase and return only those words which are start with user enetered chars
            return data.toLocaleLowerCase().includes(userData.toLocaleLowerCase()); 
        });
        emptyArray = emptyArray.map((data)=>{
            // passing return data inside li tag
            return data = '<li>'+ data +'</li>';
        });
        if(emptyArray.length > 0) {
            searchInput.classList.add("active"); //show autocomplete box
            showSuggestions(emptyArray);
            let allList = resultBox.querySelectorAll("li");
            for (let i = 0; i < allList.length; i++) {
                //adding onclick attribute in all li tag
                allList[i].setAttribute("onclick", "select(this)");
            }
        } else {
            searchInput.classList.remove("active"); //hide autocomplete box
        }
    } else {
        searchInput.classList.remove("active"); //hide autocomplete box
    }
}

function select(game){
  window.location.href="/fusion/product?name="+game.innerText;
  console.log(game.innerText);
}

function showSuggestions(list){
    let listData;
    if(!list.length){
        userValue = input.value;
        listData = '<li>'+ userValue +'</li>';
    }else{
        listData = list.join('');
    }
    resultBox.innerHTML = listData;
}
