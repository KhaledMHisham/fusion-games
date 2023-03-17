package gov.iti.fusion.persistence.repositories;

import gov.iti.fusion.models.OrderedGame;
import gov.iti.fusion.models.OrderedGameId;
import jakarta.servlet.http.HttpServletRequest;

public class OrderedGameRepository extends CrudRepository<OrderedGame, OrderedGameId> {
    public OrderedGameRepository(HttpServletRequest request) {
        super(request);
    }

}
