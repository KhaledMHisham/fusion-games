package gov.iti.fusion.listeners;

import gov.iti.fusion.persistence.connection.JpaManagerSingleton;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletRequestEvent;
import jakarta.servlet.ServletRequestListener;

public class RequestListener implements ServletRequestListener  {

    @Override
    public void requestInitialized(ServletRequestEvent sre) {
        EntityManager entityManager = JpaManagerSingleton.INSTANCE.getEntityManagerFactory().createEntityManager();
        sre.getServletRequest().setAttribute("EntityManager", entityManager);
    }
    
    @Override
    public void requestDestroyed(ServletRequestEvent sre) {
        EntityManager entityManager = (EntityManager) sre.getServletRequest().getAttribute("EntityManager");
        entityManager.close();
    }
    
}
