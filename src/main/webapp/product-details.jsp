<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%@taglib prefix="c" uri="jakarta.tags.core" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta http-equiv="content-type" content="text/html; charset=UTF-8">
            <meta charset="UTF-8">
            <title>Fusion-Game</title>
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
            <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
            <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.css" rel="stylesheet" />
            <link href="css/home-page.css" rel="stylesheet" />
            <link href="css/header.css" rel="stylesheet" />
            <link href="css/add-to-cart.css" rel="stylesheet" />
            <link rel="shortcut icon" href="images/phoenix.png" type="image/x-icon" />


        </head>

        <body class="bg-black">

            <!--Main Navigation-->
            <jsp:include page="header.jsp" />

            <!-- <div class="page-offset"></div> -->

            <div class="container">
                <div class="row justify-content-around">
                    <div class="col-lg-7 col-md-7 col-sm-12 p-3">
                        <img class="img-fluid rounded-5" src="${game.pictureUrl}">
                        <p class="pt-3">${game.description}</p>
                        <!-- <p class="pt-3"><c:out value="${game.genres}"/></p> -->
                        <div class="row pt-1">
                            <div class="col-6 border-start border-1 border-gold">
                                <p class="m-0 mb-1">Genres</p>
                                <p class="m-0" style="font-size:small">
                                    <c:forEach items="${game.getGenres()}" var="genr">
                                        ${genr.genre} &ThinSpace;
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
                                        <p class="text-muted mx-3"> <del>&dollar;${game.price.intValue()}</del></p>
                                    </div>
                                    <div class="col-2">
                                        <p class="text-white mx-3"> &dollar;${game.getNetPrice().intValue()} </p>
                                    </div>
                                </div>
                            </c:when>


                            <c:otherwise>
                                <div class="col-2">
                                    <h5 class="text-white mx-3">&dollar;${game.price.intValue()}</h5>
                                </div>
                            </c:otherwise>
                        </c:choose>
        <c:choose>
            <c:when test="${user ne null}">
                <c:choose>
                    <c:when test="${user.getOwnedGames().contains(game)}">
                        <a href="library-page" class="btn w-100 border-0 p-2 m-2 rounded-5 text-white btn-black">Owned</a>
                    </c:when>
                   
            <c:when test="${user.getCartGames().contains(game)}">
            <a href="cart" class="btn w-100 border-0 p-2 m-2 rounded-5 text-white btn-black"><i
                    class="fas fa-shopping-cart m-1 me-md-2 text-gold"></i>View In Cart</a>
            </c:when>
            <c:otherwise>
                <a onclick='buyNowGame("${game.id}")' class="btn w-100 border-0 p-2 m-2 rounded-5 text-black bg-gold">BUY NOW</a>
            </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${user.getWishList().contains(game)}">
                        <button onclick='addToWishList(this,"${game.id}")'  class="btn w-100 border-0 p-2 m-2 rounded-5 text-white bg-main"><i
                    class="heart-checked fas fa-heart m-1 me-md-2 text-gold"></i>ADD TO WISHLIST</button>
                </c:when>
                <c:otherwise>
                    <button onclick='addToWishList(this,"${game.id}")'  class="btn w-100 border-0 p-2 m-2 rounded-5 text-white bg-main"><i
                    class="fas fa-heart m-1 me-md-2 text-white"></i>ADD TO WISHLIST</button>
                </c:otherwise>
            </c:choose>
            </c:when>
                <c:otherwise>
                    <a href="login" class="btn w-100 border-0 p-2 m-2 rounded-5 text-white bg-main"><i
                        class="fas fa-shopping-cart m-1 me-md-2 text-white"></i>ADD TO CART</a>
                <a href="login" class="btn w-100 border-0 p-2 m-2 rounded-5 text-white bg-main"><i
                        class="fas fa-heart m-1 me-md-2 text-white"></i>ADD TO WISHLIST</a>
                </c:otherwise>
            </c:choose>

                        <div class="row px-2 pe-2">
                            <div
                                class="col-12 d-flex flex-row justify-content-between mt-3 border-1 border-bottom border-gold">
                                <p>Developer</p>
                                <p>${game.developer}</p>
                            </div>
                        </div>
                        <div class="row px-2 pe-2">
                            <div
                                class="col-12 d-flex flex-row justify-content-between mt-3 border-1 border-bottom border-gold">
                                <p>Publisher</p>
                                <p>${game.publisher}</p>
                            </div>
                        </div>
                        <div class="row px-2 pe-2">
                            <div
                                class="col-12 d-flex flex-row justify-content-between mt-3 border-1 border-bottom border-gold">
                                <p>Release Date</p>
                                <p>${game.releaseDate}</p>
                            </div>
                        </div>
                        <div class="row px-2 pe-2">
                            <div
                                class="col-12 d-flex flex-row justify-content-between mt-3 border-1 border-bottom border-gold">
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
                                <p class="text-white-50 m-0 mt-2">Processor</p>
                                <p class="m-0">${game.minimumSpec.processor}</p>
                                <p class="text-white-50 m-0 mt-2">Memory</p>
                                <p class="m-0">${game.minimumSpec.memory}</p>
                                <p class="text-white-50 m-0 mt-2">Storage</p>
                                <p class="m-0">${game.minimumSpec.storage}</p>
                                <p class="text-white-50 m-0 mt-2">Direct X</p>
                                <p class="m-0">${game.minimumSpec.directXVersion}</p>
                                <p class="text-white-50 m-0 mt-2">Graphics</p>
                                <p class="m-0">${game.minimumSpec.graphicsCard}</p>
                            </div>

                            <div class="col-5">
                                <h6 class="text-white-50 m-0 mt-2 mb-4">Recommended</h6>
                                <p class="text-white-50 m-0 mt-2">Processor</p>
                                <p class="m-0">${game.recommendedSpec.processor}</p>
                                <p class="text-white-50 m-0 mt-2">Memory</p>
                                <p class="m-0">${game.recommendedSpec.memory}</p>
                                <p class="text-white-50 m-0 mt-2">Storage</p>
                                <p class="m-0">${game.recommendedSpec.storage}</p>
                                <p class="text-white-50 m-0 mt-2">Direct X</p>
                                <p class="m-0">${game.recommendedSpec.directXVersion}</p>
                                <p class="text-white-50 m-0 mt-2">Graphics</p>
                                <p class="m-0">${game.recommendedSpec.graphicsCard}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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