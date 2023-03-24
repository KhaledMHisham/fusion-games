package gov.iti.fusion.services;

import gov.iti.fusion.models.*;
import gov.iti.fusion.persistence.repositories.CartItemRepository;
import gov.iti.fusion.persistence.repositories.LibraryItemRepository;
import gov.iti.fusion.persistence.repositories.UserRepository;
import gov.iti.fusion.persistence.repositories.WishItemRepository;
import jakarta.servlet.http.HttpServletRequest;
import java.util.Collection;
import java.util.List;

public class UserService {
    private final UserRepository userRepository;
    private final LibraryItemRepository libraryItemRepository;
    private final CartItemRepository cartItemRepository;
    private final WishItemRepository wishItemRepository;
    public UserService(HttpServletRequest request) {
        this.userRepository = new UserRepository(request);
        this.libraryItemRepository = new LibraryItemRepository(request);
        this.cartItemRepository = new CartItemRepository(request);
        this.wishItemRepository = new WishItemRepository(request);

    }
    public User save(User user){
        return userRepository.save(user);
    }

    public User findById(String id){
        return userRepository.findById(User.class, id);
    }
    public List<User> findAll(){
        return userRepository.findAll(User.class);
    }
    public User deleteById(String id){
        return userRepository.deleteById(User.class, id);
    }

    public User findUserbyUsername(String username){
        return userRepository.findUserByUsername(username);
    }
    public User findUserbyEmail(String email){
        return userRepository.findUserByEmail(email);
    }
    public User findUserbyPhoneNumber(String phoneNumber){
        return userRepository.findUserByPhoneNumber(phoneNumber);
    }

    public void addGameToUserLibrary(User user, Game game){
        LibraryItem item = new LibraryItem(user, game);
        libraryItemRepository.save(item);
    }

    public void addGamesToUserLibrary(User user, Collection<Game> games){
        for(Game game : games){
            addGameToUserLibrary(user, game);
        }
    }

    public void addGameToCart(User user, Game game){
        CartItem item = new CartItem(user, game);
        cartItemRepository.save(item);
    }

    public void addGamesToCart(User user, Collection<Game>  games){
        for(Game game : games){
            addGameToCart(user, game);
        }
    }

    public void addGameToWishList(User user, Game game){
        WishItem item = new WishItem(user, game);
        wishItemRepository.save(item);
    }
    public void deleteGameFromWishList(User user, Game game){
        WishItem wishItem = wishItemRepository.findWishItemByUserIdAndGameId(user.getId(),game.getId());
        wishItemRepository.deleteById(WishItem.class, wishItem.getId());
    }

    public void addGamesToWishList(User user, Collection<Game>  games){
        for(Game game : games){
            addGameToWishList(user, game);
        }
    }

    public void removeGameFromCart(User user, Game game){
        CartItem cartItem = new CartItem(user, game);
        cartItemRepository.deleteById(CartItem.class, cartItem.getId());
    }
    public void removeGamesFromCart(User user, Collection<Game>  games){
        for(Game game : games){
            removeGameFromCart(user, game);
        }
    }

    public void removeGameFromWishList(User user, Game game){
        WishItem wishItem = new WishItem(user, game);
        wishItemRepository.deleteById(WishItem.class, wishItem.getId());
    }
    public void removeGamesFromWishList(User user, Collection<Game> games){
        for(Game game : games){
            removeGameFromWishList(user, game);
        }
    }
}
