<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <header class="header-top">
    <!-- Jumbotron -->
    <div class=" p-3 text-center bg-main header">
      <div class="container">
        <div class="row gy-3">
          <!-- Left elements -->
          <div class="col-lg-2 col-sm-4 col-4">
            <a href="" class="float-start">
              <img class="rounded-circle" style="aspect-ratio: 1/1;" src="images/phoenix.png" height="50">
            </a>
          </div>
          <div class="order-lg-last col-lg-2 col-sm-2 col-8"></div>
          <!-- Left elements -->
          <!-- Center elements -->
          <div class="order-lg-last col-lg-5 col-sm-6 col-8">
            <div class="d-flex float-end">
              <a href="login" class="me-1 py-1 px-3 nav-link d-flex align-items-center navbar-link"> <i
                  class="fas fa-user-alt m-1 me-md-2 text-gold"></i>
                <c:choose>
                  <c:when test="${user ne null}">
                    <p class="d-none d-md-block mb-0 text-gold">Sign out</p>
                  </c:when>
                  <c:otherwise>
                    <p class="d-none d-md-block mb-0 text-gold">Sign in</p>
                  </c:otherwise>
                </c:choose>
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
          <div id="search-autocomplete" class="searchInput form-outline ">
            <input type="search" class="form-control  text-gold " />
            <label id="search-label" class="form-label text-gold search-label" for="search-form">Search</label>


            <div class="resultBox">

            </div>
          </div>
          <button id="search-button" type="button" class="btn btn-gold shadow-0">
            <i class="fas fa-search"></i>
          </button>

        </div>
        <!-- Right elements -->
      </div>
      <button class="navbar-toggler" type="button" data-mdb-toggle="collapse" data-mdb-target="#navbarLeftAlignExample"
        aria-controls="navbarLeftAlignExample" aria-expanded="false" aria-label="Toggle navigation">
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
            <a class="nav-link text-white" href="home">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="all-products">All Games</a>
          </li>

          <li class="nav-item">
            <c:choose>
              <c:when test="${user ne null}">
                <a class="nav-link" href="library-page">Library</a>
              </c:when>
              <c:otherwise>
                <a class="nav-link" href="login">Library</a>
              </c:otherwise>
            </c:choose>
          </li>
          <li class="nav-item">
            <c:choose>
              <c:when test="${user ne null}">
                <a href="wish-list" class="me-1 py-1 px-3 nav-link d-flex align-items-center navbar-link"> <i
                    class="fas fa-heart m-1 me-md-2 text-gold"></i>
              </c:when>
              <c:otherwise>
                <a href="login" class="me-1 py-1 px-3 nav-link d-flex align-items-center navbar-link"> <i
                    class="fas fa-heart m-1 me-md-2 text-gold"></i>
              </c:otherwise>
            </c:choose>
            <p class="d-none d-md-block mb-0 text-gold">Wishlist</p>
            </a>

          </li>
          <li class="nav-item">
            <c:choose>
              <c:when test="${user ne null}">
                <a href="cart" class="py-1 px-3 nav-link d-flex align-items-center navbar-link"> <i
                    class="fas fa-shopping-cart m-1 me-md-2 text-gold"></i>
              </c:when>
              <c:otherwise>
                <a href="login" class="py-1 px-3 nav-link d-flex align-items-center navbar-link"> <i
                    class="fas fa-shopping-cart m-1 me-md-2 text-gold"></i>
              </c:otherwise>
            </c:choose>
            <p class="d-none d-md-block mb-0 text-gold">My cart</p>
            </a>
          </li>

        </ul>
        <!-- Left links -->
      </div>
    </div>
    <!-- Container wrapper -->
  </nav>