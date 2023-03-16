<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
  <%System.out.println(request.getAttribute("gamesOnSale"));%>
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
      <link href="css/header.css" rel="stylesheet" />
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
          <div class="col-lg-5">
            <div class="input-group">
              <div  id="search-autocomplete" class="searchInput form-outline ">
                <input type="search" class="form-control  text-gold " />
                <label id="search-label" class="form-label text-gold search-label"
                  for="search-form">Search</label>
                  
              
              <div class="resultBox">
          
              </div>
            </div>
            <button id="search-button" type="button" class="btn btn-gold shadow-0">
              <i class="fas fa-search"></i>
            </button>
          </div>
          <!-- Right elements -->
        </div>    
        <div>       
        <button class="navbar-toggler" type="button" data-mdb-toggle="collapse"
            data-mdb-target="#navbarLeftAlignExample" aria-controls="navbarLeftAlignExample" aria-expanded="false"
            aria-label="Toggle navigation">
            <i class="fas fa-bars"></i>
          </button>
         
          <!-- Collapsible wrapper -->
         
        </div> 
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
      <!--  intro  -->

      <!-- intro -->
      <!-- Right elements -->
<main >
  <div >
  
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
            <img src="images/hellblade.jpg" class="d-block w-100" alt="Wild Landscape" />
            <div class="mask" style="background-color: rgba(0, 0, 0, 0.4)"></div>
            <div class="carousel-caption d-none d-sm-block mb-5">
              <h1 class="mb-4">
                <strong>${game.name}</strong>
              </h1>
              <p>
                <strong>Best & free games in our website</strong>
              </p>
              <p class="mb-4 d-none d-md-block">
                <!-- <strong>The most comprehensive tutorial for the Bootstrap 5. Loved by over 3 000 000 users. Video and
                  written versions
                  available. Create your own, stunning website.</strong> -->
              </p>

              <a target="_blank" href="https://mdbootstrap.com/education/bootstrap/"
                class="btn btn-outline-white btn-lg">Browse
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
            <h3 class="text-gold">Just For You</h3>
          </header>

          <div class="position-relative col-lg-7 col-md-12 col-sm-12">
            <div id="card-banner" class="d-flex rounded-5 align-items-end card-banner bg-gray h-100"></div>
            <div id="card-banner-desc" class="card-banner-desc position-absolute m-4" style="max-width: 60%;">
              <!-- <h3 class="text-white">Best products &amp; brands in our store at 80% off</h3> -->
              <h3 id="game-name">${newReleases[0].name}</h3>
              <div class="d-flex justify-content-start align-items-start h-100 m-2">
                <h6> starting at </h6>
                <h5 class="text-muted mx-3"> <del id="game-price">&dollar;${newReleases[0].price}</del></h5>
                <h5 id="game-net-price" class="text-white mx-3"> &dollar;${newReleases[0].price - (newReleases[0].price *
                  newReleases[0].discount.getType().getDiscount()/100)} </h5>
              </div>     
              <button class="btn btn-warning shadow-0 relative-bottom " href="#"> Buy Now </button>
              <button class="btn btn-dark hover-zoom shadow-0 " href="#"> Add to cart </button>

            </div>
          </div>

          <span style="width: 0px; "></span>

          
          <section class="mx-3 col-xl-4 col-lg-4 col-md-12 col-sm-12">
            <div class="list-group">
              <c:forEach items="${newReleases}" var="game">
                <div id="game1" onclick='onClickGame(this,"${game.name}","${game.price}","${game.discount.getType().getDiscount()}")' class="col-xl-10 col-lg-10 col-md-8 col-sm-10 mb-2">
                  <div class="card card-list shadow-0 bg-black hover-shadow-soft">
                    <div class="card-body">
                      <div class="d-flex align-items-center">
                        <img id="img-src" src="images/hellblade.jpg" alt="" style="width:100px; height:100px" class="fa-square " />
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
          <h3 class="text-gold ">BestSellers</h3>
          <c:if test="${fn:length(gamesOnSale) > 3}" >
          <div class="row arrows-BestSellerList">
            <div class="arrow mx-2 arrow-left-BestSellerList">
              <i class="fas fa-chevron-left"></i>
            </div>
            <div class="arrow arrow-right-BestSellerList">
              <i class="fas fa-chevron-right"></i>
            </div>
          </div>
        </c:if>
        </div>
        <div class="d-flex flex-row flex-nowrap  overflow-hidden collapsible-scrollspy-BestSellerList " style="position: relative;">
          <c:forEach items="${allGames}" var="game">
            <div class="m-2 col-lg-3 col-md-6 col-sm-6">
            <div class="card my-2 shadow-0 bg-black border">
              <a href="product?name=${game.name}" class="">
                <img src="images/12.webp" class="card-img-top" style="aspect-ratio: 3 / 2">
                <div class="card-body p-0 pt-2">
                  <p class="text-gold mx-3 mb-2"> BASE GAME</p>
                  <h5 class="card-title text-white mx-3">${game.name}</h5>
                  <div class="d-flex justify-content-start align-items-start h-100 mx-2 mt-3">
                    <c:choose>
                      <c:when test="${game.discount.getType().getDiscount()==100}">
                        <h5 class="text-white mx-3">Free Game</h5>
  
                      </c:when>
                      <c:when test="${not empty game.getDiscount()}">
                    <h6><span class="badge bg-success mx-2 pt-2">-${game.discount.getType().getDiscount()}%</span></h6>
                    <p class="text-muted mx-3"> <del>&dollar;${game.price}</del></p>
                    <p class="text-white mx-3"> &dollar;${game.price - (game.price *
                      game.discount.getType().getDiscount()/100)} </p>
                    </c:when>
                   
                    <c:otherwise>
                      <h4 class="text-white mx-3">&dollar;${game.price}</h4>
                    </c:otherwise>
                    </c:choose>
                    
                  </div>
                </div>
              </a>
              <div class="card-footer px-2">
                <a href="#" class="card-btn btn btn-gold float-start w-75 text-cart">Add to cart</a>
                <a href="#!" class="btn btn-light border mx-1 px-2 pt-2 float-end icon-hover bg-black shadow-0"><i
                    class="fas fa-heart fa-lg px-1 text-white"></i></a>
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
                    <img src="images/hellblade.jpg" class="card-img-top" style="aspect-ratio: 3 / 2">
                    <div class="card-body p-0 pt-2">
                      <p class="text-gold mx-3 mb-2">Base Game</p>
                      <h5 class="card-title text-white mx-3">${game.name}</h5>
                      <div class="d-flex justify-content-end align-items-start h-100 m-2">
                        <h5 class=" text-gold mx-3">&dollar;${game.price}</h5>                        
                      </div>
                    </div>
                  </a>
                  <div class="card-footer px-2">
                    <a href="#" class="card-btn btn btn-gold float-start w-75 text-cart">Add to cart</a>
                    <a href="#!" class="btn btn-light border mx-1 px-2 pt-2 float-end icon-hover bg-black shadow-0"><i
                        class="fas fa-heart fa-lg px-1 text-white"></i></a>
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
          <div class="row position-relative gy-4">
            <c:forEach items="${freeGames}" var="game">
            <div class="col-lg-6">
              <a href="product?name=${game.name}">
                <div class="card d-flex rounded-5 align-items-end card-banner bg-gray h-100"></div>
                <div class=" position-absolute banner-desc m-4" style="max-width: 60%;">
                  <h3 class="text-white">100% off</h3>
                  <h5 class="text-white">${game.name}</h5>  
                  <button class="btn btn-warning shadow-0 relative-bottom " href="#"> Buy Now </button>
                  <button class="btn btn-dark hover-zoom shadow-0 " href="#"> Add to cart </button>
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
          <c:if test="${fn:length(gamesOnSale) > 3}" >
          <div class="row arrows">
            <div class="arrow arrow-left">
              <i class="fas fa-chevron-left"></i>
            </div>
            <div class="arrow arrow-right">
              <i class="fas fa-chevron-right"></i>
            </div>
          </div>
        </c:if>
        </div>
        <div class="d-flex flex-row flex-nowrap  overflow-hidden collapsible-scrollspy " style="position: relative;">
          <c:forEach items="${gamesOnSale}" var="game">
            <div class="m-2 col-lg-3 col-md-6 col-sm-6">
            <div class="card my-2 shadow-0 bg-black border">
              <a href="product?name=${game.name}" class="">
                <img src="images/12.webp" class="card-img-top" style="aspect-ratio: 3 / 2">
                <div class="card-body p-0 pt-2">
                  <p class="text-gold mx-3 mb-2"> BASE GAME</p>
                  <h5 class="card-title text-white mx-3">${game.name}</h5>
                  <div class="d-flex justify-content-start align-items-start h-100 mx-2 mt-3">
                    <h6><span class="badge bg-success mx-2 pt-2">-${game.discount.getType().getDiscount()}%</span></h6>
                    <p class="text-muted mx-3"> <del>&dollar;${game.price}</del></p>
                    <p class="text-white mx-3"> &dollar;${game.price - (game.price *
                      game.discount.getType().getDiscount()/100)} </p>
                  </div>
                </div>
              </a>
              <div class="card-footer px-2">
                <a href="#" class="card-btn btn btn-gold float-start w-75 text-cart">Add to cart</a>
                <a href="#!" class="btn btn-light border mx-1 px-2 pt-2 float-end icon-hover bg-black shadow-0"><i
                    class="fas fa-heart fa-lg px-1 text-white"></i></a>
              </div>
            </div>
          </div>
        </c:forEach>
        </div>
      </div>
      </div>
        <div class="container">
          <div class="px-4 pt-3 border">
            <div class="row pt-1">
              <div class="col-lg-3 col-md-6 mb-3 d-flex">
                <div class="d-flex align-items-center">
                  <div class="badge badge-warning p-2 rounded-4 me-3">
                    <i class="fas fa-thumbs-up fa-2x fa-fw"></i>
                  </div>
                  <span class="info">
                    <h6 class="title">Reasonable prices</h6>
                    <p class="mb-0">Have you ever finally just</p>
                  </span>
                </div>
              </div>
              <div class="col-lg-3 col-md-6 mb-3 d-flex">
                <div class="d-flex align-items-center">
                  <div class="badge badge-warning p-2 rounded-4 me-3">
                    <i class="fas fa-plane fa-2x fa-fw"></i>
                  </div>
                  <span class="info">
                    <h6 class="title">Worldwide shopping</h6>
                    <p class="mb-0">Have you ever finally just</p>
                  </span>
                </div>
              </div>
              <div class="col-lg-3 col-md-6 mb-3 d-flex">
                <div class="d-flex align-items-center">
                  <div class="badge badge-warning p-2 rounded-4 me-3">
                    <i class="fas fa-star fa-2x fa-fw"></i>
                  </div>
                  <span class="info">
                    <h6 class="title">Best ratings</h6>
                    <p class="mb-0">Have you ever finally just</p>
                  </span>
                </div>
              </div>
              <div class="col-lg-3 col-md-6 mb-3 d-flex">
                <div class="d-flex align-items-center">
                  <div class="badge badge-warning p-2 rounded-4 me-3">
                    <i class="fas fa-phone-alt fa-2x fa-fw"></i>
                  </div>
                  <span class="info">
                    <h6 class="title">Help center</h6>
                    <p class="mb-0">Have you ever finally just</p>
                  </span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section> -->
    </main>

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
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/solid.min.js"></script>
      <script type="text/javascript" src="js/home-page.js"></script>
      <script type="text/javascript" src="js/header.js"></script>

    </body>

    </html>