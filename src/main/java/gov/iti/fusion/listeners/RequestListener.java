package gov.iti.fusion.listeners;

import gov.iti.fusion.auth.JWTManagerSingleton;
import gov.iti.fusion.models.User;
import gov.iti.fusion.persistence.connection.JpaManagerSingleton;
import gov.iti.fusion.utils.CookiesUtils;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletRequestEvent;
import jakarta.servlet.ServletRequestListener;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import org.jose4j.jwt.JwtClaims;
import org.jose4j.jwt.MalformedClaimException;
import org.jose4j.jwt.consumer.InvalidJwtException;

import java.net.UnknownHostException;

public class RequestListener implements ServletRequestListener  {

    @Override
    public void requestInitialized(ServletRequestEvent sre) {
        HttpServletRequest httpServletRequest = (HttpServletRequest) sre.getServletRequest();
        Cookie cookie = CookiesUtils.getCookie(httpServletRequest.getCookies(), "auth_token");
        EntityManager entityManager = JpaManagerSingleton.INSTANCE.getEntityManagerFactory().createEntityManager();
        httpServletRequest.setAttribute("EntityManager", entityManager);
        httpServletRequest.setAttribute("user", null);
        if(cookie != null){ 
            try {
                JwtClaims jwtClaims = JWTManagerSingleton.INSTANCE.validateToken(cookie.getValue(), httpServletRequest.getRemoteAddr());
                User user = entityManager.find(User.class, jwtClaims.getSubject());
                httpServletRequest.setAttribute("user", user);
            } catch (InvalidJwtException e) {
                System.out.println("Invalid Token in Request Listener");
            } catch (UnknownHostException e) {
                System.out.println("Unknown Host in Request Listener");
                throw new RuntimeException();
            } catch (MalformedClaimException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
                throw new RuntimeException(e);
            }
        }
    }
    
    @Override
    public void requestDestroyed(ServletRequestEvent sre) {
        EntityManager entityManager = (EntityManager) sre.getServletRequest().getAttribute("EntityManager");
        entityManager.close();
    }
    
}
