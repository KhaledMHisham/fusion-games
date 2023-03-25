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

      <section class="h-100 bg-black">
        <div class="container h-100 py-5">
          <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-10">

              <div class="d-flex justify-content-between align-items-center mb-4">
                <h3 class="fw-normal mb-0 text-gold">Wish List</h3>
                <div>
                  <p class="mb-0"><span class="text-muted">Sort by:</span> <a href="#!" class="text-body">price <i
                        class="fas fa-angle-down mt-1"></i></a></p>
                </div>
              </div>
              <c:forEach items="${allGames}" var="game">
                <div class="border-1 border-bottom border-gold rounded-3 mb-4">
                  <div class="card-body p-4">
                    <div class="row d-flex justify-content-between align-items-center">

                      <div class="col-md-10 col-lg-8 col-xl-3">
                        <a href="product?name=${game.name}">
                          <img src="images/12.webp" class=" mb-2 img-fluid rounded-3 ">
                        </a>

                      </div>
                      <div class="col-md-11 col-lg-9 col-xl-4">
                        <p class="lead fw-normal mb-2">${game.name}</p>
                        <p><span class="text-muted mx-1">Genre: </span>${game.getGenres()[0].genre.genre}<span
                            class="mx-1 text-muted">Release Date: </span>${game.releaseDate}</p>
                      </div>
                      <div class="col-md-9 col-lg-7 col-xl-2 offset-lg-1">
                        <h5 class="mb-0">$${game.price}</h5>
                      </div>
                      <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                        <c:choose>
                          <c:when test="${user.getCartGames().contains(game)}">
                            <a onclick='sucessAdded(this)' class="text-gold"><i
                                class="fas fa-cart-plus cursor-pointer fa-2xl"></i></a>
                          </c:when>
                          <c:when test="${user.getOwnedGames().contains(game)}">
                            <a onclick='sucessAdded(this)'  class="text-gold"><i
                              class="fas fa-download cursor-pointer fa-2xl"></i></a>
                              </c:when>
                          <c:otherwise>
                            <a onclick='addToCartFromWishList(this,"${game.id}")' class="text-white"><i
                                class="fas fa-cart-plus cursor-pointer fa-2xl "></i></a>
                          </c:otherwise>
                        </c:choose>

                      </div>

                    </div>

                  </div>
                </div>
              </c:forEach>
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
                  <input type="email" class="form-control border border-gold bg-dark text-gold shadow-0"
                    placeholder="Email" aria-label="Email" aria-describedby="button-addon2">
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

    </body>

    </html>