package gov.iti.fusion.servlets;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import org.jose4j.json.internal.json_simple.JSONObject;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import gov.iti.fusion.models.Game;
import gov.iti.fusion.models.User;
import gov.iti.fusion.services.GameService;
import gov.iti.fusion.services.UserService;
import jakarta.persistence.EntityManager;
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
        request.getRequestDispatcher("cart.jsp").forward(request, response);;
       

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
        userService.addGameToCart((User) request.getAttribute("user"),game);

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
        User user = (User) request.getAttribute("user");

        userService.removeGameFromCart(user,game);

        EntityManager entityManager =  (EntityManager) request.getAttribute("EntityManager");
        entityManager.refresh(user);

        double totalPrice = user.getCartGames().stream()
                .mapToDouble(Game::getPrice)
                .reduce(0.0, Double::sum);

        double totalNetPrice = user.getCartGames().stream()
                .mapToDouble(Game::getNetPrice)
                .reduce(0.0, Double::sum);

        System.out.println("deleted");


        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.setStatus(200);

        JsonObject responseBody = new JsonObject();
        PrintWriter out = response.getWriter();

        responseBody.addProperty("success", "true");
        responseBody.addProperty("totalPrice",totalPrice);
        responseBody.addProperty("totalNetPrice",totalNetPrice);
        responseBody.addProperty("totalDiscount",(int)(100-(totalNetPrice/totalPrice)*100));
        
        String responseBodyJson = gson.toJson(responseBody);
        out.println(responseBodyJson);    
    }
    
}
