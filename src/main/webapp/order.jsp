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
                        <!-- /////////////////////////////////////////////////////////////////////////////////// -->

                    <div class="bg-main p-3 col-lg-8 col-md-8 col-sm-12 rounded-2 d-flex flex-column justify-content-between">
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

            <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/solid.min.js"></script>
            <script type="text/javascript" src="js/order.js"></script>

        </body>

        </html>