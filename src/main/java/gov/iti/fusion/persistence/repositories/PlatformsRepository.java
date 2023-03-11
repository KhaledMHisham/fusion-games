package gov.iti.fusion.persistence.repositories;


import gov.iti.fusion.models.Platform;
import gov.iti.fusion.persistence.connection.JpaManagerSingleton;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

public class PlatformsRepository {
    
    private EntityManager entityManager = JpaManagerSingleton.INSTANCE.getEntityManager();
    EntityTransaction transaction = entityManager.getTransaction();

    public Platform save(Platform platform) {
        transaction.begin();
        entityManager.persist(platform);
        transaction.commit();
        return platform;
    }

    public Platform find(Long id){
        return entityManager.find(Platform.class, id);
    }
    
}
