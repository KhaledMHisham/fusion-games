package gov.iti.fusion.persistence.repositories;


import java.util.List;
import java.util.UUID;

import com.mysql.cj.x.protobuf.MysqlxCrud.Limit;

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
    public List<Game> findTopNewer(int limit){
        String jpql = "SELECT g FROM Game g order by g.releaseDate";
        Query query = entityManager.createQuery(jpql, List.class);
        return ((List<Game>) query.setMaxResults(limit).getResultList());
    }
    
}
