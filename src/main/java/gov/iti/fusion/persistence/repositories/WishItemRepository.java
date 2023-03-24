package gov.iti.fusion.persistence.repositories;

import gov.iti.fusion.models.User;
import gov.iti.fusion.models.WishItem;
import gov.iti.fusion.models.WishItemId;
import jakarta.persistence.Query;
import jakarta.servlet.http.HttpServletRequest;

public class WishItemRepository extends CrudRepository<WishItem, WishItemId> {

    public WishItemRepository(HttpServletRequest request) {
        super(request);
    }
    public WishItem findWishItemByUserIdAndGameId(String userId,String gameId){
        String jpql = "SELECT w FROM WishItem w WHERE w.user.id = :userId and w.game.id = :gameId ";
        Query query = entityManager.createQuery(jpql, WishItem.class);
        query.setParameter("userId", userId);
        query.setParameter("gameId", gameId);
        return (WishItem) query.getSingleResult();
    }


}
