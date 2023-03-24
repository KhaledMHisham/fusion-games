package gov.iti.fusion.servlets;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import gov.iti.fusion.models.CartItem;
import gov.iti.fusion.models.Discount;
import gov.iti.fusion.models.Game;
import gov.iti.fusion.models.GameGenre;
import gov.iti.fusion.models.Genre;
import gov.iti.fusion.models.Order;
import gov.iti.fusion.models.OrderedGame;
import gov.iti.fusion.models.User;
import gov.iti.fusion.models.enums.DiscountType;
import gov.iti.fusion.models.enums.GenreType;
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

        Double totalPrice;
        OrderService orderService =new OrderService(request);
        Discount discount = new Discount(DiscountType.PREMIUM);
        Genre genre = new Genre();

        

          
        Game game1 = new Game("Game of Thrones", 100.0, "FromSoftware"
            ,"Activision","images/game1.jpg", "The game follows a shinobi known as Wolf, who attempts to take revenge on a samurai clan that imprisoned him and kidnapped his lord.", 100.0, LocalDate.now());
        Game game2 = new Game("chess", 200.0, "FromSoftware"
            ,"Activision", "images/game2.jpg", "The game follows a shinobi known as Wolf, who attempts to take revenge on a samurai clan that imprisoned him and kidnapped his lord.", 200.0, LocalDate.now());
        Game game3 = new Game("Shadow Die Twice",300.0,"FromSoftware"
            ,"Activision","images/sekiro2.jpg","The game follows a shinobi known as Wolf, who attempts to take revenge on a samurai clan that imprisoned him and kidnapped his lord.", 300.0,LocalDate.now());
        Game game4 = new Game("Bloodborne",400.0,"FromSoftware"
            ,"Activision","images/1.webp","The game follows a shinobi known as Wolf, who attempts to take revenge on a samurai clan that imprisoned him and kidnapped his lord.", 400.0, LocalDate.now());
        Game game5 = new Game("Cover Fire", 500.0, "FromSoftware"
            ,"Activision","images/hellblade.jpg", "The game follows a shinobi known as Wolf, who attempts to take revenge on a samurai clan that imprisoned him and kidnapped his lord.", 500.0, LocalDate.now());
        
        game1.setDiscount(discount);
        // game2.setDiscount(discount);
        // game3.setDiscount(discount);
        // game4.setDiscount(discount);
        // game5.setDiscount(discount);


        Set <GameGenre> gameGenres= new HashSet<>();

        genre.setGenre(GenreType.ACTION);
        GameGenre gameGenre = new GameGenre(game1, genre);

        
        gameGenres.add(gameGenre);
        

        game1.setGenres(gameGenres);
        


        List<Game> games = new ArrayList<>();
        games.add(game1);
        games.add(game2);
        games.add(game3); 
        games.add(game4);
        games.add(game5);



    //     User user = new User();
    //    user.setUsername("SaraJaledRahma");
    //    user.setFirstName("sara");
    //    user.setLastName("Jaled");
    //    user.setPassword("password");
    //    user.setCountry("Egypt");
    //    user.setSalt("SALT");
    //    user.setPassword("PASSWORD");
    //    user.setPhoneNumber("0101177546");
    //    user.setGender("female");
    //    user.setEmail("Sara@hotmail1.com");
    //    user.setAdmin(true);
    //    user.setBirthDate(LocalDate.now());

        // for(int i = 0; i<= games.size(); i++){
        //     Double totalPrice1 += games.get(i).getNetPrice();
        // }

        Order order1 = new Order();
        // Order order2 = new Order();
        // Order order3 = new Order();
        // Order order4 = new Order();

        OrderedGame orderedGame1 = new OrderedGame(game1, order1);
        // OrderedGame orderedGame2 = new OrderedGame(game1, order2);
        // OrderedGame orderedGame3 = new OrderedGame(game1, order3);
        // OrderedGame orderedGame4 = new OrderedGame(game1, order4);

       

        List <OrderedGame> orderedGames = new ArrayList<>();

    
        orderedGames.add(orderedGame1);
        // orderedGames.add(orderedGame2);
        // orderedGames.add(orderedGame3);
        // orderedGames.add(orderedGame4);
        CartItem cart = (CartItem) request.getAttribute("cart");  


        // orderService.addGamesToOrder(order, games);

        // user.getCartItems().get(0);
        // order.setOrderingUser(user);
        // orderService.save(order);

      

        // CartItem cartItem = new CartItem(user,game1);
        // user.getCartItems().get(0);
        // order.setOrderingUser(user);
        // orderService.save(order);

//        if(order.getTotalPrice() <= creditLimt){}
       
//
//        List <Game> games= new ArrayList<>();
//
//        Order order = new Order();
//
//
    //    Game game = new Game("Sekiro", 100.0,"FromSoftware"
    //            ,"Activision", "images/sekiro.jpg","The game follows a shinobi known as Wolf, who attempts to take revenge on a samurai clan that imprisoned him and kidnapped his lord.", 80.0, LocalDate.now());
      
    //    order.setCreatedAt(LocalDate.now());
    //    order.setOrderingUser(user);

//        order = orderService.save(order);
//        orderService.addGameToOrder(order, game);
//        orderService.addGameToOrder(order, game1);
//        orderService.addGameToOrder(order, game2);
//        orderService.addGameToOrder(order, game3);
//        orderService.addGameToOrder(order, game4);
//
//        games.add(game);
//        games.add(game1);
//        games.add(game2);
//        games.add(game3);
//
//        games.add(game4);
//        order.setTotalPrice(200.0);
//
//        orderService.addGamesToOrder(order, games);
//
//
//
     

    request.setAttribute("orderedGames", orderedGames);
    request.setAttribute("orderedGame", orderedGame1);

    // request.setAttribute("cart", cart);
    // request.setAttribute("discount", discount);
    // request.setAttribute("gameGenres", gameGenres);



    request.getRequestDispatcher("order.jsp").forward(request, response);

    }
    
}
