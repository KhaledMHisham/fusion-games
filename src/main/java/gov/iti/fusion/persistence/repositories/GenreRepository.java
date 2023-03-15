package gov.iti.fusion.persistence.repositories;


import java.util.List;
import java.util.UUID;
import jakarta.persistence.Query;


import gov.iti.fusion.models.Genre;
import gov.iti.fusion.models.enums.GenreType;
import jakarta.servlet.http.HttpServletRequest;

public class GenreRepository extends CrudRepository<Genre, String> {
    
    public GenreRepository(HttpServletRequest request) {
        super(request);
    } 
    public Integer groupGameWithGenre(GenreType genreType){
        String jpql = "SELECT count(g.games) FROM Genre g group by genre having genre = GenreType.ACTION";
        Query query = entityManager.createQuery(jpql);
        return ((Integer) query.getSingleResult());
    }   
    
}
