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
        String jpql = "SELECT g FROM Game g order by g.releaseDate desc";
        Query query = entityManager.createQuery(jpql, List.class);
        return ((List<Game>) query.setMaxResults(limit).getResultList());
    }
    public List<Game> findFreeGames(int limit){
        String jpql = "SELECT g FROM Game g where g.discount.type = DiscountType.FREE  order by g.releaseDate desc";
        Query query = entityManager.createQuery(jpql, List.class);
        return ((List<Game>) query.setMaxResults(limit).getResultList());
    }
    public List<Game> findGamesWithNoDiscount(){
        String jpql = "SELECT g FROM Game g where g.discount is null";
        Query query = entityManager.createQuery(jpql, List.class);
        return ((List<Game>) query.getResultList());
    }
    public List<Game> findGamesOnSale(){
        String jpql = "SELECT g FROM Game g where g.discount is not null and g.discount.type <> DiscountType.FREE";
        Query query = entityManager.createQuery(jpql, List.class);
        return ((List<Game>) query.getResultList());
    }
    public List<Game> findMostOrderedGames(int limit){

        String jpql = "select g from Game g"+ 
                        " join(SELECT og.id.gameId ogid, count(og.id.gameId) coun FROM OrderedGame og"+
                        " group by (og.id.gameId)) c on c.ogid = g.id order by c.coun desc ";
        Query query = entityManager.createQuery(jpql, List.class);
        return ((List<Game>) query.setMaxResults(limit).getResultList());
    }
}
