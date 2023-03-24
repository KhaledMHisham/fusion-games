<%@taglib prefix="c" uri="jakarta.tags.core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        <!-- <%System.out.println(request.getAttribute("game"));%> -->

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
            <link href="css/user-profile.css" rel="stylesheet" />
        </head>

        <body class="bg-black">

            <!--Main Navigation-->
            <header class="fixed-top">
                <!-- Jumbotron -->
                <div class="p-3 text-center bg-main">
                    <div class="container">
                        <div class="row gy-3">
                            <!-- Left elements -->
                            <div class="col-lg-2 col-sm-4 col-4">
                                <a href="https://mdbootstrap.com/" target="_blank" class="float-start">
                                    <img class="rounded-circle bg-gold" style="aspect-ratio: 1/1;"
                                        src="images/phoenix.png" height="35">
                                </a>
                            </div>
                            <!-- Left elements -->
                            <!-- Center elements -->
                            <div class="order-lg-last col-lg-5 col-sm-8 col-8">
                                <div class="d-flex float-end">
                                    <a href="https://github.com/mdbootstrap/bootstrap-material-design"
                                        class="me-1 py-1 px-3 nav-link d-flex align-items-center navbar-link"
                                        target="_blank">
                                        <i class="fas fa-user-alt m-1 me-md-2 text-gold"></i>
                                        <p class="d-none d-md-block mb-0 text-gold">Sign in</p>
                                    </a>
                                    <a href="https://github.com/mdbootstrap/bootstrap-material-design"
                                        class="me-1 py-1 px-3 nav-link d-flex align-items-center navbar-link"
                                        target="_blank">
                                        <i class="fas fa-heart m-1 me-md-2 text-gold"></i>
                                        <p class="d-none d-md-block mb-0 text-gold">Wishlist</p>
                                    </a>
                                    <a href="https://github.com/mdbootstrap/bootstrap-material-design"
                                        class="py-1 px-3 nav-link d-flex align-items-center navbar-link"
                                        target="_blank"> <i class="fas fa-shopping-cart m-1 me-md-2 text-gold"></i>
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
                                        <label id="search-label" class="form-label text-gold bg-main search-label"
                                            for="search-form">Search</label>
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
                            data-mdb-target="#navbarLeftAlignExample" aria-controls="navbarLeftAlignExample"
                            aria-expanded="false" aria-label="Toggle navigation">
                            <i class="fas fa-bars"></i>
                        </button>

                        <!-- Collapsible wrapper -->
                        <div class="collapse navbar-collapse" id="navbarLeftAlignExample">
                            <!-- Left links -->
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0 align-items-center">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown"
                                        role="button" data-mdb-toggle="dropdown" aria-expanded="false">
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

            <div class="container">
                <div class="row">
                    <div class=" col-lg-3 col-md-3 col-sm-12 mb-3 rounded-2">
                        <div class="list-group list-group-dark">
                            <button type="button"
                                class=" account-control-item list-group-item bg-main text-white list-group-item-action px-3 border-0"
                                disabled>
                                <h5>Account Controls</h5>
                            </button>
                            <button type="button"
                                class="account-control-item list-group-item bg-main text-white list-group-item-action px-3 border-0"
                                aria-current="true">
                                <i class="fas fa-wrench fa-fw me-3"></i><span>Account Settings</span>
                            </button>
                            <button type="button"
                                class="account-control-item list-group-item bg-main text-white list-group-item-action px-3 border-0"
                                aria-current="true">
                                <i class="fas fa-chart-bar fa-fw me-3"></i><span>Orders</span>
                            </button>
                        </div>
                    </div>
                    <div class="bg-main p-3 col-lg-8 col-md-8 col-sm-12 rounded-2 d-flex flex-column justify-content-between">
                        <!-- /////////////////////////////////////////////////////////////////////////////////// -->
                        <div class="row">
                            <div class="col-md-2 text-gold font-size">
                                Order #1
                            </div>
                            <br>
                        
                            <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                        
                                <div class="me-3 position-relative">
                        
                                    <img src="images/game1.jpg" />
                        
                                </div>
                        
                            </div>
                            <c:forEach items="${orderedGames}" var="orderedGame">
                                <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                    <p class="text-muted mb-0 small text-gold font-size">
                                        <c:out value="${orderedGame.game.name}" />
                                    </p>
                                </div>
                            </c:forEach>

                            <c:forEach items="${orderedGame.game.getGenres()}" var="genre">

                                    <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                        <p class="text-muted mb-0 small text-gold font-size">
                                            <c:out value="${genre.genre}" />
                                        </p>
                                    </div>
                                </c:forEach>

                        
                                <c:forEach items="${orderedGames}" var="orderedGame">
                                    <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                        <p class="text-muted mb-0 small text-gold font-size">
                                            <c:out value="${orderedGame.game.netPrice}" />
                                        </p>
                                    </div>
                                </c:forEach>

                                

                                    <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                        <p class="text-muted mb-0 small text-gold font-size">
                                            <c:out value="${orderedGame.game.discount.getType().getDiscount()}" />
                                        </p>
                                    </div>
                            
                        </div> 
                        <!-- //////////////////////////////////////////////////////////////////// -->

                        <hr class="mb-4" style="background-color: #e0e0e0; opacity: 1;">
                        <div class="row d-flex align-items-center">

                            <div class="col-md-12">
                                <div class="d-flex justify-content-around mb-1">
                                    <p class="text-muted mt-1 mb-0 small ms-xl-5 text-gold">
                                        Order Status</p>
                                    <p class="text-muted mt-1 mb-0 small ms-xl-5 text-gold">
                                        Delivered</p>
                                    <p class="text-muted mt-1 mb-0 small ms-xl-5 text-gold">
                                        Total Price</p>
                                    <p class="text-muted mt-1 mb-0 small ms-xl-5 text-gold">100$
                                    </p>
                                </div>
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
                                <p class="text-white">Stay in touch with latest updates about our products and offers
                                </p>
                                <div class="input-group mb-3">
                                    <input type="email"
                                        class="form-control border border-gold bg-dark text-gold shadow-0"
                                        placeholder="Email" aria-label="Email" aria-describedby="button-addon2">
                                    <button class="btn btn-gold border border-gold shadow-0" type="button"
                                        id="button-addon2" data-mdb-ripple-color="dark">
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
                                        <a class="dropdown-item  text-white" href="#"><i
                                                class="flag-poland flag"></i>Polski</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item text-white" href="#"><i
                                                class="flag-china flag"></i>中文</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item text-white" href="#"><i
                                                class="flag-japan flag"></i>日本語</a>
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
                                        <a class="dropdown-item text-white" href="#"><i
                                                class="flag-spain flag"></i>Español</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item text-white" href="#"><i
                                                class="flag-russia flag"></i>Русский</a>
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
            <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/solid.min.js"></script>
            <script type="text/javascript" src="js/home-page.js"></script>
        </body>

        </html>