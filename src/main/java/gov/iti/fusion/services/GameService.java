package gov.iti.fusion.services;

import gov.iti.fusion.models.Game;
import gov.iti.fusion.persistence.repositories.GameRepository;

public class GameService {
    
    private final GameRepository gameRepository = new GameRepository();

    public Game save(Game game){
        return gameRepository.save(game);
    }

    public Game findGameByName(String name){
        return gameRepository.findGameByName(name);
    }
    public Game delete(Game game){
        return gameRepository.delete(game);
    }
        
}
