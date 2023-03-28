<%@taglib prefix="c" uri="jakarta.tags.core" %>
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <meta charset="UTF-8">
      <title>Fusion Library</title>
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
                <h3 class="fw-normal mb-0 text-gold">Owned Games</h3>
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
                          <img src="${game.pictureUrl}" class=" mb-2 img-fluid rounded-3 ">
                        </a>

                      </div>
                      <div class="col-md-11 col-lg-9 col-xl-4">
                        <p class="lead fw-normal mb-2">${game.name}</p>
                        <p><span class="text-muted mx-1">Genre: </span>${game.getGenres()[0].genre.genre}<span
                            class="mx-1 text-muted">Release Date: </span>${game.releaseDate}</p>
                      </div>
                      <div class="col-md-9 col-lg-7 col-xl-2 offset-lg-1">
                        <h5 class="mb-0">$${game.price.intValue()}</h5>
                      </div>
                      <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                        <a  class="bg-transparent border-0 shadow-0 text-gold" href='http://localhost:8888/fusion/${game.gameFileUrl}' target="_blank"><i
                          class="fas fa-download cursor-pointer fa-2xl"></i></a>
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
      <jsp:include page="footer.jsp" />

      <!-- Footer -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.js"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/solid.min.js"></script>
      <script type="text/javascript" src="js/header.js"></script>
      <script type="text/javascript" src="js/add-to-cart.js"></script>

    </body>

    </html>