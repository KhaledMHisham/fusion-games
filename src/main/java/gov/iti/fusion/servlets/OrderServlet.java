package gov.iti.fusion.servlets;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import gov.iti.fusion.models.Game;
import gov.iti.fusion.models.Order;
import gov.iti.fusion.models.User;
import gov.iti.fusion.persistence.repositories.OrderRepository;
import gov.iti.fusion.services.OrderService;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class OrderServlet extends HttpServlet{
    ServletConfig myConfig;


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        OrderService orderService = new OrderService(request);

        User user = new User();
        user.setUsername("SaraAdel");
        user.setFirstName("Sara");
        user.setLastName("Adel");
        user.setPassword("password");
        user.setCountry("Egypt");
        user.setSalt("SALT");
        user.setPassword("PASSWORD");
        user.setPhoneNumber("0101177547");
        user.setGender("female");
        user.setEmail("Sara@hotmail.com");
        user.setAdmin(true);
        user.setBirthDate(LocalDate.now());
        
        List <Game> games= new ArrayList<>();
    
        Order order = new Order();


        Game game = new Game("Sekiro", 100.0,"FromSoftware"
        ,"Activision", "images/sekiro.jpg","The game follows a shinobi known as Wolf, who attempts to take revenge on a samurai clan that imprisoned him and kidnapped his lord.", 80.0, LocalDate.now());
        Game game1 = new Game("Sekiro", 100.0, "FromSoftware"
        ,"Activision","images/sekiro.jpg", "The game follows a shinobi known as Wolf, who attempts to take revenge on a samurai clan that imprisoned him and kidnapped his lord.", 80.0, LocalDate.now());
        Game game2 = new Game("Sekiro", 100.0, "FromSoftware"
        ,"Activision", "images/sekiro.jpg", "The game follows a shinobi known as Wolf, who attempts to take revenge on a samurai clan that imprisoned him and kidnapped his lord.", 80.0, LocalDate.now());
        Game game3 = new Game("Sekiro",100.0,"FromSoftware"
        ,"Activision","images/sekiro.jpg","The game follows a shinobi known as Wolf, who attempts to take revenge on a samurai clan that imprisoned him and kidnapped his lord.", 80.0,LocalDate.now());
        Game game4 = new Game("Sekiro",100.0,"FromSoftware"
        ,"Activision","images/sekiro.jpg","The game follows a shinobi known as Wolf, who attempts to take revenge on a samurai clan that imprisoned him and kidnapped his lord.", 80.0, LocalDate.now());

        order.setCreatedAt(LocalDate.now());
        order.setOrderingUser(user);

        order = orderService.save(order);
        orderService.addGameToOrder(order, game);
        orderService.addGameToOrder(order, game1);
        orderService.addGameToOrder(order, game2);
        orderService.addGameToOrder(order, game3);
        orderService.addGameToOrder(order, game4);

        games.add(game);
        games.add(game1);
        games.add(game2);
        games.add(game3);
        games.add(game4);

        orderService.addGamesToOrder(order, games);
       


        


        request.setAttribute("order", order);
        request.setAttribute("game", game);
        request.setAttribute("games", games);
        


        request.getRequestDispatcher("order-page.jsp").forward(request, response);



        






    }
    
}
