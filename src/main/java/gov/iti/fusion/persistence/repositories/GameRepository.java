package gov.iti.fusion.persistence.repositories;


import gov.iti.fusion.models.Game;
import gov.iti.fusion.persistence.connection.JpaManagerSingleton;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Query;

public class GameRepository {
    
    private EntityManager entityManager = JpaManagerSingleton.INSTANCE.getEntityManager();
    EntityTransaction transaction = entityManager.getTransaction();

    public Game save(Game game) {
        transaction.begin();
        entityManager.persist(game);
        transaction.commit();
        return game;
    }

    public Game findGameByName(String name){
        String jpql = "SELECT g FROM Game g WHERE g.name = :name";
        Query query = entityManager.createQuery(jpql, Game.class);
        query.setParameter("name", name);
        return (Game) query.getSingleResult();
    }

    public Game delete(Game game){
        transaction.begin();
        entityManager.remove(game);
        transaction.commit();
        return game;
    }
    
}
