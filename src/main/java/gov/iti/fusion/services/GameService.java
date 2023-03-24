package gov.iti.fusion.services;

import java.util.Collection;
import java.util.List;
import java.util.Set;

import gov.iti.fusion.models.*;
import gov.iti.fusion.persistence.repositories.*;
import jakarta.servlet.http.HttpServletRequest;
import org.eclipse.tags.shaded.org.apache.xpath.operations.Or;

public class GameService {
    
    private final GameRepository gameRepository;
    private final PlatformGameRepository platformGameRepository;
    private final GameGenreRepository gameGenreRepository;
    private final OrderedGameRepository orderedGameRepository;
    private final WishItemRepository wishItemRepository;
    private final LibraryItemRepository libraryItemRepository;
    private final CartItemRepository cartItemRepository;
    public GameService(HttpServletRequest request) {
        this.gameRepository = new GameRepository(request);
        this.platformGameRepository = new PlatformGameRepository(request);
        this.gameGenreRepository = new GameGenreRepository(request);
        this.orderedGameRepository = new OrderedGameRepository(request);
        this.wishItemRepository = new WishItemRepository(request);
        this.libraryItemRepository = new LibraryItemRepository(request);
        this.cartItemRepository = new CartItemRepository(request);
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
    public Game findById(String id){
        return gameRepository.findById(Game.class, id);
    }
    public Game deleteById(String id){
        Game game = gameRepository.findById(Game.class, id);
        clearGenresFromGame(game);
        clearPlatformsFromGame(game);
        clearCartItemsFromGame(game);
        clearLibraryItemsFromGame(game);
        clearOrdersFromGame(game);
        clearWishItemsFromGame(game);
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

    public void clearGenresFromGame(Game game){

        Set<GameGenre> gameGenres = game.getGameGenres();
        gameGenres.forEach(gameGenre -> gameGenreRepository
                                                        .deleteById(GameGenre.class, gameGenre.getId()));
    }

    public void clearPlatformsFromGame(Game game){
        Set<PlatformGame> gamePlatforms = game.getPlatformGames();
        gamePlatforms.forEach(platformGame -> platformGameRepository
                                                    .deleteById(PlatformGame.class, platformGame.getId()));
    }

    public void clearOrdersFromGame(Game game){
        Set<OrderedGame> orderedGames = game.getOrderedGames();
        orderedGames.forEach(orderedGame -> orderedGameRepository
                                                    .deleteById(OrderedGame.class, orderedGame.getId()));
    }

    public void clearWishItemsFromGame(Game game){
        Set<WishItem> wishItems = game.getWishItems();
        wishItems.forEach(wishItem -> wishItemRepository
                                                    .deleteById(WishItem.class, wishItem.getId()));
    }

    public void clearLibraryItemsFromGame(Game game){
        Set<LibraryItem> libraryItems = game.getLibraryItems();
        libraryItems.forEach(libraryItem -> libraryItemRepository
                                                    .deleteById(LibraryItem.class, libraryItem.getId()));
    }

    public void clearCartItemsFromGame(Game game){
        Set<CartItem> cartItems = game.getCartItems();
        cartItems.forEach(cartItem -> cartItemRepository
                                                    .deleteById(CartItem.class, cartItem.getId()));
    }
}
