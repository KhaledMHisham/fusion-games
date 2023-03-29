<!DOCTYPE html>
<html lang="en">

<head>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <meta charset="UTF-8">
  <title>Check out</title>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
  <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
  <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.css" rel="stylesheet" />
  <link href="css/checkout.css" rel="stylesheet" />
  <link rel="shortcut icon" href="images/phoenix.png" type="image/x-icon" />



</head>

<body>
  <header class="fixed-top">
    <!-- Jumbotron -->
    <div class="p-3 text-center bg-main">
      <div class="container">
        <div class="row gy-3">
          <!-- Left elements -->
          <div class="col-lg-2 col-sm-4 col-4">
            <a href="https://mdbootstrap.com/" target="_blank" class="float-start">
              <img class="rounded-circle bg-gold" style="aspect-ratio: 1/1;" src="images/phoenix.png" height="70">
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
          <div class="col-lg-5 col-md-12 col-12">
            <div class="input-group">
              <div class="form-outline ">
                <input type="search" id="search-input" class="form-control text-gold " />
                <label id="search-label" class="form-label text-gold bg-main search-label" for="search-form">
                  Search</label>
              </div>
              <button id="search-button" type="button" class="btn btn-gold shadow-0">
                <i class="fas fa-search"></i>
              </button>
            </div>
          </div>
          <!-- Right elements -->
        </div>
      </div>
    </div>
    <!-- Jumbotron -->

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-black ">
      <!-- Container wrapper -->
      <div class="container justify-content-center justify-content-md-between">
        <!-- Toggle button -->
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
              <a class="nav-link text-white" href="#">Hot offers</a>
            </li>
            <li class="nav-item">
              <a class="nav-link text-white" href="#">Gift boxes</a>
            </li>
            <li class="nav-item">
              <a class="nav-link " href="#">Projects</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Menu item</a>
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
    <!-- Navbar -->
  </header>
  <div class="page-offset"></div>


  <section class="bg-black py-5 page-offset bg-main">
    <div class="container">
      <div class="row">
        <div class="col-xl-8 col-lg-8 mb-4 border-radius bg-main checout-border">

          <!-- Checkout -->
          <div class="shadow-0 border-gold text-gold">
            <div class="p-4">
              <h5 class="card-title mb-3">Checkout</h5>
              <div class="row">
                <div class="col-6 mb-3">
                  <p class="mb-0">First name</p>
                  <div class="form-outline">
                    <input type="text" id="fname" placeholder="Type here" class="form-control text-white" />
                  </div>
                </div>

                <div class="col-6">
                  <p class="mb-0">Last name</p>
                  <div class="form-outline">
                    <input type="text" id="lname" placeholder="Type here" class="form-control text-white" />
                  </div>
                </div>

                <div class="col-6 mb-3">
                  <p class="mb-0">Phone</p>
                  <div class="form-outline">
                    <input type="tel" id="typePhone" value="+02 " class="form-control text-white" />
                  </div>
                </div>

                <div class="col-6 mb-3">
                  <p class="mb-0">Email</p>
                  <div class="form-outline">
                    <input type="email" id="typeEmail" placeholder="example@gmail.com"
                      class="form-control text-white" />
                  </div>
                </div>
              </div>

              <div class="form-check">
                <input class="form-check-input keep-me-up-checkbtn" type="checkbox" value="" id="flexCheckDefault" />
                <label class="form-check-label" for="flexCheckDefault">Keep me up to date on news</label>
              </div>


            </div>

          </div>

          <hr class="my-4 border-gold" />
        <div class=" cart-info-style">
<!--           <div class="shadow-0 border-gold text-gold">-->
<!--           <div class="p-4"> -->
          <h5 class="card-title mb-3 text-gold">Credit Card Info</h5>
          <br>
          <div class="text-gold">
            <div>
              <div>
                <div>
                  <div>
                    <div class="col-6 mb-3">
                      <p class="mb-0">Credit Card Number</p>
                      <div class="form-outline">
                        <input type="text" id="card-num" placeholder="1111-1111-1111-1111" class="form-control text-white" />
                      </div>
                    </div>
                  </div>
                  <div class="col-6 mb-3">
                    <p class="mb-0">CVV</p>
                    <div class="form-outline">
                      <input type="text" id="cvv-num" placeholder="123" class="form-control text-white" />
                    </div>
                  </div>
                </div>
                <div class="col-6 mb-3">
                  <p class="mb-0">Credit Holder Name</p>
                  <div class="form-outline">
                    <input type="text" id="owner-name" placeholder="type your name" class="form-control text-white" />
                  </div>
                </div>
              </div>
              <div class="float-end">
                <button class="btn btn-dark border btn-gold m-4">Cancel</button>
                <button class="btn btn-success shadow-0 border btn-gold m-4">Checkout</button>
              </div>

            </div>

          </div>
        </div>


          <!-- Checkout -->
        </div>
        <div class="col-xl-4 col-lg-4 d-flex justify-content-center justify-content-lg-end text-gold">
          <div class="ms-lg-4 mt-4 mt-lg-0" style="max-width: 320px;">
            <h6 class="mb-3 text-white">Summary</h6>
            <div class="d-flex justify-content-between">
              <p class="mb-2">Total price:</p>
              <p class="mb-2">$195.90</p>
            </div>
            <div class="d-flex justify-content-between">
              <p class="mb-2">Discount:</p>
              <p class="mb-2 text-danger">- $60.00</p>
            </div>
            <hr />
            <div class="d-flex justify-content-between">
              <p class="mb-2">Total price:</p>
              <p class="mb-2 fw-bold">$149.90</p>
            </div>


            <hr />
            <h6 class="text-dark text-white my-4">Items in cart</h6>

            <div class="d-flex align-items-center mb-4">
              <div class="me-3 position-relative">

                <img src="images/1 (3).png"/>

              </div>
              <div class="">
                <a href="#" class="nav-link">
                  Gaming Headset with Mic <br />
                  Darkblue color
                </a>
                <div class="price text-muted">price: $295.99</div>
              </div>
            </div>

            <div class="d-flex align-items-center mb-4">
              <div class="me-3 position-relative">
                <img src="images/1 (3).png"/>

              </div>
              <div class="">
                <a href="#" class="nav-link">
                  Apple Watch Series 4 Space <br />
                  Large size
                </a>
                <div class="price text-muted">price: $217.99</div>
              </div>
            </div>

            <div class="d-flex align-items-center mb-4">
              <div class="me-3 position-relative">
                <img src="images/1 (3).png"/>

              </div>
              <div class="">
                <a href="#" class="nav-link">GoPro HERO6 4K Action Camera - Black</a>
                <div class="price text-muted">price: $910.00</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>










  <!-- /**************************************************************************************************/ -->


 

 <!-- /*****************************************************************************************************************/  -->


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
</body>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.js"></script>

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>

</html>