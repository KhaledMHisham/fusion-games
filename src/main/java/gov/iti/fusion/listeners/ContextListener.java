package gov.iti.fusion.listeners;

import gov.iti.fusion.persistence.connection.JpaManagerSingleton;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;

public class ContextListener implements ServletContextListener{

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        JpaManagerSingleton.INSTANCE.getEntityManagerFactory();
    }
}
