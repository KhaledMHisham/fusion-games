package gov.iti.fusion.services;

import gov.iti.fusion.models.Game;
import gov.iti.fusion.models.User;
import gov.iti.fusion.persistence.repositories.UserRepository;
import jakarta.servlet.http.HttpServletRequest;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class UserService {
    private final UserRepository userRepository;
    public UserService(HttpServletRequest request) {
        this.userRepository = new UserRepository(request);
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

    public User addGameToUserLibrary(User user, Game game){
        Set<Game> library = user.getLibrary();
        if(library == null){
            library = new HashSet<>();
        }
        user.setLibrary(library);
        library.add(game);
        userRepository.save(user);
        return user;
    }

    public User addGamesToUserLibrary(User user, Set<Game> games){
        Set<Game> library = user.getLibrary();
        if(library == null){
            library = new HashSet<>();
        }
        user.setLibrary(library);
        library.addAll(games);
        userRepository.save(user);
        return user;
    }
}
