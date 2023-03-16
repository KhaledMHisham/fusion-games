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
              
          <button id="search-button" type="button" class="btn btn-gold shadow-0">
            <i class="fas fa-search"></i>
          </button>
          <div class="resultBox">
      
          </div>
        </div>
       
      </div>
      <!-- Right elements -->
    </div>            
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
                <h2 class="accordion-header" id="headingOne">
                  <button class="accordion-button bg-black text-gold " type="button" data-mdb-toggle="collapse"
                    data-mdb-target="#panelsStayOpen-collapseOne" aria-expanded="true"
                    aria-controls="panelsStayOpen-collapseOne">
                    Badges
                  </button>
                </h2>
                <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show"
                  aria-labelledby="headingOne">
                  <div class="accordion-body">
                    <ul class="list-unstyled">
                      <li><a href="#" class="text-white">Electronics </a></li>
                      <li><a href="#" class="text-white">Home items </a></li>
                      <li><a href="#" class="text-white">Underwears </a></li>
                      <li><a href="#" class="text-white">Shoes for men </a></li>
                      <li><a href="#" class="text-white">Accessories </a></li>
                    </ul>
                  </div>
                </div>
              </div>
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
                      <!-- Checked checkbox -->
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked1" checked />
                        <label class="form-check-label" for="flexCheckChecked1">Action</label>
                      </div>
                      <!-- Checked checkbox -->
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked2" checked />
                        <label class="form-check-label" for="flexCheckChecked2">Comedy</label>
                      </div>
                      <!-- Checked checkbox -->
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked3" checked />
                        <label class="form-check-label" for="flexCheckChecked3">Fantazy</label>
                      </div>
                      <!-- Checked checkbox -->
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked4" checked />
                        <label class="form-check-label" for="flexCheckChecked4">Fighting</label>
                      </div>
                      <!-- Default checkbox -->
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" />
                        <label class="form-check-label" for="flexCheckDefault">Horror</label>
                      </div>
                      <!-- Default checkbox -->
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" />
                        <label class="form-check-label" for="flexCheckDefault">Strategy</label>
                      </div>
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
                    <div class="range">
                      <input type="range" class="form-range" id="customRange1" />
                    </div>
                    <div class="row mb-3">
                      <div class="col-6">
                        <p class="mb-0">
                          Min
                        </p>
                        <div class="form-outline">
                          <input type="number" id="typeNumber" class="form-control" />
                          <label class="form-label text-white" for="typeNumber">$0</label>
                        </div>
                      </div>
                      <div class="col-6">
                        <p class="mb-0">
                          Max
                        </p>
                        <div class="form-outline">
                          <input type="number" id="typeNumber" class="form-control" />
                          <label class="form-label text-white" for="typeNumber">$1,0000</label>
                        </div>
                      </div>
                    </div>
                    <a href="#" class="card-btn btn btn-gold w-100 hover-shadow text-cart">Apply</a>
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
                  <div class="accordion-body">
                    <input type="checkbox" class="btn-check border justify-content-center" id="btn-check1" checked
                      autocomplete="off" />
                    <label class="btn btn-white mb-1 px-1" style="width: 60px;" for="btn-check1">15%</label>
                    <input type="checkbox" class="btn-check border justify-content-center" id="btn-check2" checked
                      autocomplete="off" />
                    <label class="btn btn-white mb-1 px-1" style="width: 60px;" for="btn-check2">50%</label>
                    <input type="checkbox" class="btn-check border justify-content-center" id="btn-check3" checked
                      autocomplete="off" />
                    <label class="btn btn-white mb-1 px-1" style="width: 60px;" for="btn-check3">85%</label>
                    <input type="checkbox" class="btn-check border justify-content-center" id="btn-check4" checked
                      autocomplete="off" />
                    <label class="btn btn-white mb-1 px-1" style="width: 60px;" for="btn-check4">100%</label>
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
                        <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked1" checked />
                        <label class="form-check-label" for="flexCheckChecked1">Windows OS</label>
                      </div>
                      <!-- Checked checkbox -->
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked2" checked />
                        <label class="form-check-label" for="flexCheckChecked2">Mac OS</label>
                      </div>
                      <!-- Checked checkbox -->
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked3" checked />
                        <label class="form-check-label" for="flexCheckChecked3">Linux OS</label>
                      </div>
                      <!-- Checked checkbox -->

                    </div>
                  </div>
                </div>
              </div>
              <div class="accordion-item">
                <h2 class="accordion-header" id="headingThree">
                  <button class="accordion-button bg-black text-gold" type="button" data-mdb-toggle="collapse"
                    data-mdb-target="#panelsStayOpen-collapseFive" aria-expanded="false"
                    aria-controls="panelsStayOpen-collapseFive">
                    Ratings
                  </button>
                </h2>
                <div id="panelsStayOpen-collapseFive" class="accordion-collapse collapse show"
                  aria-labelledby="headingThree">
                  <div class="accordion-body">
                    <!-- Default checkbox -->
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" checked />
                      <label class="form-check-label" for="flexCheckDefault">
                        <i class="fas fa-star text-warning"></i><i class="fas fa-star text-warning"></i><i
                          class="fas fa-star text-warning"></i><i class="fas fa-star text-warning"></i>
                        <i class="fas fa-star text-warning"></i>
                      </label>
                    </div>
                    <!-- Default checkbox -->
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" checked />
                      <label class="form-check-label" for="flexCheckDefault">
                        <i class="fas fa-star text-warning"></i><i class="fas fa-star text-warning"></i><i
                          class="fas fa-star text-warning"></i><i class="fas fa-star text-warning"></i>
                        <i class="fas fa-star text-secondary"></i>
                      </label>
                    </div>
                    <!-- Default checkbox -->
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" checked />
                      <label class="form-check-label" for="flexCheckDefault">
                        <i class="fas fa-star text-warning"></i><i class="fas fa-star text-warning"></i><i
                          class="fas fa-star text-warning"></i><i class="fas fa-star text-secondary"></i>
                        <i class="fas fa-star text-secondary"></i>
                      </label>
                    </div>
                    <!-- Default checkbox -->
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" checked />
                      <label class="form-check-label" for="flexCheckDefault">
                        <i class="fas fa-star text-warning"></i><i class="fas fa-star text-warning"></i><i
                          class="fas fa-star text-secondary"></i><i class="fas fa-star text-secondary"></i>
                        <i class="fas fa-star text-secondary"></i>
                      </label>
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

          <div class="row">
            <c:forEach items="${weHave}" var="game">
            <div class="col-lg-4 col-md-6 col-sm-6">
              <div class="card my-3 shadow-0 bg-black border ">
                <a href="product?name=${game.name}">
                  <img src="images/hellblade.jpg" class="card-img-top" style="aspect-ratio: 3 / 2">
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
                  <a href="#!" class="btn btn-light border mx-1 px-2 pt-2 float-end icon-hover bg-black shadow-0">
                    <i class="fas fa-heart fa-lg px-1 text-white"></i></a>
                </div>
              </div>
            </div>
            </c:forEach>
            <!-- <div class="col-lg-4 col-md-6 col-sm-6">
              <div class="card my-3 shadow-0 bg-black border border-gold">
                <a href="#">
                  <img src="images/hellblade.jpg" class="card-img-top" style="aspect-ratio: 3 / 2">
                  <div class="card-body p-0 pt-2">
                    <p class="text-gold mx-3 mb-2"> BASE GAME</p>
                    <h5 class="card-title text-white mx-3">Assassin's Creed Valhalla Standard Edition</h5>
                    <div class="d-flex justify-content-start align-items-start h-100 m-2">
                      <h6><span class="badge bg-success mx-2 pt-2">-60%</span></h6>
                      <p class="text-white mx-3"> <del>$59.99</del></p>
                      <p class="text-white mx-3"> $19.79 </p>
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
            <div class="col-lg-4 col-md-6 col-sm-6">
              <div class="card my-3 shadow-0 bg-black border border-gold">
                <a href="#">
                  <img src="images/hellblade.jpg" class="card-img-top" style="aspect-ratio: 3 / 2">
                  <div class="card-body p-0 pt-2">
                    <p class="text-gold mx-3 mb-2"> BASE GAME</p>
                    <h5 class="card-title text-white mx-3">Assassin's Creed Valhalla Standard Edition</h5>
                    <div class="d-flex justify-content-start align-items-start h-100 m-2">
                      <h6><span class="badge bg-success mx-2 pt-2">-60%</span></h6>
                      <p class="text-white mx-3"> <del>$59.99</del></p>
                      <p class="text-white mx-3"> $19.79 </p>
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
            <div class="col-lg-4 col-md-6 col-sm-6">
              <div class="card my-3 shadow-0 bg-black border border-gold">
                <a href="#">
                  <img src="images/hellblade.jpg" class="card-img-top" style="aspect-ratio: 3 / 2">
                  <div class="card-body p-0 pt-2">
                    <p class="text-gold mx-3 mb-2"> BASE GAME</p>
                    <h5 class="card-title text-white mx-3">Assassin's Creed Valhalla Standard Edition</h5>
                    <div class="d-flex justify-content-start align-items-start h-100 m-2">
                      <h6><span class="badge bg-success mx-2 pt-2">-60%</span></h6>
                      <p class="text-white mx-3"> <del>$59.99</del></p>
                      <p class="text-white mx-3"> $19.79 </p>
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
            <div class="col-lg-4 col-md-6 col-sm-6">
              <div class="card my-3 shadow-0 bg-black border border-gold">
                <a href="#">
                  <img src="images/hellblade.jpg" class="card-img-top" style="aspect-ratio: 3 / 2">
                  <div class="card-body p-0 pt-2">
                    <p class="text-gold mx-3 mb-2"> BASE GAME</p>
                    <h5 class="card-title text-white mx-3">Assassin's Creed Valhalla Standard Edition</h5>
                    <div class="d-flex justify-content-start align-items-start h-100 m-2">
                      <h6><span class="badge bg-success mx-2 pt-2">-60%</span></h6>
                      <p class="text-white mx-3"> <del>$59.99</del></p>
                      <p class="text-white mx-3"> $19.79 </p>
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
            <div class="col-lg-4 col-md-6 col-sm-6">
              <div class="card my-3 shadow-0 bg-black border border-gold">
                <a href="#">
                  <img src="images/hellblade.jpg" class="card-img-top" style="aspect-ratio: 3 / 2">
                  <div class="card-body p-0 pt-2">
                    <p class="text-gold mx-3 mb-2"> BASE GAME</p>
                    <h5 class="card-title text-white mx-3">Assassin's Creed Valhalla Standard Edition</h5>
                    <div class="d-flex justify-content-start align-items-start h-100 m-2">
                      <h6><span class="badge bg-success mx-2 pt-2">-60%</span></h6>
                      <p class="text-white mx-3"> <del>$59.99</del></p>
                      <p class="text-white mx-3"> $19.79 </p>
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
            <div class="col-lg-4 col-md-6 col-sm-6">
              <div class="card my-3 shadow-0 bg-black border border-gold">
                <a href="#">
                  <img src="images/hellblade.jpg" class="card-img-top" style="aspect-ratio: 3 / 2">
                  <div class="card-body p-0 pt-2">
                    <p class="text-gold mx-3 mb-2"> BASE GAME</p>
                    <h5 class="card-title text-white mx-3">Assassin's Creed Valhalla Standard Edition</h5>
                    <div class="d-flex justify-content-start align-items-start h-100 m-2">
                      <h6><span class="badge bg-success mx-2 pt-2">-60%</span></h6>
                      <p class="text-white mx-3"> <del>$59.99</del></p>
                      <p class="text-white mx-3"> $19.79 </p>
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
            <div class="col-lg-4 col-md-6 col-sm-6">
              <div class="card my-3 shadow-0 bg-black border border-gold">
                <a href="#">
                  <img src="images/hellblade.jpg" class="card-img-top" style="aspect-ratio: 3 / 2">
                  <div class="card-body p-0 pt-2">
                    <p class="text-gold mx-3 mb-2"> BASE GAME</p>
                    <h5 class="card-title text-white mx-3">Assassin's Creed Valhalla Standard Edition</h5>
                    <div class="d-flex justify-content-start align-items-start h-100 m-2">
                      <h6><span class="badge bg-success mx-2 pt-2">-60%</span></h6>
                      <p class="text-white mx-3"> <del>$59.99</del></p>
                      <p class="text-white mx-3"> $19.79 </p>
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
            <div class="col-lg-4 col-md-6 col-sm-6">
              <div class="card my-3 shadow-0 bg-black border border-gold">
                <a href="#">
                  <img src="images/hellblade.jpg" class="card-img-top" style="aspect-ratio: 3 / 2">
                  <div class="card-body p-0 pt-2">
                    <p class="text-gold mx-3 mb-2"> BASE GAME</p>
                    <h5 class="card-title text-white mx-3">Assassin's Creed Valhalla Standard Edition</h5>
                    <div class="d-flex justify-content-start align-items-start h-100 m-2">
                      <h6><span class="badge bg-success mx-2 pt-2">-60%</span></h6>
                      <p class="text-white mx-3"> <del>$59.99</del></p>
                      <p class="text-white mx-3"> $19.79 </p>
                    </div>
                  </div>
                </a>
                <div class="card-footer px-2">
                  <a href="#" class="card-btn btn btn-gold float-start w-75 text-cart">Add to cart</a>
                  <a href="#!" class="btn btn-light border mx-1 px-2 pt-2 float-end icon-hover bg-black shadow-0"><i
                      class="fas fa-heart fa-lg px-1 text-white"></i></a>
                </div>
              </div>
            </div> -->
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

</body>

</html>