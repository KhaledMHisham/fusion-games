package gov.iti.fusion.persistence.repositories;


import gov.iti.fusion.models.Discount;
import gov.iti.fusion.persistence.connection.JpaManagerSingleton;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

public class DiscountRepository {
    
    private EntityManager entityManager = JpaManagerSingleton.INSTANCE.getEntityManager();
    EntityTransaction transaction = entityManager.getTransaction();

    public Discount save(Discount game) {
        transaction.begin();
        entityManager.persist(game);
        transaction.commit();
        return game;
    }

    public Discount find(Long id){
        return entityManager.find(Discount.class, id);
    }
    
}
