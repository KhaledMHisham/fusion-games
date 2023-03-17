package gov.iti.fusion.persistence.repositories;

import gov.iti.fusion.models.PlatformGame;
import gov.iti.fusion.models.PlatformGameId;
import jakarta.servlet.http.HttpServletRequest;

public class PlatformGameRepository extends CrudRepository<PlatformGame, PlatformGameId> {

    public PlatformGameRepository(HttpServletRequest request) {
        super(request);
    }

}
