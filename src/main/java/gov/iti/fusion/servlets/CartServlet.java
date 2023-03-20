package gov.iti.fusion.servlets;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import org.jose4j.json.internal.json_simple.JSONObject;

import com.google.gson.Gson;

import gov.iti.fusion.models.Game;
import gov.iti.fusion.models.User;
import gov.iti.fusion.services.GameService;
import gov.iti.fusion.services.UserService;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CartServlet extends HttpServlet {
    ServletConfig myConfig;

    @Override
    public void destroy() {
        System.out.println("I am inside the destroy method");
        
    }

    @Override
    public ServletConfig getServletConfig() {
        return myConfig;
    }

    @Override
    public String getServletInfo() {
        return null;
    }

    @Override
    public void init(ServletConfig config) throws ServletException {
        System.out.println("I am inside the init method");
        myConfig=config;
        
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserService userService = new UserService(request);
        GameService gameService = new GameService(request);
        response.sendRedirect("cart.jsp");
       

    }
    
    
}
