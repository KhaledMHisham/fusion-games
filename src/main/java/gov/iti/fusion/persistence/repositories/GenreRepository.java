package gov.iti.fusion.persistence.repositories;


import gov.iti.fusion.models.Genre;
import gov.iti.fusion.persistence.connection.JpaManagerSingleton;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

public class GenreRepository {
    
    private EntityManager entityManager = JpaManagerSingleton.INSTANCE.getEntityManager();
    EntityTransaction transaction = entityManager.getTransaction();

    public Genre save(Genre genre) {
        transaction.begin();
        entityManager.persist(genre);
        transaction.commit();
        return genre;
    }

    public Genre find(Long id){
        return entityManager.find(Genre.class, id);
    }
    
}
