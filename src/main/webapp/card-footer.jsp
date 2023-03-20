<%@taglib prefix="c" uri="jakarta.tags.core" %>

<div class="card-footer px-2">
    <c:choose>
      <c:when test="${user ne null}">
        <c:choose>
          <c:when test="${user.getCartItems().contains(game)}">
            <a onclick='sucessAddedToCart(this)' id="add-cart" class="card-btn btn btn-gold float-start w-75 text-cart">View In Cart</a>
          </c:when>
          <c:otherwise>
            <a onclick='addToCart(this,"${game.id}")' id="add-cart" class="card-btn btn btn-gold float-start w-75 text-cart">Add to cart</a>
          </c:otherwise>
        </c:choose>
      <a onclick='addToWishList(this,"${game.id}")' class="btn btn-light border mx-1 px-2 pt-2 float-end icon-hover bg-black shadow-0">
      <i class="fas fa-heart fa-lg px-1 text-white"></i></a>
    </c:when>
    <c:otherwise>
      <a href="login" class="card-btn btn btn-gold float-start w-75 text-cart">Add to cart</a>
      <a href="login" class="btn btn-light border mx-1 px-2 pt-2 float-end icon-hover bg-black shadow-0">
        <i class="fas fa-heart fa-lg px-1 text-white"></i></a>
    </c:otherwise>
    </c:choose>
  </div>