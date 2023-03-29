<%@taglib prefix="c" uri="jakarta.tags.core" %>
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <meta charset="UTF-8">
      <title>Fusion Games</title>
      <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
      <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
      <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.css" rel="stylesheet" />
      <link href="css/home-page.css" rel="stylesheet" />
      <link href="css/products.css" rel="stylesheet" />
      <link href="css/header.css" rel="stylesheet" />
      <link href="css/add-to-cart.css" rel="stylesheet" />
      <link rel="shortcut icon" href="images/phoenix.png" type="image/x-icon" />


    </head>

    <body class="bg-black">
      <c:if test="${user ne null}">
        <input id="user" hidden value="${user}" />
        <input id="user-cart-games" hidden value="${user.getCartGames().stream().map(g -> g.getId()).toList()}" />
        <input id="user-wish-games" hidden value="${user.getWishList().stream().map(g -> g.getId()).toList()}" />
        <input id="user-library-games" hidden value="${user.getOwnedGames().stream().map(g -> g.getId()).toList()}" />
      </c:if>
      <!--Main Navigation-->
      <jsp:include page="header.jsp" />

      <section class="products-container">
        <div class="container text-gold">
          <div class="row">
            <!-- sidebar -->
            <div class="col-lg-3 text-gold">
              <!-- Toggle button -->
              <button class="btn btn-outline-secondary mb-3 w-100 d-lg-none" type="button" data-mdb-toggle="collapse"
                data-mdb-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
                <span>Show filter</span>
              </button>
              <!-- Collapsible wrapper -->
              <div class="collapse d-lg-block bg-black border border-gold mb-5" id="navbarSupportedContent">
                <div class="accordion" id="accordionPanelsStayOpenExample">

                  <div class="accordion-item">
                    <h2 class="accordion-header" id="headingTwo">
                      <button class="accordion-button bg-black text-gold" type="button" data-mdb-toggle="collapse"
                        data-mdb-target="#panelsStayOpen-collapseTwo" aria-expanded="true"
                        aria-controls="panelsStayOpen-collapseTwo">
                        Genre
                      </button>
                    </h2>
                    <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse show"
                      aria-labelledby="headingTwo">
                      <div class="accordion-body">
                        <div>
                          <c:forEach items="${allGenre}" var="genre">
                            <div class="form-check">
                              <input onclick="filterGenre(this)" class="form-check-input" type="checkbox" name="genre"
                                value="${genre.genre.genre}" id="flexCheckChecked1" checked />
                              <label class="form-check-label" for="flexCheckChecked1">${genre.genre.genre}</label>
                            </div>
                          </c:forEach>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="accordion-item">
                    <h2 class="accordion-header" id="headingThree">
                      <button class="accordion-button bg-black text-gold" type="button" data-mdb-toggle="collapse"
                        data-mdb-target="#panelsStayOpen-collapseThree" aria-expanded="false"
                        aria-controls="panelsStayOpen-collapseThree">
                        Price
                      </button>
                    </h2>
                    <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse show"
                      aria-labelledby="headingThree">
                      <div class="accordion-body">
                        <!-- <div class="range">
                      <input type="range" class="form-range" id="customRange1" />
                    </div> -->
                        <div class="row mb-3">
                          <div class="col-6 mb-3">
                            <p class="mb-0">Min</p>
                            <div class="form-outline">
                              <input type="text" id="min-price" min="0" value="0" laceholder="Min"
                                class="form-control text-white" />
                            </div>
                          </div>
                          <div class="col-6 mb-3">
                            <p class="mb-0">Max</p>
                            <div class="form-outline">
                              <input type="text" id="max-price" min="0" value="10000" laceholder="Max"
                                class="form-control text-white" />
                            </div>
                          </div>
                        </div>
                        <a onclick="filterPrice(this)"
                          class="card-btn btn btn-gold w-100 hover-shadow text-cart">Apply</a>
                      </div>
                    </div>
                  </div>
                  <div class="accordion-item">
                    <h2 class="accordion-header" id="headingThree">
                      <button class="accordion-button bg-black text-gold" type="button" data-mdb-toggle="collapse"
                        data-mdb-target="#panelsStayOpen-collapseFour" aria-expanded="false"
                        aria-controls="panelsStayOpen-collapseFour">
                        Discount
                      </button>
                    </h2>
                    <div id="panelsStayOpen-collapseFour" class="accordion-collapse collapse show"
                      aria-labelledby="headingThree">
                      <div class=" accordion-body">
                        <div class="row align-content-center ">
                          <c:forEach items="${allDiscounts}" var="dis">
                            <input onclick="filterDiscount(this)" type="checkbox" name="discount"
                              value="${dis.type.discount}" class="btn-check border justify-content-center"
                              id="${dis.type}" checked autocomplete="off" />
                            <label class="btn btn-white mb-1 mx-1 px-1" style="width: 60px;"
                              for="${dis.type}">${dis.type.discount}%</label>
                          </c:forEach>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="accordion-item">
                    <h2 class="accordion-header" id="headingTwo">
                      <button class="accordion-button bg-black text-gold" type="button" data-mdb-toggle="collapse"
                        data-mdb-target="#panelsStayOpen-collapseTwo" aria-expanded="true"
                        aria-controls="panelsStayOpen-collapseTwo">
                        Platform
                      </button>
                    </h2>
                    <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse show"
                      aria-labelledby="headingTwo">
                      <div class="accordion-body">
                        <div>
                          <!-- Checked checkbox -->
                          <c:forEach items="${allPlatforms}" var="plat">
                            <div class="form-check">
                              <input onclick="filterPlatform(this)" class="form-check-input" name="platform"
                                type="checkbox" value="${plat.type.getPlatformType()}" id="flexCheckChecked1" checked />
                              <label class="form-check-label"
                                for="flexCheckChecked1">${plat.type.getPlatformType()}</label>
                            </div>
                          </c:forEach>

                        </div>
                      </div>
                    </div>
                  </div>

                </div>
              </div>
            </div>
            <!-- sidebar -->
            <!-- content -->
            <div class="col-lg-9">
              <div id="game-grid-container" class="row">
                <c:forEach items="${allGames}" var="game">
                  <div class="col-lg-4 col-md-12 col-sm-12 item">
                    <div class="card my-3 shadow-0 bg-black border ">
                      <a href="product?name=${game.name}">
                        <img src="${game.pictureUrl}" class="card-img-top" style="aspect-ratio: 3 / 2">
                        <div class="card-body p-0 pt-2">
                          <p class="text-gold mx-3 mb-2"> BASE GAME</p>
                          <h5 class="card-title text-white mx-3">${game.name}</h5>
                          <div class="d-flex justify-content-start align-items-start h-100 mx-2 mt-3">
                            <c:choose>
                              <c:when test="${game.discount.getType().getDiscount()==100}">
                                <p class="text-white mx-3">Free Game</p>
                              </c:when>
                              <c:when test="${not empty game.getDiscount()}">
                                <h6><span
                                    class="badge bg-success mx-2 pt-2">-${game.discount.getType().getDiscount()}%</span>
                                </h6>
                                <p class="text-muted mx-3"> <del>&dollar;${game.price.intValue()}</del></p>
                                <p class="text-white mx-3"> &dollar;${game.getNetPrice().intValue()} </p>
                              </c:when>
                              <c:otherwise>
                                <p class="text-white mx-3">&dollar;${game.price.intValue()}</p>
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
              <hr />
              <!-- Pagination -->
              <nav aria-label="Page navigation example" class="d-flex justify-content-center mt-3">
                <ul  id="pagination" class="pagination">
                  <!-- <li class="page-item ">
                    <a class="page-link" href="#" aria-label="Previous">
                      <span aria-hidden="true">&laquo;</span>
                    </a>
                  </li> -->
                  <!-- <li class="page-item">
                    <a class="page-link" href="#">1</a>
                  </li> -->
                 
                  <!-- <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                      <span aria-hidden="true">&raquo;</span>
                    </a>
                  </li> -->
                </ul>
              </nav>
              <!-- Pagination -->
            </div>
          </div>
        </div>
      </section>
      <!-- Footer -->
      <jsp:include page="footer.jsp" />

      <!-- Footer -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.js"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/solid.min.js"></script>
      <script type="text/javascript" src="js/header.js"></script>
      <script type="text/javascript" src="js/add-to-cart.js"></script>
      <!-- <script id="pagination-script" type="text/javascript" src="js/pagination.js"></script> -->
      <script type="text/javascript" src="js/all-products.js"></script>

    </body>

    </html>