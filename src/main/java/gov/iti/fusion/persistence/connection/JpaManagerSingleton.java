package gov.iti.fusion.persistence.connection;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public enum JpaManagerSingleton {
    
    INSTANCE;
    private EntityManagerFactory entityManagerFactory;

    public EntityManagerFactory getEntityManagerFactory(){
        return entityManagerFactory;
    }

    JpaManagerSingleton(){
        entityManagerFactory = Persistence.createEntityManagerFactory("fusion");
        
    }

}
