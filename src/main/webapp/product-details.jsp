<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>

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

</head>

<body class="bg-black">

    <!--Main Navigation-->
    <header class="header-top">
        <!-- Jumbotron -->
        <div class=" p-3 text-center bg-main header">
          <div class="container">
            <div class="row gy-3">
              <!-- Left elements -->
              <div class="col-lg-2 col-sm-4 col-4">
                <a href="https://mdbootstrap.com/" target="_blank" class="float-start">
                  <img class="rounded-circle" style="aspect-ratio: 1/1;" src="images/phoenix.png" height="50">
                </a>
              </div>
              <!-- Left elements -->
              <!-- Center elements -->
              <div class="order-lg-last col-lg-5 col-sm-8 col-8">
                <div class="d-flex float-end">
                  <a href="https://github.com/mdbootstrap/bootstrap-material-design"
                    class="me-1 py-1 px-3 nav-link d-flex align-items-center navbar-link" target="_blank"> <i
                      class="fas fa-user-alt m-1 me-md-2 text-gold"></i>
                    <p class="d-none d-md-block mb-0 text-gold">Sign in</p>
                  </a>
                  <a href="https://github.com/mdbootstrap/bootstrap-material-design"
                    class="me-1 py-1 px-3 nav-link d-flex align-items-center navbar-link" target="_blank"> <i
                      class="fas fa-heart m-1 me-md-2 text-gold"></i>
                    <p class="d-none d-md-block mb-0 text-gold">Wishlist</p>
                  </a>
                  <a href="https://github.com/mdbootstrap/bootstrap-material-design"
                    class="py-1 px-3 nav-link d-flex align-items-center navbar-link" target="_blank"> <i
                      class="fas fa-shopping-cart m-1 me-md-2 text-gold"></i>
                    <p class="d-none d-md-block mb-0 text-gold">My cart</p>
                  </a>
                </div>
              </div>
              <!-- Center elements -->

              <!-- Right elements -->
              
          
          </div>
        </div>
        <!-- Jumbotron -->

        <!-- Navbar -->
       
       
        <!-- Navbar -->
      </header>

      <nav class=" nav-bar justify-content-center navbar navbar-expand-lg navbar-dark bg-black sticky-top mb-3 p-2">
        <!-- Container wrapper -->
        <div class="container justify-content-center justify-content-md-between">
          <!-- <div class="col-lg-5">
            <div class="input-group">
              <div  id="search-autocomplete" class="searchInput form-outline ">
                <input type="search" class="form-control  text-gold " />
                <label id="search-label" class="form-label text-gold search-label"
                  for="search-form">Search</label>
                  
              <button id="search-button" type="button" class="btn btn-gold shadow-0">
                <i class="fas fa-search"></i>
              </button>
              <div class="resultBox">
          
              </div>
            </div>
           
          </div>
           Right elements 
        </div> -->
        <button class="navbar-toggler" type="button" data-mdb-toggle="collapse"
            data-mdb-target="#navbarLeftAlignExample" aria-controls="navbarLeftAlignExample" aria-expanded="false"
            aria-label="Toggle navigation">
            <i class="fas fa-bars"></i>
          </button>
         
          <!-- Collapsible wrapper -->
          <div class="collapse navbar-collapse" id="navbarLeftAlignExample">
            <!-- Left links -->
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 align-items-center">
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button"
                  data-mdb-toggle="dropdown" aria-expanded="false">
                  Categories
                </a>
                <!-- Dropdown menu -->
                <ul class="dropdown-menu categories-dropdown" aria-labelledby="navbarDropdown">
                  <li>
                    <a class="dropdown-item bg-black text-white" href="#">Action</a>
                  </li>
                  <li>
                    <a class="dropdown-item bg-black text-white" href="#">RPG</a>
                  </li>
                  <li>
                    <a class="dropdown-item bg-black text-white" href="#">Souls-Like</a>
                  </li>
                </ul>
              </li>
    
              <li class="nav-item">
                <a class="nav-link text-white" href="home">Discover</a>
              </li>
              <li class="nav-item">
                <a class="nav-link " href="all-products">Browse</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">Menu name</a>
              </li>
            </ul>
            <!-- Left links -->
          </div>
        </div>
        <!-- Container wrapper -->
      </nav>
    <!-- <div class="page-offset"></div> -->

    <div class="container">
        <div class="row justify-content-around">
            <div class="col-lg-7 col-md-7 col-sm-12 p-3">
                <img class="img-fluid rounded-5" src="images/hellblade.jpg">
                <p class="pt-3">${game.description}.</p>
                <!-- <p class="pt-3"><c:out value="${game.genres}"/></p> -->
                <div class="row pt-1">
                    <div class="col-6 border-start border-1 border-gold">
                        <p class="m-0 mb-1">Genres</p>
                            <p class="m-0" style="font-size:small">
                                <c:forEach items="${game.genres}" var="genr">
                                    ${genr.genre}, 
                                </c:forEach>
                            </p>
                    </div>
                    <div class="col-6 border-start border-1 border-gold">
                        <p class="m-0 mb-1">Features</p>
                        <p class="m-0" style="font-size:small"> Story Rich, Single Player</p>
                    </div>
                </div>
            </div>
            <span class="border-end border-gold border-1" style="width: 0px; "></span>
            <div class="col-lg-4 col-md-4 col-sm-12 p-3">
                <div class="row">
                    <div class="col-12 justify-content-center">
                        <h4 class=" text-center"><strong
                                class="border-bottom border-1 border-gold">${game.name}</strong></h4>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-12">
                        <h6><span class="badge bg-dark mx-2 pt-2">BASE GAME</span></h6>
                    </div>
                </div>
                <c:choose>
                    <c:when test="${game.discount.getType().getDiscount()==100}">
                        <div class="">
                            <h5 class="text-white mx-3">Free Game</h5>
                        </div>
                    </c:when>
                    <c:when test="${not empty game.getDiscount()}">
                        <div class="row mt-2">
                            <div class="col-2">
                                <h6><span
                                        class="badge bg-success mx-2 pt-2">-${game.discount.getType().getDiscount()}%</span>
                                </h6>
                            </div>
                            <div class="col-2">
                                <p class="text-white mx-3"> <del>&dollar;${game.price}</del></p>
                            </div>
                            <div class="col-2">
                                <p class="text-white mx-3"> &dollar;${game.price -
                                    (game.price*game.discount.getType().getDiscount()/100)} </p>
                            </div>
                        </div>
                    </c:when>
                    
                    
                    <c:otherwise>
                        <div class="col-2">
                            <h5 class="text-white mx-3">&dollar;${game.price}</h5>
                        </div>
                    </c:otherwise>
                </c:choose>

                <button class="btn w-100 border-0 p-2 m-2 rounded-5 text-black bg-gold">BUY NOW</button>
                <button class="btn w-100 border-0 p-2 m-2 rounded-5 text-white bg-main"><i
                        class="fas fa-shopping-cart m-1 me-md-2 text-white"></i>ADD TO CART</button>
                <button class="btn w-100 border-0 p-2 m-2 rounded-5 text-white bg-main"><i
                        class="fas fa-heart m-1 me-md-2 text-white"></i>ADD TO WISHLIST</button>
                <div class="row px-2 pe-2">
                    <div class="col-12 d-flex flex-row justify-content-between mt-3 border-1 border-bottom border-gold">
                        <p>Developer</p>
                        <p>${game.developer}</p>
                    </div>
                </div>
                <div class="row px-2 pe-2">
                    <div class="col-12 d-flex flex-row justify-content-between mt-3 border-1 border-bottom border-gold">
                        <p>Publisher</p>
                        <p>${game.publisher}</p>
                    </div>
                </div>
                <div class="row px-2 pe-2">
                    <div class="col-12 d-flex flex-row justify-content-between mt-3 border-1 border-bottom border-gold">
                        <p>Release Date</p>
                        <p>${game.releaseDate}</p>
                    </div>
                </div>
                <div class="row px-2 pe-2">
                    <div class="col-12 d-flex flex-row justify-content-between mt-3 border-1 border-bottom border-gold">
                        <p>Platforms</p>
                        <p><i class="fa-brands fa-windows mx-2"></i> <i class="fa-brands fa-xbox"></i></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <h4>Specifications</h4>
            <div class="col-12 bg-main mt-5 mx-2 rounded-5">
                <h5 class="mt-3 mx-2 me-2 pb-2 border-bottom border-1 border-gold"><strong
                        class="border-bottom border-4 border-gold pb-2">Windows</strong></h5>
                <div class="row p-5">
                    <div class="mx-4 col-5">
                        <h6 class="text-white-50 m-0 mt-2 mb-4">Minimum</h6>
                        <p class="text-white-50 m-0 mt-2">OS</p>
                        <p class="m-0">Windows 10</p>
                        <p class="text-white-50 m-0 mt-2">Processor</p>
                        <p class="m-0">Intel Core i5-8400 OR AMD Ryzen 5 2600</p>
                        <p class="text-white-50 m-0 mt-2">Memory</p>
                        <p class="m-0">8 GB</p>
                        <p class="text-white-50 m-0 mt-2">Storage</p>
                        <p class="m-0">85 GB</p>
                        <p class="text-white-50 m-0 mt-2">Direct X</p>
                        <p class="m-0">DX 12</p>
                        <p class="text-white-50 m-0 mt-2">Graphics</p>
                        <p class="m-0">NVIDIA GeForce GTX 1070 or AMD RX Vega 56</p>
                    </div>

                    <div class="col-5">
                        <h6 class="text-white-50 m-0 mt-2 mb-4">Recommended</h6>
                        <p class="text-white-50 m-0 mt-2">OS</p>
                        <p class="m-0">Windows 10</p>
                        <p class="text-white-50 m-0 mt-2">Processor</p>
                        <p class="m-0">Intel Core i5-8400 OR AMD Ryzen 5 2600</p>
                        <p class="text-white-50 m-0 mt-2">Memory</p>
                        <p class="m-0">8 GB</p>
                        <p class="text-white-50 m-0 mt-2">Storage</p>
                        <p class="m-0">85 GB</p>
                        <p class="text-white-50 m-0 mt-2">Direct X</p>
                        <p class="m-0">DX 12</p>
                        <p class="text-white-50 m-0 mt-2">Graphics</p>
                        <p class="m-0">NVIDIA GeForce GTX 1070 or AMD RX Vega 56</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
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
                        <a class="dropdown-toggle text-gold" href="#" id="Dropdown" role="button"
                            data-mdb-toggle="dropdown" aria-expanded="false"> <i
                                class="flag-united-kingdom flag m-0 me-1"></i>English </a>

                        <ul class="dropdown-menu language-dropdown dropdown-menu-end bg-dark"
                            aria-labelledby="Dropdown">
                            <li>
                                <a class="dropdown-item text-gold" href="#"><i
                                        class="flag-united-kingdom flag"></i>English <i
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
                                <a class="dropdown-item text-white" href="#"><i
                                        class="flag-germany flag"></i>Deutsch</a>
                            </li>
                            <li>
                                <a class="dropdown-item text-white" href="#"><i
                                        class="flag-france flag"></i>Français</a>
                            </li>
                            <li>
                                <a class="dropdown-item text-white" href="#"><i class="flag-spain flag"></i>Español</a>
                            </li>
                            <li>
                                <a class="dropdown-item text-white" href="#"><i class="flag-russia flag"></i>Русский</a>
                            </li>
                            <li>
                                <a class="dropdown-item text-white" href="#"><i
                                        class="flag-portugal flag"></i>Português</a>
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
</body>

</html>