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
      <link href="css/checkout.css" rel="stylesheet" />
      <link href="css/header.css" rel="stylesheet" />
      <link href="css/add-to-cart.css" rel="stylesheet" />
      <link rel="shortcut icon" href="images/phoenix.png" type="image/x-icon" />


    </head>
    <jsp:include page="header.jsp" />
    <c:set var="totalCartPrice" value="${  user.getCartGames().stream()
      .map(g->g.getPrice()).reduce(0.0,(a, b) -> a + b)}" />
    <c:set var="totalCartNetPrice" value="${user.getCartGames().stream()
        .map(g->g.getNetPrice()).reduce(0.0,(a, b) -> a + b)}" />
    <c:set var="totalCartDiscount" value="${100-((totalCartNetPrice/totalCartPrice)*100)}" />
    <!-- <c:if test="${fn:length(user.getCartGames()) > 0}">
        <input hidden id="user-games" value="">
    </c:if> -->
    <body>



      <section class="bg-black py-5  bg-main">
        <div class="container">
          <div class="row">
            <div class="col-xl-8 col-lg-8 mb-4 border-radius bg-main checkout-border">

              <!-- Checkout -->
              <div class="shadow-0 border-gold text-gold">
                <div class="p-4">
                  <h5 class="card-title mb-3">Guest checkout</h5>
                  <div class="row">
                    <div class="col-6 mb-3">
                      <p class="mb-0">First name</p>
                      <div class="form-outline">
                        <input type="text" id="first-name" placeholder="Type here" class="form-control text-white" />
                        <span id="first-name-error" style="font-size: 10px;" class="float-end text-danger"></span>

                      </div>
                    </div>

                    <div class="col-6">
                      <p class="mb-0">Last name</p>
                      <div class="form-outline">
                        <input type="text" id="last-name" placeholder="Type here" class="form-control text-white" />
                        <span id="last-name-error" style="font-size: 10px;" class="float-end text-danger"></span>

                      </div>
                    </div>

                    <div class="col-6 mb-3">
                      <p class="mb-0">Phone</p>
                      <div class="form-outline">
                        <input type="tel" id="phone" value="+02 " class="form-control text-white" />
                        <span id="phone-error" style="font-size: 10px;" class="float-end text-danger"></span>

                      </div>
                    </div>

                    <div class="col-6 mb-3">
                      <p class="mb-0">Email</p>
                      <div class="form-outline">
                        <input type="email" id="email" placeholder="example@gmail.com"
                          class="form-control text-white" />
                          <span id="email-error" style="font-size: 10px;" class="float-end text-danger"></span>

                      </div>
                    </div>
                  </div>

                  <div class="form-check">
                    <input class="form-check-input keep-me-up-checkbtn" type="checkbox" value=""
                      id="flexCheckDefault" />
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
                              <input type="text" id="card-num" placeholder="Card Number"
                                class="form-control text-white" />
                                <span id="card-num-error" style="font-size: 10px;" class="float-end text-danger"></span>

                            </div>
                          </div>
                        </div>
                        <div class="col-6 mb-3">
                          <p class="mb-0">CVV</p>
                          <div class="form-outline">
                            <input type="text" id="cvv-num" placeholder="CVV number" class="form-control text-white" />
                            <span id="cvv-num-error" style="font-size: 10px;" class="float-end text-danger"></span>

                          </div>
                        </div>
                      </div>
                      <div class="col-6 mb-3">
                        <p class="mb-0">Credit Holder Name</p>
                        <div class="form-outline">
                          <input type="text" id="card-owner-name" placeholder="type your name"
                            class="form-control text-white" />
                            <span id="card-owner-name-error" style="font-size: 10px;" class="float-end text-danger"></span>

                        </div>
                      </div>
                    </div>
                    <div class="float-end">
                      <a onclick="cancel()" id="add-cart"
                        class="card-btn btn btn-gold btn-black mx-2 my-3 float-start text-cart">Cancel</a>
                      <a onclick="checkOut()"
                        class="card-btn btn btn-gold hover-black float-start my-3 text-cart">Checkout</a>
                      <!-- <button class="btn btn-dark border btn-gold m-4">Cancel</button>
                      <button class="btn btn-success shadow-0 border btn-gold m-4">Continue</button> -->
                    </div>

                  </div>

                </div>
              </div>
              <!-- Checkout -->
              <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel">Warning</h5>
                    </div>
                    <div class="modal-body">Please, Recahrge Your Balance Before Checkout </div>
                    <div class="modal-footer">
                      <button onclick="hide()" type="button" class="btn btn-black">Close</button>
                      <button onclick="backHome()" type="button" class="btn btn-gold">Back To Home</button>
                    </div>
                  </div>
                </div>
              </div>

            </div>
            <div class="col-xl-4 col-lg-4 d-flex justify-content-center text-gold">
              <div class="ms-lg-4 mt-4 mt-lg-0" style="max-width: 320px;">
                <h6 class="mb-3 text-white">Summary</h6>
                <div class="d-flex justify-content-between">
                  <p class="mb-2">Total price:</p>
                  <p id="totalCartPrice" class="mb-2">$${totalCartPrice}</p>
                </div>
                <div class="d-flex justify-content-between">
                  <p class="mb-2">Discount:</p>
                  <p id="totalCartDiscount" class="mb-2 text-danger">%${totalCartDiscount}
                  </p>
                </div>
                <hr />
                <div class="d-flex justify-content-between">
                  <p class="mb-2">Total price:</p>
                  <p id="totalCartNetPrice" class="mb-2 fw-bold">$${totalCartNetPrice}</p>
                </div>
                <hr />
                <h6 class="text-dark text-white my-4">Items in cart</h6>
                
                  <c:forEach items="${user.getCartGames()}" var="game">
                  <div class="row justify-content-between" id="${game.id}">
                    <div class="col-md-10 col-md-10 col-lg-10 col-xl-10  d-flex mb-4"> 
                      <a href="product?name=${game.name}">
                        <div class="me-3 position-relative">
                          <img src="${game.pictureUrl}" />
                        </div>
                      </a>
                      <div class="">
                        <a href="#" class="nav-link">
                          ${game.name} <br />
                        </a>
                        <div class="price text-muted">${game.price}</div>
                      </div>
                    </div>
                    <div class="col-sm-1 col-md-1 col-lg-1 col-xl-1 text-end">
                      <a onclick='deleteGameFromCart("${game.id}")'  class="text-danger"><i
                        class="fas fa-remove cursor-pointer fa-2xl"></i></a>
                      </div>
                    </div>
                  </c:forEach>



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
    </body>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/js/bootstrap.min.js"></script>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
    <script src="js/header.js"></script>
    <script src="js/checkout.js"></script>

    </html>