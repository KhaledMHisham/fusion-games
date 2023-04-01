<%@taglib prefix="c" uri="jakarta.tags.core" %>
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <meta charset="UTF-8">
      <title>Orders</title>
      <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
      <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
      <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.css" rel="stylesheet" />
      <link href="css/home-page.css" rel="stylesheet" />
      <link href="css/products.css" rel="stylesheet" />
      <link href="css/header.css" rel="stylesheet" />
      <link href="css/add-to-cart.css" rel="stylesheet" />
      <link rel="shortcut icon" href="images/phoenix.png" type="image/x-icon" />



     
    </head>

    <body class="bg-black">

      <!--Main Navigation-->
      <jsp:include page="header.jsp" />

      <section class="h-100 bg-black">
        <div class="container h-100 py-5">
          <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-10">

              <div class="d-flex justify-content-between align-items-center mb-4">
                <h3 class="fw-normal mb-0 text-gold">User: ${client.getFirstName()} &ThinSpace; ${client.getLastName()} </h3>
                <div>
                  <p class="mb-0"><span class="text-muted">Sort by:</span> <a href="#!" class="text-body">price <i
                        class="fas fa-angle-down mt-1"></i></a></p>
                </div>
              </div>
              <c:forEach items="${clientOrders}" var="order">
                <section class="h-100 gradient-custom">
                  <div class="container py-5 h-100">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                      <div class="col-lg-10 col-xl-8">
                        <div class="bg-dark " style="border-radius: 10px;">
                          <div class="card-body p-4">
                            <div class="d-flex justify-content-between align-items-center mb-4">
                              <p class="lead fw-normal mb-0 text-gold" >Receipt</p>
                            </div>
                            <!-- Games -->
                            <c:set var="orderNetPrice" value="0" scope="page" />
                            <c:set var="orderTotalPrice" value="0" scope="page" />
                            <c:forEach items="${order.getOrderedGames()}" var="game">
                              <c:set var="orderTotalPrice" value="${orderTotalPrice + game.price}" scope="page"/>
                              <c:set var="orderNetPrice" value="${orderNetPrice + game.netPrice}" scope="page"/>
                              <div class="shadow-0 mb-4">
                              <div class="card-body">
                                <div class="row">
                                  <div class="col-md-4 col-xl-3 col-lg-4">
                                    <img src="${game.pictureUrl}"
                                      class="img-fluid" alt="Phone">
                                  </div>
                                  <div class="col-md-4 col-lg-4 col-xl-5 text-center d-flex justify-content-center align-items-center">
                                    <p class="text-gold mb-0">${game.name}</p>
                                  </div>
                    
                                  <div class="col-md-2 col-xl-2 col-lg-2 text-center d-flex justify-content-center align-items-center">
                                    <p class="text-muted mb-0 small">Genre: ${game.getGenres()[0].genre.genre}</p>
                                  </div>
                                  <div class="col-md-2 col-xl-2 col-lg-2  text-center d-flex justify-content-center align-items-center">
                                    <p class="text-muted mb-0 small"><span><del>${game.price}</del>&ThickSpace;</span>$${game.netPrice}</p>
                                  </div>
                                </div>
                                <hr class="mb-4 opacity-1 text-gold">
                              </div>
                            </div>
                          
                            </c:forEach>
                            <c:set var="totalOrderDiscount" value="${100-((orderNetPrice/orderTotalPrice)*100)}" />
                            <div class="d-flex justify-content-between pt-2">
                              <p class="fw-bold mb-1">Order Details</p>
                              <p class="text-muted mb-0"><span class="fw-bold me-4">Total Price</span>$${order.totalPrice}</p>
                            </div>
                            <div class="d-flex justify-content-between pt-2">
                              <p class="text-white mb-0">Invoice Date: <span class="text-muted">${order.createdAt}</span></p>

                              <p class="text-muted mb-0"><span class="fw-bold me-4">Discount</span>${totalOrderDiscount.intValue()}%</p>
                            </div>
                            <div class="d-flex justify-content-between">
                              <p class="text-white mb-0">OrderId:  <span class="text-muted">${order.id}</span></p>

                            </div>
                          </div>
                          <div class="card-footer border-0 rounded-bottom p-2 bg-gold">
                            <p class="d-flex align-items-center justify-content-end text-white text-uppercase mb-0">
                              Total paid: <span class=" mb-0 ms-2">$${order.totalPrice}</span></p>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </section>
              </c:forEach>
            </div>
          </div>
        </div>
      </section>

      <!-- Footer -->
      <jsp:include page="footer.jsp" />

      <!-- Footer -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.js"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/solid.min.js"></script>
      <script type="text/javascript" src="js/header.js"></script>
    </body>

    </html>