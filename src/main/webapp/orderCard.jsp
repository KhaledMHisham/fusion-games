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