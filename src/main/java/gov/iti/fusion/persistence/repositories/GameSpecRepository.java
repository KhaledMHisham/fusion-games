package gov.iti.fusion.persistence.repositories;

import gov.iti.fusion.models.Game;
import gov.iti.fusion.models.GameSpec;
import jakarta.servlet.http.HttpServletRequest;

public class GameSpecRepository extends CrudRepository<Game, GameSpec>{

    public GameSpecRepository(HttpServletRequest request) {
        super(request);
    }

    
}
