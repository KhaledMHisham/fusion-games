pagination();
var genres = ["Action","Adventure","Role-playing","Strategy","Sports","Simulation","Puzzle","Horror",
              "Fighting","Racing","Shooter","MMO","Stealth","Survival"];
var discounts = ["15","50","85","100"];
var platforms = ["Windows","Linux","Mac OS","XBOX"];

var minPrice = document.getElementById("min-price").value;
var maxPrice = document.getElementById("max-price").value;
var user = null;
var userCartGames = null;
var userWishGames = null;
var userLibraryGames = null;

if( document.getElementById("user")){
    user = document.getElementById("user").value;
    userCartGamesStr = (document.getElementById("user-cart-games").value);
    userWishGamesStr = (document.getElementById("user-wish-games").value);
    userLibraryGamesStr = (document.getElementById("user-library-games").value);
    userCartGames = userCartGamesStr.substring(1, userCartGamesStr.length-1).split(", ");
    userWishGames = userWishGamesStr.substring(1, userWishGamesStr.length-1).split(", ");
    userLibraryGames = userLibraryGamesStr.substring(1, userLibraryGamesStr.length-1).split(", ");
    console.log(typeof(userLibraryGames));
    console.log(userLibraryGames);
}


// filterGenre();
// filterDiscount();
// filterPlatform();
// filterPrice();

function filterGenre(element) {
    genres = [];
    minPrice = document.getElementById("min-price").value;
    maxPrice = document.getElementById("max-price").value;
    $.each($("input[name='genre']:checked"), function () {
        genres.push($(this).val());
    });
    console.log($(element).val());
    requestFilterGames(genres, discounts, platforms, maxPrice, minPrice);

}
function filterDiscount(element) {
    discounts = [];
    minPrice = document.getElementById("min-price").value;
    maxPrice = document.getElementById("max-price").value;

    $.each($("input[name='discount']:checked"), function () {
        discounts.push($(this).val());
    });
    console.log($(element).val());
    requestFilterGames(genres, discounts, platforms, maxPrice, minPrice);

}
function filterPlatform(element) {
    platforms = [];
    minPrice = document.getElementById("min-price").value;
    maxPrice = document.getElementById("max-price").value;
    $.each($("input[name='platform']:checked"), function () {
        platforms.push($(this).val());
    });
    console.log($(element).val());
    requestFilterGames(genres, discounts, platforms, maxPrice, minPrice);
}
function filterPrice() {
    minPrice = document.getElementById("min-price").value;
    maxPrice = document.getElementById("max-price").value;
    console.log(maxPrice);
    requestFilterGames(genres, discounts, platforms, maxPrice, minPrice);

}

function requestFilterGames(genres, discounts, platforms, maxPrice, minPrice) {
    $.post("/fusion/user/filter-games",
        JSON.stringify({
            genres: genres,
            discounts: discounts,
            platforms: platforms,
            maxPrice: maxPrice,
            minPrice: minPrice
        }),
        function (filteredGames) {
            console.log(filteredGames);
            $("#game-grid-container").empty();
            $.each(filteredGames, function (index, game) {
                var newGridGames =
                 `
                  <div class="col-lg-4 col-md-6 col-sm-6 item">
                    <div class="card my-3 shadow-0 bg-black border ">
                      <a href="product?name=${game.name}">
                        <img src="${game.pictureUrl}" class="card-img-top" style="aspect-ratio: 3 / 2">
                        <div class="card-body p-0 pt-2">
                        <p class="text-gold mx-3 mb-2"> BASE GAME</p>
                        <h5 class="card-title text-white mx-3 box">${game.name}</h5>
                        <div class="d-flex justify-content-start align-items-start h-100 mx-2 mt-3">
                          ${game.discount == 100 ? `
                          <p class="text-white mx-3">Free Game</p>` : 
                          (game.discount != null ? 
                          `<h6><span class="badge bg-success mx-2 pt-2">-${game.discount}%</span>
                          </h6><p class="text-muted mx-3"><del>&dollar;${parseInt(game.price)}</del>
                          </p><p class="text-white mx-3">&dollar;${parseInt(game.netPrice)}</p>` : 
                          `<p class="text-white mx-3">&dollar;${parseInt(game.price)} </p>`)}
                        </div>
                      </div >
                      </a >
                    <div class="card-footer px-2">
                      ${user != null ?
                        (userCartGames.includes(game.id)? `
                          <a onclick='sucessAddedToCart(this)' id="add-cart"
                          class="card-btn btn btn-gold btn-black float-start w-75 text-cart">View In Cart</a>
                          `: 
                        (userLibraryGames.includes(game.id)? 
                        ` <a href="library-page" class="card-btn btn btn-gold btn-black float-start w-75 text-cart">Owned</a>
                        `:`
                          <a onclick='addToCart(this,"${game.id}")' id="add-cart"
                          class="card-btn btn btn-gold float-start w-75 text-cart">Add to cart</a>`
                      )) 
                      +
                      (userWishGames.includes(game.id)? `
                      <a onclick='addToWishList(this,"${game.id}")'
                        class="heart-checked btn btn-light border border-gold mx-1 px-2 pt-2 float-end icon-hover bg-black shadow-0">
                        <i class="fas fa-heart fa-lg px-1 text-gold"></i></a>
                      `:`
                          <a onclick='addToWishList(this,"${game.id}")'
                          class="btn btn-light border mx-1 px-2 pt-2 float-end icon-hover bg-black shadow-0">
                          <i class="fas fa-heart fa-lg px-1 text-white"></i></a>
                        </c:otherwise>
                      </c:choose>`
                      )
                      : `
                        <a href="login" class="card-btn btn btn-gold float-start w-75 text-cart">Add to cart</a>
                        <a href="login" class="btn btn-light border mx-1 px-2 pt-2 float-end icon-hover bg-black shadow-0">
                          <i class="fas fa-heart fa-lg px-1 text-white"></i></a> `
                      }
                    </div>
                  </div >
                </div > `

                $('#game-grid-container').append(newGridGames);

            });
            pagination();
        }
        );
}

