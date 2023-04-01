  <%@taglib prefix="c" uri="jakarta.tags.core" %>
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <meta charset="UTF-8">
      <title>Fusion Cart</title>
      <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
      <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
      <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.css" rel="stylesheet" />
      <link href="css/checkout.css" rel="stylesheet" />
      <link href="css/header.css" rel="stylesheet" />
      <link href="css/add-to-cart.css" rel="stylesheet" />
      <link rel="shortcut icon" href="images/phoenix.png" type="image/x-icon"/>


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
                  <h5 class="card-title mb-3">Checkout</h5>
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
                        <input type="tel" id="phone" value="+20 " class="form-control text-white" />
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
                              <input type="text" id="card-num" placeholder="1111-1111-1111-1111"
                                class="form-control text-white" />
                                <span id="card-num-error" style="font-size: 10px;" class="float-end text-danger"></span>

                            </div>
                          </div>
                        </div>
                        <div class="col-6 mb-3">
                          <p class="mb-0">CVV</p>
                          <div class="form-outline">
                            <input type="text" id="cvv-num" placeholder="123" class="form-control text-white" />
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
                  <p id="totalCartPrice" class="mb-2">$${totalCartPrice.intValue()}</p>
                </div>
                <div class="d-flex justify-content-between">
                  <p class="mb-2">Discount:</p>
                  <p id="totalCartDiscount" class="mb-2 text-danger">%<c:out value="${totalCartDiscount.intValue()}"/></p>
                </div>
                <hr />
                <div class="d-flex justify-content-between">
                  <p class="mb-2">Total price:</p>
                  <p id="totalCartNetPrice" class="mb-2 fw-bold">$${totalCartNetPrice.intValue()}</p>
                </div>
                <hr />
                <h6 class="text-dark text-white my-4">Items in cart</h6>
                
                  <c:forEach items="${user.getCartGames()}" var="game">
                  <div class="row justify-content-between" id="${game.id}">
                    <div class="col-md-10 col-md-10 col-lg-10 col-xl-10  d-flex mb-4"> 
                      <a href="product?name=${game.name}">
                        <div class="me-3 position-relative">
                          <img src="${game.pictureUrl}" width="100px" />
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


      <jsp:include page="footer.jsp" />

    </body>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/js/bootstrap.min.js"></script>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
    <script src="js/header.js"></script>
    <script src="js/checkout.js"></script>

    </html>