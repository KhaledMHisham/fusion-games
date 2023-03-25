package gov.iti.fusion.persistence.repositories;

import java.util.List;

import gov.iti.fusion.models.CartItem;
import gov.iti.fusion.models.CartItemId;
import gov.iti.fusion.models.User;
import jakarta.persistence.Query;
import jakarta.servlet.http.HttpServletRequest;

public class CartItemRepository extends CrudRepository<CartItem, CartItemId> {

    public CartItemRepository(HttpServletRequest request) {
        super(request);
    }
    public CartItem findCartItem(String userId,String gameId){
        String jpql = "SELECT c FROM CartItem c WHERE w.user.id = :userId and w.game.id = :gameId ";
        Query query = entityManager.createQuery(jpql, CartItem.class);
        query.setParameter("userId", userId);
        query.setParameter("gameId", gameId);
        return (CartItem) query.getSingleResult();
    }



}
