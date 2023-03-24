package gov.iti.fusion.services;

import java.util.Collection;
import java.util.List;

import gov.iti.fusion.models.*;
import gov.iti.fusion.persistence.repositories.GameGenreRepository;
import gov.iti.fusion.persistence.repositories.GameRepository;
import gov.iti.fusion.persistence.repositories.PlatformGameRepository;
import gov.iti.fusion.persistence.repositories.PlatformsRepository;
import jakarta.servlet.http.HttpServletRequest;

public class GameService {
    
    private final GameRepository gameRepository;
    private final PlatformGameRepository platformGameRepository;
    private final GameGenreRepository gameGenreRepository;

    public GameService(HttpServletRequest request) {
        this.gameRepository = new GameRepository(request);
        this.platformGameRepository = new PlatformGameRepository(request);
        this.gameGenreRepository = new GameGenreRepository(request);
    }

    public Game save(Game game){
        return gameRepository.save(game);
    }

    public Game findById(String id){
        return gameRepository.findById(Game.class,id);
    }
    public Game findGameByName(String name){
        return gameRepository.findGameByName(name);
    }
    
    public Game deleteById(String id){
        return gameRepository.deleteById(Game.class, id);
    }
    public List<Game> findAllGames(){
        return gameRepository.findAll(Game.class);
    }   
    public List<Game> findTopNewer(int limit){
        return gameRepository.findTopNewer(limit);
    }   
    public List<Game> findFreeGames(int limit){
        return gameRepository.findFreeGames(limit);
    }  
    public List<Game> findGamesWithNoDiscount(){
        return gameRepository.findGamesWithNoDiscount();
    } 
    public List<Game> findGamesOnSale(){
        return gameRepository.findGamesOnSale();
    }
    public List<Game> findMostOrderedGames(int limit){
        return gameRepository.findMostOrderedGames(limit);
    }
    public List<Game> findRecomendedGamesForUser(User user ,int limit){
        return gameRepository.findRecomendedGamesForUser(user,limit);
    }
    public void addPlatformToGame(Game game, Platform platform){
        PlatformGame platformGame = new PlatformGame(game, platform);
        platformGameRepository.save(platformGame);
    }
    public void addPlatformsToGame(Game game, Collection<Platform> platforms){
        for(Platform platform : platforms){
            addPlatformToGame(game, platform);
        }
    }

    public void addGenreToGame(Game game, Genre genre){
        GameGenre gameGenre = new GameGenre(game, genre);
        gameGenreRepository.save(gameGenre);
    }
    public void addGenresToGame(Game game, Collection<Genre> genres){
        for(Genre genre  : genres){
            addGenreToGame(game, genre);
        }
    }
}
