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

public class WishListServlet extends HttpServlet {
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserService userService = new UserService(request);
        GameService gameService = new GameService(request);
        Gson gson = new Gson();
        BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
        String message = "";
        if (br != null) {
            message = br.readLine();
        }
        JSONObject msg = gson.fromJson(message, JSONObject.class);

        System.out.println("game id" + msg.get("gameId"));
        Game game = gameService.findById((String) msg.get("gameId"));
        userService.addGameToWishList((User) request.getAttribute("user"),game);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.setStatus(200);
        response.getWriter().write("{\"success\":\"success\"}");

    }
    
    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserService userService = new UserService(request);
        GameService gameService = new GameService(request);
        Gson gson = new Gson();
        BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
        String message = "";
        if (br != null) {
            message = br.readLine();
        }
        JSONObject msg = gson.fromJson(message, JSONObject.class);

        System.out.println("game id" + msg.get("gameId"));
        Game game = gameService.findById((String) msg.get("gameId"));
        userService.deleteGameFromWishList((User) request.getAttribute("user"),game);
        System.out.println("deleted");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.setStatus(200);
        response.getWriter().write("{\"success\":\"success\"}");
    }
    
}
