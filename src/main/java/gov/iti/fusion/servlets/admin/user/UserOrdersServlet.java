package gov.iti.fusion.servlets.admin.user;

import com.google.gson.Gson;
import gov.iti.fusion.mappers.GameMapper;
import gov.iti.fusion.mappers.OrderMapper;
import gov.iti.fusion.models.Dto.GameDto;
import gov.iti.fusion.models.Dto.OrderDto;
import gov.iti.fusion.models.Game;
import gov.iti.fusion.models.Order;
import gov.iti.fusion.models.OrderedGame;
import gov.iti.fusion.models.User;
import gov.iti.fusion.services.GameService;
import gov.iti.fusion.services.OrderService;
import gov.iti.fusion.services.UserService;
import jakarta.json.bind.Jsonb;
import jakarta.json.bind.JsonbBuilder;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.jose4j.json.internal.json_simple.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

public class UserOrdersServlet extends HttpServlet {
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
        OrderService orderService = new OrderService(request);
        Gson gson = new Gson();
        BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
        String message = "";
        if (br != null) {
            message = br.readLine();
        }
        JSONObject msg = gson.fromJson(message, JSONObject.class);
        String userId =(String) msg.get("userId");
        System.out.println("user id" +userId);
        User user = userService.findById(userId);
        List<Order> userOrders = orderService.getUserOrders(user);
        List<OrderDto> userOrdersDto = new ArrayList<>();
        for(Order order :userOrders ){
            userOrdersDto.add(OrderMapper.entityToDTO(order));
        }
        // Jsonb jsonb = JsonbBuilder.create(); 
        // String result = jsonb.toJson(userOrdersDto); 
        // System.out.println(new
        // GenreService(request).groupGameWithGenre(GenreType.ACTION));

        request.setAttribute("clientOrders", userOrdersDto);
        request.setAttribute("client", user);
        response.setContentType("text/html");
        request.getRequestDispatcher("../user-orders.jsp").forward(request, response);

    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getAttribute("user");
        if(user==null || !user.isAdmin())
            throw new RuntimeException();
        
        UserService userService = new UserService(request);
        OrderService orderService = new OrderService(request);
        String clientId = request.getParameter("userId");
        System.out.println("user id" +clientId);
        User client = userService.findById(clientId);
        List<OrderedGame> orderedGames = user.getOrderedGames();

        List<Order> userOrders = orderService.getUserOrders(client);
        
        List<OrderDto> userOrdersDto = new ArrayList<>();
        for(Order order :userOrders ){
            userOrdersDto.add(OrderMapper.entityToDTO(order));
        }
    
        request.setAttribute("clientOrdersGames", orderedGames);
        request.setAttribute("clientOrders", userOrders);
        request.setAttribute("client", client);
        request.getRequestDispatcher("user-orders2.jsp").forward(request, response);

    }
    
    
}
