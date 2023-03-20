package gov.iti.fusion.persistence.repositories;

import gov.iti.fusion.models.Order;
import jakarta.servlet.http.HttpServletRequest;

public class OrderRepository extends CrudRepository<Order, String> {

    public OrderRepository(HttpServletRequest request) {
        super(request);
    }
  
}