// function reloadScript() {
//   document.getElementById('pagination-script').remove();
//   var script = document.createElement('script');
//   script.src = 'js/pagination.js';
//   script.setAttribute("id","pagination-script");
//   document.body.appendChild(script);
// }

function pagination() { 
let itemsPerPage = 2; // Number of items to show per page
let itemsContainer = document.getElementById('game-grid-container');
let items = itemsContainer.querySelectorAll('.item');
let paginationContainer = document.getElementById('pagination');
let totalPages = Math.ceil(items.length / itemsPerPage); // Total number of pages

console.log(items.length);
// Function to show items for the specified page
function showPage(pageNumber) {
  let startIndex = (pageNumber - 1) * itemsPerPage;
  let endIndex = startIndex + itemsPerPage;
  items.forEach((item, index) => {
    if (index >= startIndex && index < endIndex) {
      item.style.display = 'block';
    } else {
      item.style.display = 'none';
    }
  });
}

function createPaginationButtons() {
    // "Previous" button
    paginationContainer.innerHTML="";
    const prevButton = document.createElement('li');
    prevButton.classList.add('page-item');
    prevButton.innerHTML = `
      <a class="page-link" href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
        <span class="sr-only">Previous</span>
      </a>
    `;
    prevButton.addEventListener('click', () => {
      if (currentPage > 1) {
        currentPage--;
        const activeButton = paginationContainer.querySelector('.active');
        if (activeButton) {
          activeButton.classList.remove('active');
        }
        paginationContainer.querySelector(`li[data-page="${currentPage}"]`).classList.add('active');
        showPage(currentPage);
      }
      prevButton.blur();
    });
    paginationContainer.appendChild(prevButton);
    
    // Numbered buttons
    for (let i = 1; i <= totalPages; i++) {
      const li = document.createElement('li');
      li.classList.add('page-item');
      li.dataset.page = i;
      if (i === 1) {
        li.classList.add('active');
      }
      li.innerHTML = `
        <a class="page-link" href="#">${i}</a>
      `;
      li.addEventListener('click', () => {
        const activeButton = paginationContainer.querySelector('.active');
        if (activeButton) {
          activeButton.classList.remove('active');
        }
        li.classList.add('active');
        currentPage = parseInt(li.dataset.page);
        showPage(currentPage);
      });
      paginationContainer.appendChild(li);
    }
    
    // "Next" button
    const nextButton = document.createElement('li');
    nextButton.classList.add('page-item');
    nextButton.innerHTML = `
      <a class="page-link" href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
        <span class="sr-only">Next</span>
      </a>
    `;
    nextButton.addEventListener('click', () => {
      if (currentPage < totalPages) {
        currentPage++;
        const activeButton = paginationContainer.querySelector('.active');
        if (activeButton) {
          activeButton.classList.remove('active');
        }
        paginationContainer.querySelector(`li[data-page="${currentPage}"]`).classList.add('active');
        showPage(currentPage);
      }
      nextButton.blur();
    });
    paginationContainer.appendChild(nextButton);
  }
  
showPage(1);
createPaginationButtons();
 }