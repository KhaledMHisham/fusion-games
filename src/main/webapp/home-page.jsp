<%@taglib prefix="c" uri="jakarta.tags.core" %>
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <meta charset="UTF-8">
      <title>Fusion</title>
      <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
      <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
      <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.css" rel="stylesheet" />
      <link href="css/home-page.css" rel="stylesheet" />
      <link href="css/header.css" rel="stylesheet" />
      <link href="css/add-to-cart.css" rel="stylesheet" />
      <link rel="shortcut icon" href="images/phoenix.png" type="image/x-icon" />

    </head>

    <body class="bg-black">

      <!--Main Navigation-->
      <jsp:include page="header.jsp" />

      <!-- <div class="page-offset"></div> c-->
      <!--  intro  -->

      <!-- intro -->
      <!-- Right elements -->
      <main>
        <div>

        </div>

        <div id="carouselExampleCaptions" class=" carousel slide carousel-fade" data-mdb-ride="carousel">
          <header class="mb-4">
            <h3 class="text-gold mx-4">New Releases</h3>
          </header>

          <div class="carousel-indicators">
            <button type="button" data-mdb-target="#carouselExampleCaptions" data-mdb-slide-to="0" class="active"
              aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-mdb-target="#carouselExampleCaptions" data-mdb-slide-to="1"
              aria-label="Slide 2"></button>
            <button type="button" data-mdb-target="#carouselExampleCaptions" data-mdb-slide-to="2"
              aria-label="Slide 3"></button>
            <button type="button" data-mdb-target="#carouselExampleCaptions" data-mdb-slide-to="3"
              aria-label="Slide 4"></button>
          </div>
          <div class=" carousel-inner">
            <c:forEach items="${newReleases}" var="game">
              <div class="carousel-item active">
                <img src="${game.pictureUrl}" class="d-block w-100" alt="Wild Landscape" />
                <div class="mask" style="background-color: rgba(0, 0, 0, 0.4)"></div>
                <div class="carousel-caption d-none d-sm-block mb-5">
                  <h1 class="mb-4">
                    <strong>${game.name}</strong>
                  </h1>
                  <p>
                    <strong>${game.description}</strong>
                  </p>
                  <p class="mb-4 d-none d-md-block">
                    <!-- <strong>The most comprehensive tutorial for the Bootstrap 5. Loved by over 3 000 000 users. Video and
                  written versions
                  available. Create your own, stunning website.</strong> -->
                  </p>

                  <a target="_blank" href="all-products" class="btn btn-outline-white btn-lg">Browse
                    <i class="fas fa-graduation-cap ms-2"></i>
                  </a>
                </div>
              </div>
            </c:forEach>

          </div>
          <button class="carousel-control-prev" type="button" data-mdb-target="#carouselExampleCaptions"
            data-mdb-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
          </button>
          <button class="carousel-control-next" type="button" data-mdb-target="#carouselExampleCaptions"
            data-mdb-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
          </button>
        </div>
        <div class="container">
          <div class="row justify-content-around mx-2 my-5">
            <header class="mb-4">
              <c:if test="${user ne null}">
                <h3 class="text-gold">Just For You</h3>
              </c:if>

            </header>

            <div class="position-relative col-lg-7 col-md-12 col-sm-12">
              <div id="card-banner" class="d-flex rounded-5 align-items-end card-banner bg-gray ">
                <img src="${recomndedGames[0].pictureUrl}" width="100%" height="600px" class="card-img-top ">
              </div>
              <div id="card-banner-desc" class="card-banner-desc position-absolute m-4" style="max-width: 60%;">
                <!-- <h3 class="text-white">Best products &amp; brands in our store at 80% off</h3> -->
                <h3 id="game-name">${recomndedGames[0].name}</h3>
                <div class="d-flex justify-content-start align-items-start h-100 m-2">
                  <h6> starting at </h6>
                  <h5 class="text-muted mx-3"> <del id="game-price">&dollar;${recomndedGames[0].price.intValue()}</del></h5>
                  <h5 id="game-net-price" class="text-white mx-3"> &dollar;${recomndedGames[0].getNetPrice().intValue()}</h5>
                </div>
                <c:choose>
                  <c:when test="${user ne null}">
                    <a onclick='buyNowGameBanner()' href="cart" class="btn btn-warning shadow-0 relative-bottom "> Buy
                      Now </a>
                    <a onclick='addToCartGameBanner(this)' class="btn btn-dark hover-zoom shadow-0 "> Add to cart </a>
                    <input hidden type="text" value="${recomndedGames[0].id}" id="bannerGameId">
                  </c:when>
                  <c:otherwise>
                    <a class="btn btn-warning shadow-0 relative-bottom " href="login"> Buy Now </a>
                    <a class="btn btn-dark hover-zoom shadow-0 " href="login"> Add to cart </a>
                  </c:otherwise>
                </c:choose>
              </div>
            </div>
            <span style="width: 0px; "></span>
            <section class="mx-3 col-xl-4 col-lg-4 col-md-12 col-sm-12">
              <div class="list-group">
                <c:forEach items="${recomndedGames}" var="game">
                  <div id="game1"
                    onclick='onClickGame(this,"${game.name}","${game.price}","${game.discount.getType().getDiscount()}","${game.id}")'
                    class="col-xl-10 col-lg-10 col-md-8 col-sm-10 mb-2">
                    <div class="card card-list shadow-0 bg-black hover-shadow-soft">
                      <div class="card-body">
                        <div class="d-flex align-items-center">
                          <img id="img-src" src="${game.pictureUrl}" alt="" style="width:120px; height:100px"
                            class="fa-square " />
                          <div class="ms-3">
                            <p id="clicked-game-name" class="fw-bold mb-1">${game.name}</p>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </c:forEach>
              </div>
            </section>
          </div>
        </div>


        <div class="container my-5">
          <div class="d-flex flex-row justify-content-between align-items-center mb-3">
            <h3 class="text-gold ">Most Popular</h3>
            <c:if test="${fn:length(mostPurchased) > 3}">
              <div class="row arrows-BestSellerList">
                <div class="arrow mx-2 arrow-left-BestSellerList">
                  <i class="fas fa-chevron-left"></i>
                </div>
                <div class="arrow arrow-right-BestSellerList">
                  <i class="fas fa-chevron-right"></i>
                </div>
              </div>
            </c:if>
          <c:if test="${fn:length(mostPurchased) <= 3}">
          <div class="d-none d-md-block d-sm-block d-lg-none">
            <div class="row arrows-BestSellerList">
              <div class="arrow mx-2 arrow-left-BestSellerList">
                <i class="fas fa-chevron-left"></i>
              </div>
              <div class="arrow arrow-right-BestSellerList">
                <i class="fas fa-chevron-right"></i>
              </div>
            </div>
          </div>
        </c:if>
        </div>
          <div class="d-flex flex-row flex-nowrap  overflow-hidden collapsible-scrollspy-BestSellerList "
            style="position: relative;">
            <c:forEach items="${mostPurchased}" var="game">
              <div class="m-2 col-lg-3 col-md-6 col-sm-6">
                <div class="card my-2 shadow-0 bg-black border">
                  <a href="product?name=${game.name}" class="">
                    <img src="${game.pictureUrl}" class="card-img-top" style="aspect-ratio: 3 / 2">
                    <div class="card-body p-0 pt-2">
                      <p class="text-gold mx-3 mb-2"> BASE GAME</p>
                      <h5 class="card-title text-white mx-3 box">${game.name}</h5>
                      <div class="d-flex justify-content-start align-items-start h-100 mx-2 mt-3">
                        <c:choose>
                          <c:when test="${game.discount.getType().getDiscount()==100}">
                            <h5 class="text-white mx-3">Free Game</h5>
                          </c:when>
                          <c:when test="${not empty game.getDiscount()}">
                            <h6><span
                                class="badge bg-success mx-2 pt-2">-${game.discount.getType().getDiscount()}%</span>
                            </h6>
                            <h5 class="text-muted mx-3"> <del>&dollar;${game.price.intValue()}</del></h5>
                            <h4 class="text-white mx-3"> &dollar;${game.getNetPrice().intValue()}</h4>
                          </c:when>
                          <c:otherwise>
                            <h4 class="text-white mx-3">&dollar;${game.price.intValue()}</h4>
                          </c:otherwise>
                        </c:choose>

                      </div>
                    </div>
                  </a>
                  <div class="card-footer px-2">
                    <c:choose>
                      <c:when test="${user ne null}">
                        <c:choose>
                          <c:when test="${user.getCartGames().contains(game)}">
                            <a onclick='sucessAddedToCart(this)' id="add-cart"
                              class="card-btn btn btn-black btn-gold float-start w-75 text-cart">View In Cart</a>
                          </c:when>
                          <c:when test="${user.getOwnedGames().contains(game)}">
                            <a href="library-page"
                              class="card-btn btn btn-gold btn-black float-start w-75 text-cart">Owned</a>
                          </c:when>
                          <c:otherwise>
                            <a onclick='addToCart(this,"${game.id}")' id="add-cart"
                              class="card-btn btn btn-gold float-start w-75 text-cart">Add to cart</a>
                          </c:otherwise>
                        </c:choose>
                        <c:choose>
                          <c:when test="${user.getWishList().contains(game)}">
                            <a onclick='addToWishList(this,"${game.id}")'
                              class="heart-checked btn btn-light border border-gold mx-1 px-2 pt-2 float-end icon-hover bg-black shadow-0">
                              <i class="fas fa-heart fa-lg px-1 text-gold"></i></a>
                          </c:when>
                          <c:otherwise>
                            <a onclick='addToWishList(this,"${game.id}")'
                              class="btn btn-light border mx-1 px-2 pt-2 float-end icon-hover bg-black shadow-0">
                              <i class="fas fa-heart fa-lg px-1 text-white"></i></a>
                          </c:otherwise>
                        </c:choose>
                      </c:when>
                      <c:otherwise>
                        <a href="login" class="card-btn btn btn-gold float-start w-75 text-cart">Add to cart</a>
                        <a href="login"
                          class="btn btn-light border mx-1 px-2 pt-2 float-end icon-hover bg-black shadow-0">
                          <i class="fas fa-heart fa-lg px-1 text-white"></i></a>
                      </c:otherwise>
                    </c:choose>
                  </div>

                </div>
              </div>
            </c:forEach>
          </div>
        </div>
        </div>

        <section>
          <div class="container my-5">
            <header class="mb-4">
              <h3 class="text-gold">On Store</h3>
            </header>
            <div class="row">
              <c:forEach items="${weHave}" var="game">
                <div class="col-lg-4 col-xl-4 col-md-6 col-sm-6">
                  <div class="card my-3 shadow-0 bg-black border ">
                    <a href="product?name=${game.name}">
                      <img src="${game.pictureUrl}" class="card-img-top" style="aspect-ratio: 3 / 2">
                      <div class="card-body p-0 pt-2">
                        <p class="text-gold mx-3 mb-2">Base Game</p>
                        <h5 class="card-title text-white mx-3 box">${game.name}</h5>
                        <div class="d-flex justify-content-end align-items-start h-100 m-2">
                          <h5 class=" text-gold mx-3">&dollar;${game.price.intValue()}</h5>
                        </div>
                      </div>
                    </a>
                    <div class="card-footer px-2">
                      <c:choose>
                        <c:when test="${user ne null}">
                          <c:choose>
                            <c:when test="${user.getCartGames().contains(game)}">
                              <a onclick='sucessAddedToCart(this)' id="add-cart"
                                class="card-btn btn btn-gold btn-black float-start w-75 text-cart">View In Cart</a>
                            </c:when>
                            <c:when test="${user.getOwnedGames().contains(game)}">
                              <a href="library-page"
                                class="card-btn btn btn-gold btn-black float-start w-75 text-cart">Owned</a>
                            </c:when>
                            <c:otherwise>
                              <a onclick='addToCart(this,"${game.id}")' id="add-cart"
                                class="card-btn btn btn-gold float-start w-75 text-cart">Add to cart</a>
                            </c:otherwise>
                          </c:choose>
                          <c:choose>
                            <c:when test="${user.getWishList().contains(game)}">
                              <a onclick='addToWishList(this,"${game.id}")'
                                class="heart-checked btn btn-light border border-gold mx-1 px-2 pt-2 float-end icon-hover bg-black shadow-0">
                                <i class="fas fa-heart fa-lg px-1 text-gold"></i></a>
                            </c:when>
                            <c:otherwise>
                              <a onclick='addToWishList(this,"${game.id}")'
                                class="btn btn-light border mx-1 px-2 pt-2 float-end icon-hover bg-black shadow-0">
                                <i class="fas fa-heart fa-lg px-1 text-white"></i></a>
                            </c:otherwise>
                          </c:choose>
                        </c:when>
                        <c:otherwise>
                          <a href="login" class="card-btn btn btn-gold float-start w-75 text-cart">Add to cart</a>
                          <a href="login"
                            class="btn btn-light border mx-1 px-2 pt-2 float-end icon-hover bg-black shadow-0">
                            <i class="fas fa-heart fa-lg px-1 text-white"></i></a>
                        </c:otherwise>
                      </c:choose>
                    </div>
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>
        </section>
        <!-- Products -->

        <!-- Feature -->
        <section class="">
          <div class="container">
            <header class="mb-4">
              <h3 class="text-gold">Free Games</h3>
            </header>
            <div class="row">
              <c:forEach items="${freeGames}" var="game">
                <div class="row col-xl-6 col-md-12 col-sm-12 col-lg-6 position-relative gy-4">
                  <a href="product?name=${game.name}">
                    <div class="card d-flex rounded-5 align-items-end card-banner bg-gray h-100">
                      <img src="${game.pictureUrl}" class="card-img-top " style="aspect-ratio: 3 / 2">
                    </div>
                    <div class=" position-absolute banner-desc m-4" style="max-width: 60%;">
                      <h3 class="text-white">100% off</h3>
                      <h5 class="text-white">${game.name}</h5>
                      <c:choose>
                        <c:when test="${user ne null}">
                          <c:choose>
                            <c:when test="${user.getCartGames().contains(game)}">
                              <a href="cart"
                            class="btn btn-warning shadow-0 relative-bottom "> Buy Now </a>
                              <a href="cart"
                                class="btn btn-dark btn-black hover-zoom shadow-0 ">View In Cart</a>
                            </c:when>
                            <c:when test="${user.getOwnedGames().contains(game)}">
                              <a href="library-page"
                                      class="btn btn-dark btn-black hover-zoom shadow-0 w-75">Owned</a>
                            </c:when>
                            <c:otherwise>
                              <a onclick='addToCart(this,"${game.id}")' href="cart"
                            class="btn btn-warning shadow-0 relative-bottom "> Buy Now </a>
                              <a onclick='addToCart(this,"${game.id}")' class="btn btn-dark hover-zoom shadow-0 "> Add
                                to cart </a>
                            </c:otherwise>
                          </c:choose>
                        </c:when>
                        <c:otherwise>
                          <a class="btn btn-warning shadow-0 relative-bottom " href="login"> Buy Now </a>
                          <a class="btn btn-dark hover-zoom shadow-0 " href="login"> Add to cart </a>
                        </c:otherwise>
                      </c:choose>
                    </div>
                  </a>
            </div>
            </c:forEach>
          </div>

            <!-- col.// -->
          </div>
          <!-- row.// -->
          </div>
          <!-- container end.// -->
        </section>
        <!-- Feature -->

        <div class="container my-5">

          <div class="d-flex flex-row justify-content-between align-items-center mb-3">
            <h3 class="text-gold ">Products on sale</h3>
            <c:if test="${fn:length(gamesOnSale) > 3}">
              <div class="row arrows">
                <div class="arrow arrow-left">
                  <i class="fas fa-chevron-left"></i>
                </div>
                <div class="arrow arrow-right">
                  <i class="fas fa-chevron-right"></i>
                </div>
              </div>
            </c:if>
          <c:if test="${fn:length(gamesOnSale) <= 3}">
          <div class="d-none d-sm-block d-md-block d-lg-none">
            <div class="row arrows">
              <div class="arrow arrow-left">
                <i class="fas fa-chevron-left"></i>
              </div>
              <div class="arrow arrow-right">
                <i class="fas fa-chevron-right"></i>
              </div>
            </div>
          </div>
        </c:if>
        </div>
          <div class="d-flex flex-row flex-nowrap  overflow-hidden collapsible-scrollspy " style="position: relative;">
            <c:forEach items="${gamesOnSale}" var="game">
              <div class="m-2 col-lg-3 col-md-6 col-sm-6">
                <div class="card my-2 shadow-0 bg-black border">
                  <a href="product?name=${game.name}" class="">
                    <img src="${game.pictureUrl}" class="card-img-top" style="aspect-ratio: 3 / 2">
                    <div class="card-body p-0 pt-2">
                      <p class="text-gold mx-3 mb-2"> BASE GAME</p>
                      <h5 class="card-title text-white mx-3 box">${game.name}</h5>
                      <div class="d-flex justify-content-start align-items-start h-100 mx-2 mt-3">
                        <h6><span class="badge bg-success mx-2 pt-2">-${game.discount.getType().getDiscount()}%</span>
                        </h6>
                        <h5 class="text-muted mx-3"> <del>&dollar;${game.price.intValue()}</del></h5>
                        <h4 class="text-white mx-3"> &dollar;${game.getNetPrice().intValue()} </h4>
                      </div>
                    </div>
                  </a>
                  <div class="card-footer px-2">
                    <c:choose>
                      <c:when test="${user ne null}">
                        <c:choose>
                          <c:when test="${user.getCartGames().contains(game)}">
                            <a onclick='sucessAddedToCart(this)' id="add-cart"
                              class="card-btn btn btn-gold btn-black float-start w-75 text-cart">View In Cart</a>
                          </c:when>
                          <c:when test="${user.getOwnedGames().contains(game)}">
                            <a href="library-page"
                              class="card-btn btn btn-gold btn-black float-start w-75 text-cart">Owned</a>
                          </c:when>
                          <c:otherwise>
                            <a onclick='addToCart(this,"${game.id}")' id="add-cart"
                              class="card-btn btn btn-gold float-start w-75 text-cart">Add to cart</a>
                          </c:otherwise>
                        </c:choose>
                        <c:choose>
                          <c:when test="${user.getWishList().contains(game)}">
                            <a onclick='addToWishList(this,"${game.id}")'
                              class="heart-checked btn btn-light border border-gold mx-1 px-2 pt-2 float-end icon-hover bg-black shadow-0">
                              <i class="fas fa-heart fa-lg px-1 text-gold"></i></a>
                          </c:when>
                          <c:otherwise>
                            <a onclick='addToWishList(this,"${game.id}")'
                              class="btn btn-light border mx-1 px-2 pt-2 float-end icon-hover bg-black shadow-0">
                              <i class="fas fa-heart fa-lg px-1 text-white"></i></a>
                          </c:otherwise>
                        </c:choose>
                      </c:when>
                      <c:otherwise>
                        <a href="login" class="card-btn btn btn-gold float-start w-75 text-cart">Add to cart</a>
                        <a href="login"
                          class="btn btn-light border mx-1 px-2 pt-2 float-end icon-hover bg-black shadow-0">
                          <i class="fas fa-heart fa-lg px-1 text-white"></i></a>
                      </c:otherwise>
                    </c:choose>
                  </div>

                </div>
              </div>
            </c:forEach>
          </div>
        </div>
        </div>
      </main>

      <!-- Footer -->
      <jsp:include page="footer.jsp" />

      <!-- Footer -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/solid.min.js"></script>
      <script type="text/javascript" src="js/home-page.js"></script>
      <script type="text/javascript" src="js/header.js"></script>
      <script type="text/javascript" src="js/add-to-cart.js"></script>

    </body>

    </html>