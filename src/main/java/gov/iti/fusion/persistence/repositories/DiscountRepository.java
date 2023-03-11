package gov.iti.fusion.persistence.repositories;


import java.util.UUID;

import gov.iti.fusion.models.Discount;
import jakarta.servlet.http.HttpServletRequest;

public class DiscountRepository extends CrudRepository<Discount, UUID> {

    public DiscountRepository(HttpServletRequest request) {
        super(request);
    }
    

}
