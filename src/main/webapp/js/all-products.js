var genres = [];
var discounts = [];
var platforms = [];
var minPrice = document.getElementById("min-price").value;
var maxPrice = document.getElementById("max-price").value;
var user = null;
var userCartGames = null;
var userWishGames = null;
if( document.getElementById("user")){
    user = document.getElementById("user").value;
    userCartGamesStr = (document.getElementById("user-cart-games").value);
    userWishGamesStr = (document.getElementById("user-wish-games").value);
    userCartGames = userCartGamesStr.substring(1, userCartGamesStr.length-1).split(", ");
    userWishGames = userWishGamesStr.substring(1, userWishGamesStr.length-1).split(", ");
    console.log(typeof(userCartGames));
    console.log(user);
    console.log(userCartGames);
    console.log(userWishGames);
}


filterGenre();
filterDiscount();
filterPlatform();
filterPrice();
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
                var newGridGames = `<div class="col-lg-4 col-md-6 col-sm-6">
              <div class="card my-3 shadow-0 bg-black border ">
                <a href="product?name=${game.name}">
                  <img src="images/hellblade.jpg" class="card-img-top" style="aspect-ratio: 3 / 2">
                  <div class="card-body p-0 pt-2">
                    <p class="text-gold mx-3 mb-2"> BASE GAME</p>
                    <h5 class="card-title text-white mx-3">${game.name}</h5>
                    <div class="d-flex justify-content-start align-items-start h-100 mx-2 mt-3">
                    ${game.discount == 100 ? `<p class="text-white mx-3">Free Game</p>` : 
                      (game.discount != null ? 
                        `<h6><span class="badge bg-success mx-2 pt-2">-${game.discount}%</span>
                        </h6><p class="text-muted mx-3"><del>&dollar;${game.price}</del>
                        </p><p class="text-white mx-3">&dollar;${game.netPrice}</p>` : 
                        `<p class="text-white mx-3">&dollar;${game.price} </p>`)}
                  </div>
                  </div >
                </a >
                <div class="card-footer px-2">
                ${
                  user != null ?
                   (userCartGames.includes(game.id)? `
                        <a onclick='sucessAddedToCart(this)' id="add-cart"
                          class="card-btn btn btn-gold btn-black float-start w-75 text-cart">View In Cart</a>
                      `:`
                        <a onclick='addToCart(this,"${game.id}")' id="add-cart"
                          class="card-btn btn btn-gold float-start w-75 text-cart">Add to cart</a>
                      `
                    ) 
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
                      <i class="fas fa-heart fa-lg px-1 text-white"></i>
                    </a>
                  `
                }
              </div>
              </div >
            </div > `

                $('#game-grid-container').append(newGridGames);

            });
        });
}

// ${user != null ? `

                    
// <a onclick='addToCart(this,"${game.id}")' id="add-cart" class="card-btn btn btn-gold float-start w-75 text-cart">Add to cart</a>
// <a onclick='addToWishList(this,"${game.id}")' class="btn btn-light border mx-1 px-2 pt-2 float-end icon-hover bg-black shadow-0">
// <i class="fas fa-heart fa-lg px-1 text-white"></i>
// </a>

// ` : `
// <a href="login" class="card-btn btn btn-gold float-start w-75 text-cart">Add to cart</a>
// <a href="login" class="btn btn-light border mx-1 px-2 pt-2 float-end icon-hover bg-black shadow-0">
//  <i class="fas fa-heart fa-lg px-1 text-white"></i></a>`
// }