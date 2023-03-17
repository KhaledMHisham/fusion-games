package gov.iti.fusion.persistence.repositories;

import gov.iti.fusion.models.WishItem;
import gov.iti.fusion.models.WishItemId;
import jakarta.servlet.http.HttpServletRequest;

public class WishItemRepository extends CrudRepository<WishItem, WishItemId> {

    public WishItemRepository(HttpServletRequest request) {
        super(request);
    }

}
