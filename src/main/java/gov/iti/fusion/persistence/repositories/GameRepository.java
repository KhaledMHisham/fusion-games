package gov.iti.fusion.persistence.repositories;


import java.util.UUID;

import gov.iti.fusion.models.Game;
import jakarta.persistence.Query;
import jakarta.servlet.http.HttpServletRequest;

public class GameRepository extends CrudRepository<Game, String>{
    
    public GameRepository(HttpServletRequest request) {
        super(request);
    }

    public Game findGameByName(String name){
        String jpql = "SELECT g FROM Game g WHERE g.name = :name";
        Query query = entityManager.createQuery(jpql, Game.class);
        query.setParameter("name", name);
        return (Game) query.getSingleResult();
    }
    
}
