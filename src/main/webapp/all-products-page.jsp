<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <meta charset="UTF-8">
  <title>Home page style 3</title>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
  <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
  <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.css" rel="stylesheet" />
  <link href="css/home-page.css" rel="stylesheet" />
  <link href="css/products.css" rel="stylesheet" />
  <link href="css/header.css" rel="stylesheet" />
  <link href="css/add-to-cart.css" rel="stylesheet" />

</head>

<body class="bg-black">
  <c:if test="${user ne null}">
    <input id="user" hidden value="${user}" />
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
                        <input onclick="filterGenre(this)" class="form-check-input" 
                        type="checkbox" name="genre" value="${genre.genre.genre}" id="flexCheckChecked1" checked />
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
                      <div class="col-6">
                        <!-- <p class="mb-0">
                          Min
                        </p> -->
                        <div class="form-outline">
                          <input  placeholder="Card Number" type="number" id="min-price" min="0" value="0" class="text-white form-control" />
                          <label class="form-label text-white" for="typeNumber">Min</label>
                        </div>
                      </div>
                      <div class="col-6">
                        <!-- <p class="mb-0">
                          Max
                        </p> -->
                        <div class="form-outline">
                          <input  type="number" id="max-price" min="0" value="1000" class="form-label text-white form-control" />
                          <label class="form-label text-white" for="typeNumber">Max</label>
                        </div>
                      </div>
                    </div>
                    <a onclick="filterPrice(this)" class="card-btn btn btn-gold w-100 hover-shadow text-cart">Apply</a>
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
                    <input onclick="filterDiscount(this)" type="checkbox" name="discount" value="15"
                    class="btn-check border justify-content-center" id="btn-check1" checked
                      autocomplete="off" />
                    <label class="btn btn-white mb-1 px-1" style="width: 60px;" for="btn-check1">15%</label>
                    <input onclick="filterDiscount(this)" type="checkbox" name="discount" 
                    class="btn-check border justify-content-center" id="btn-check2" checked value="50"
                      autocomplete="off" />
                    <label class="btn btn-white mb-1 px-1" style="width: 60px;" for="btn-check2">50%</label>
                    <input onclick="filterDiscount(this)" type="checkbox" name="discount" 
                    class="btn-check border justify-content-center" id="btn-check3" checked value="85"
                      autocomplete="off" />
                    <label class="btn btn-white mb-1 px-1" style="width: 60px;" for="btn-check3">85%</label>
                    <input onclick="filterDiscount(this)" type="checkbox" name="discount" 
                    class="btn-check border justify-content-center" id="btn-check4" checked value="100"
                      autocomplete="off" />
                    <label onclick="filterDiscount(this)" class="btn btn-white mb-1 px-1" 
                    style="width: 60px;" for="btn-check4">100%</label>
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
                      <div class="form-check">
                        <input onclick="filterPlatform(this)" class="form-check-input" name="platform" type="checkbox" value="Windows"
                         id="flexCheckChecked1" checked />
                        <label class="form-check-label" for="flexCheckChecked1">Windows OS</label>
                      </div>
                      <!-- Checked checkbox -->
                      <div class="form-check">
                        <input onclick="filterPlatform(this)" class="form-check-input" name="platform" type="checkbox" value="Mac OS" 
                        id="flexCheckChecked2" checked />
                        <label class="form-check-label" for="flexCheckChecked2">Mac OS</label>
                      </div>
                      <!-- Checked checkbox -->
                      <div class="form-check">
                        <input onclick="filterPlatform(this)" class="form-check-input" name="platform" type="checkbox" value="Linux"
                         id="flexCheckChecked3" checked />
                        <label class="form-check-label" for="flexCheckChecked3">Linux OS</label>
                      </div>
                      <div class="form-check">
                        <input onclick="filterPlatform(this)" class="form-check-input" name="platform" type="checkbox" value="XBOX" 
                        id="flexCheckChecked3" checked />
                        <label class="form-check-label" for="flexCheckChecked3">XBOX</label>
                      </div>
                      <!-- Checked checkbox -->

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
            <div class="col-lg-4 col-md-6 col-sm-6">
              <div class="card my-3 shadow-0 bg-black border ">
                <a href="product?name=${game.name}">
                  <img src="images/hellblade.jpg" class="card-img-top" style="aspect-ratio: 3 / 2">
                  <div class="card-body p-0 pt-2">
                    <p class="text-gold mx-3 mb-2"> BASE GAME</p>
                    <h5 class="card-title text-white mx-3">${game.name}</h5>
                  <div class="d-flex justify-content-start align-items-start h-100 mx-2 mt-3">
                    <c:choose>
                      <c:when test="${game.discount.getType().getDiscount()==100}">
                        <p class="text-white mx-3">Free Game</p>
                      </c:when>
                      <c:when test="${not empty game.getDiscount()}">
                    <h6><span class="badge bg-success mx-2 pt-2">-${game.discount.getType().getDiscount()}%</span></h6>
                    <p class="text-muted mx-3"> <del>&dollar;${game.price}</del></p>
                    <p class="text-white mx-3"> &dollar;${game.getNetPrice()} </p>
                    </c:when>
                    <c:otherwise>
                      <p class="text-white mx-3">&dollar;${game.price}</p>
                    </c:otherwise>
                    </c:choose>
                  </div>
                  </div>
                </a>
                <div class="card-footer px-2">
                  <c:choose>
                    <c:when test="${user ne null}">
                      <c:choose>
                        <c:when test="${user.getCartItems().contains(game)}">
                          <a onclick='sucessAddedToCart(this)' id="add-cart" class="card-btn btn btn-gold view-in-cart float-start w-75 text-cart">View In Cart</a>
                        </c:when>
                        <c:otherwise>
                          <a onclick='addToCart(this,"${game.id}")' id="add-cart" class="card-btn btn btn-gold float-start w-75 text-cart">Add to cart</a>
                        </c:otherwise>
                      </c:choose>
                    <a onclick='addToWishList(this,"${game.id}")' class="btn btn-light border mx-1 px-2 pt-2 float-end icon-hover bg-black shadow-0">
                    <i class="fas fa-heart fa-lg px-1 text-white"></i></a>
                  </c:when>
                  <c:otherwise>
                    <a href="login" class="card-btn btn btn-gold float-start w-75 text-cart">Add to cart</a>
                    <a href="login" class="btn btn-light border mx-1 px-2 pt-2 float-end icon-hover bg-black shadow-0">
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
            <ul class="pagination">
              <li class="page-item ">
                <a class="page-link" href="#" aria-label="Previous">
                  <span aria-hidden="true">&laquo;</span>
                </a>
              </li>
              <li class="page-item"><a class="page-link" href="#">1</a></li>
              <li class="page-item active"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item"><a class="page-link" href="#">4</a></li>
              <li class="page-item"><a class="page-link" href="#">5</a></li>
              <li class="page-item">
                <a class="page-link" href="#" aria-label="Next">
                  <span aria-hidden="true">&raquo;</span>
                </a>
              </li>
            </ul>
          </nav>
          <!-- Pagination -->
        </div>
      </div>
    </div>
  </section>
  <!-- Footer -->
  <footer class="text-center text-lg-start text-muted bg-main mt-3">
    <!-- Section: Links  -->
    <section class="">
      <div class="container text-center text-md-start pt-4 pb-4">
        <!-- Grid row -->
        <div class="row mt-3">
          <!-- Grid column -->
          <div class="col-12 col-lg-3 col-sm-12 mb-2">
            <!-- Content -->
            <a href="https://mdbootstrap.com/" target="_blank" class="text-gold h2">
              MDB
            </a>
            <p class="mt-1 text-gold">
              © 2023 Copyright: MDBootstrap.com
            </p>
          </div>
          <!-- Grid column -->

          <!-- Grid column -->
          <div class="col-6 col-sm-4 col-lg-2">
            <!-- Links -->
            <h6 class="text-uppercase text-gold fw-bold mb-2">
              Store
            </h6>
            <ul class="list-unstyled mb-4">
              <li><a class="text-white" href="#">About us</a></li>
              <li><a class="text-white" href="#">Find store</a></li>
              <li><a class="text-white" href="#">Categories</a></li>
              <li><a class="text-white" href="#">Blogs</a></li>
            </ul>
          </div>
          <!-- Grid column -->

          <!-- Grid column -->
          <div class="col-6 col-sm-4 col-lg-2">
            <!-- Links -->
            <h6 class="text-uppercase text-gold fw-bold mb-2">
              Information
            </h6>
            <ul class="list-unstyled mb-4">
              <li><a class="text-white" href="#">Help center</a></li>
              <li><a class="text-white" href="#">Money refund</a></li>
              <li><a class="text-white" href="#">Shipping info</a></li>
              <li><a class="text-white" href="#">Refunds</a></li>
            </ul>
          </div>
          <!-- Grid column -->

          <!-- Grid column -->
          <div class="col-6 col-sm-4 col-lg-2">
            <!-- Links -->
            <h6 class="text-uppercase text-gold fw-bold mb-2">
              Support
            </h6>
            <ul class="list-unstyled mb-4">
              <li><a class="text-white" href="#">Help center</a></li>
              <li><a class="text-white" href="#">Documents</a></li>
              <li><a class="text-white" href="#">Account restore</a></li>
              <li><a class="text-white" href="#">My orders</a></li>
            </ul>
          </div>
          <!-- Grid column -->

          <!-- Grid column -->
          <div class="col-12 col-sm-12 col-lg-3">
            <!-- Links -->
            <h6 class="text-uppercase text-gold fw-bold mb-2">Newsletter</h6>
            <p class="text-white">Stay in touch with latest updates about our products and offers</p>
            <div class="input-group mb-3">
              <input type="email" class="form-control border border-gold bg-dark text-gold shadow-0" placeholder="Email"
                aria-label="Email" aria-describedby="button-addon2">
              <button class="btn btn-gold border border-gold shadow-0" type="button" id="button-addon2"
                data-mdb-ripple-color="dark">
                Join
              </button>
            </div>
          </div>
          <!-- Grid column -->
        </div>
        <!-- Grid row -->
      </div>
    </section>
    <!-- Section: Links  -->

    <div class="">
      <div class="container">
        <div class="d-flex justify-content-between py-4 border-top border-gold">
          <!--- payment --->
          <div>
            <i class="fab fa-lg fa-cc-visa text-gold"></i>
            <i class="fab fa-lg fa-cc-mastercard text-gold"></i>
            <i class="fab fa-lg fa-cc-paypal text-gold"></i>
          </div>
          <!--- payment --->

          <!--- language selector --->
          <div class="dropdown dropup">
            <a class="dropdown-toggle text-gold" href="#" id="Dropdown" role="button" data-mdb-toggle="dropdown"
              aria-expanded="false"> <i class="flag-united-kingdom flag m-0 me-1"></i>English </a>

            <ul class="dropdown-menu language-dropdown dropdown-menu-end bg-dark" aria-labelledby="Dropdown">
              <li>
                <a class="dropdown-item text-gold" href="#"><i class="flag-united-kingdom flag"></i>English <i
                    class="fa fa-check text-success ms-2"></i></a>
              </li>
              <li>
                <hr class="dropdown-divider">
              </li>
              <li>
                <a class="dropdown-item  text-white" href="#"><i class="flag-poland flag"></i>Polski</a>
              </li>
              <li>
                <a class="dropdown-item text-white" href="#"><i class="flag-china flag"></i>中文</a>
              </li>
              <li>
                <a class="dropdown-item text-white" href="#"><i class="flag-japan flag"></i>日本語</a>
              </li>
              <li>
                <a class="dropdown-item text-white" href="#"><i class="flag-germany flag"></i>Deutsch</a>
              </li>
              <li>
                <a class="dropdown-item text-white" href="#"><i class="flag-france flag"></i>Français</a>
              </li>
              <li>
                <a class="dropdown-item text-white" href="#"><i class="flag-spain flag"></i>Español</a>
              </li>
              <li>
                <a class="dropdown-item text-white" href="#"><i class="flag-russia flag"></i>Русский</a>
              </li>
              <li>
                <a class="dropdown-item text-white" href="#"><i class="flag-portugal flag"></i>Português</a>
              </li>
            </ul>
          </div>
          <!--- language selector --->
        </div>
      </div>
    </div>
  </footer>
  <!-- Footer -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/solid.min.js"></script>
  <script type="text/javascript" src="js/header.js"></script>
  <script type="text/javascript" src="js/add-to-cart.js"></script>
  <script type="text/javascript" src="js/all-products.js"></script>

</body>

</html>