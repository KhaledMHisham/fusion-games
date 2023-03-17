package gov.iti.fusion.persistence.repositories;

import gov.iti.fusion.models.LibraryItem;
import gov.iti.fusion.models.LibraryItemId;
import jakarta.servlet.http.HttpServletRequest;

public class LibraryItemRepository extends CrudRepository<LibraryItem, LibraryItemId> {

    public LibraryItemRepository(HttpServletRequest request) {
        super(request);
    }

}
