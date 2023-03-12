package gov.iti.fusion.persistence.repositories;


import java.util.UUID;

import gov.iti.fusion.models.Platform;
import jakarta.servlet.http.HttpServletRequest;

public class PlatformsRepository extends CrudRepository<Platform, String> {
    
    public PlatformsRepository(HttpServletRequest request) {
        super(request);
    }    
}
