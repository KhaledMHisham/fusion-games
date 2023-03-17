package gov.iti.fusion.persistence.repositories;

import gov.iti.fusion.models.GameGenre;
import gov.iti.fusion.models.GameGenreId;
import jakarta.servlet.http.HttpServletRequest;

public class GameGenreRepository extends CrudRepository<GameGenre, GameGenreId> {
    public GameGenreRepository(HttpServletRequest request) {
        super(request);
    }
}
