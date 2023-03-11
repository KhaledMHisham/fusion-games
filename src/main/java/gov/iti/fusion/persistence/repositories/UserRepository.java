package gov.iti.fusion.persistence.repositories;

import java.util.UUID;
import gov.iti.fusion.models.User;
import jakarta.persistence.Query;
import jakarta.servlet.http.HttpServletRequest;

public class UserRepository extends CrudRepository<User, UUID> {
    
    public UserRepository(HttpServletRequest request) {
        super(request);
    }

    public User findUserByUsername(String username){
        String jpql = "SELECT u FROM User u WHERE u.username = :username";
        Query query = entityManager.createQuery(jpql, User.class);
        query.setParameter("username", username);
        return (User) query.getSingleResult();
    }

    public User findUserByEmail(String email){
        String jpql = "SELECT u FROM User u WHERE u.email = :email";
        Query query = entityManager.createQuery(jpql, User.class);
        query.setParameter("email", email);
        return (User) query.getSingleResult();
    }

    public User findUserByPhoneNumber(String phoneNumber){
        String jpql = "SELECT u FROM User u WHERE u.phoneNumber = :phoneNumber";
        Query query = entityManager.createQuery(jpql, User.class);
        query.setParameter("phoneNumber", phoneNumber);
        return (User) query.getSingleResult();
    }

}
