package gov.iti.fusion.servlets;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import gov.iti.fusion.models.CartItem;
import gov.iti.fusion.models.Discount;
import gov.iti.fusion.models.Game;
import gov.iti.fusion.models.Order;
import gov.iti.fusion.models.OrderedGame;
import gov.iti.fusion.models.User;
import gov.iti.fusion.models.enums.DiscountType;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CheckOutServlet extends HttpServlet{
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
        Discount discount = new Discount(DiscountType.ULTIMATE);
        Game game= new Game("Game of Thrones", 100.0, "FromSoftware"
            ,"Activision","images/game1.jpg", "The game follows a shinobi known as Wolf, who attempts to take revenge on a samurai clan that imprisoned him and kidnapped his lord.", 100.0, LocalDate.now());
        Game game1 = new Game("chess", 200.0, "FromSoftware"
            ,"Activision", "images/game2.jpg", "The game follows a shinobi known as Wolf, who attempts to take revenge on a samurai clan that imprisoned him and kidnapped his lord.", 200.0, LocalDate.now());

        game.setDiscount(discount);
        game1.setDiscount(discount);

        User user = new User();
        user.setUsername("SaraJaledRahma");
        user.setFirstName("sara");
        user.setLastName("rahma");
        user.setPassword("password");
        user.setCountry("Egypt");
        user.setSalt("SALT");
        user.setPassword("PASSWORD");
        user.setPhoneNumber("0101177546");
        user.setGender("female");
        user.setEmail("Sara@hotmail1.com");
        user.setAdmin(true);
        user.setBirthDate(LocalDate.now());
        user.setCreditLimit(1000.0);
        Order order = new Order ();
        order.setTotalPrice(900.0);
        order.setOrderingUser(user);

        OrderedGame orderedGame = new OrderedGame(game1, order);    

        CartItem cart= new CartItem(user,game);
        //order-> created at, user, total price 
        //orderedGame-> game , order


        String alert = "Sorry, you exceeded you card limit!";


        if (order.getTotalPrice() > user.getCreditLimit()){
            // System.out.println("Sorry you exceeded you card limit");
            response.getWriter().println(alert);
        }else { 
            request.setAttribute("cart", cart);
            CartItem cart2 = new CartItem();
        }
        List <Game>games = new ArrayList();
        games.add(game1);
        games.add(game);
        Double totalPrice;

        for(int i=0; i<games.size(); i++){
             Double totalPrice0 =+ games.get(i).getNetPrice();
             totalPrice = totalPrice0;

        }


        request.setAttribute("alert", alert);
        // request.setAttribute("user", user);
        // request.setAttribute("games", games);
        // request.setAttribute("order", order);


        
        request.getRequestDispatcher("checkout.jsp").forward(request, response);
    }   
}
