package gov.iti.fusion.persistence.repositories;


import java.util.UUID;

import gov.iti.fusion.models.Genre;
import jakarta.servlet.http.HttpServletRequest;

public class GenreRepository extends CrudRepository<Genre, String> {
    
    public GenreRepository(HttpServletRequest request) {
        super(request);
    }    
}
