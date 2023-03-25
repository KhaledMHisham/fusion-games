package gov.iti.fusion.servlets;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.List;

import org.jose4j.json.internal.json_simple.JSONObject;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import gov.iti.fusion.models.Game;
import gov.iti.fusion.models.Order;
import gov.iti.fusion.models.User;
import gov.iti.fusion.services.GameService;
import gov.iti.fusion.services.OrderService;
import gov.iti.fusion.services.UserService;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CheckOutServlet extends HttpServlet {
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
        myConfig = config;

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        UserService userService = new UserService(request);
        GameService gameService = new GameService(request);
        OrderService orderService = new OrderService(request);

        User user = (User) request.getAttribute("user");
        List<Game> cartGames = user.getCartGames();

        double totalPrice = cartGames.stream()
                .mapToDouble(Game::getNetPrice)
                .reduce(0.0, Double::sum);

        JsonObject responseBody = new JsonObject();
        Gson gson = new Gson();
        PrintWriter out = response.getWriter();

        if (totalPrice > user.getCreditLimit()) {
            responseBody.addProperty("success", "false");

        } else {
            //cart
            userService.removeGamesFromCart(user);
            //order
            Order order = new Order(LocalDate.now());
            order.setOrderingUser(user);
            orderService.save(order);
            orderService.addGamesToOrder(order, cartGames);
            //library 
            userService.addGamesToUserLibrary(user, cartGames);
            responseBody.addProperty("success", "true");
        }
        String responseBodyJson = gson.toJson(responseBody);
        response.setStatus(200);
        out.println(responseBodyJson);


    }

}
