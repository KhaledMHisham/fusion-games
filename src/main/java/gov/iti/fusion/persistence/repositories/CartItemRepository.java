package gov.iti.fusion.persistence.repositories;

import gov.iti.fusion.models.CartItem;
import gov.iti.fusion.models.CartItemId;
import jakarta.servlet.http.HttpServletRequest;

public class CartItemRepository extends CrudRepository<CartItem, CartItemId> {

    public CartItemRepository(HttpServletRequest request) {
        super(request);
    }

}
