package gov.iti.fusion.servlets;

import java.io.IOException;
import java.lang.reflect.Array;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

import com.google.gson.Gson;

import gov.iti.fusion.models.Discount;
import gov.iti.fusion.models.Game;
import gov.iti.fusion.models.Genre;
import gov.iti.fusion.models.Order;
import gov.iti.fusion.models.Platform;
import gov.iti.fusion.models.User;
import gov.iti.fusion.models.enums.DiscountType;
import gov.iti.fusion.models.enums.GenreType;
import gov.iti.fusion.models.enums.PlatformType;
import gov.iti.fusion.persistence.repositories.GameRepository;
import gov.iti.fusion.services.DiscountService;
import gov.iti.fusion.services.GameService;
import gov.iti.fusion.services.GenreService;
import gov.iti.fusion.services.OrderService;
import gov.iti.fusion.services.PlatformService;
import gov.iti.fusion.services.UserService;
import jakarta.persistence.Entity;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class HomeServlet extends HttpServlet {
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
        GameService gameService = new GameService(request);

        UserService userService = new UserService(request);
        DiscountService discountService = new DiscountService(request);
        PlatformService platformService = new PlatformService(request);
        GenreService genreService = new GenreService(request);
        OrderService orderService = new OrderService(request);


        Set<Game> mainGames =  new HashSet<>();
        Set<Platform> platforms =  new HashSet<>();
        Set<Genre> genres =  new HashSet<>();

        Discount classic = new Discount(DiscountType.CLASSIC);
        Discount free = new Discount(DiscountType.FREE);
        Discount premium = new Discount(DiscountType.PREMIUM);

        Platform linux =  new Platform(PlatformType.LINUX);
        Platform windows =  new Platform(PlatformType.WINDOWS);
        Platform xbox =  new Platform(PlatformType.XBOX);
        platforms.add(linux);
        platforms.add(windows);
        platforms.add(xbox);

        Genre action = new Genre(GenreType.ACTION);
        Genre adventure = new Genre(GenreType.ADVENTURE);
        Genre fighting = new Genre(GenreType.FIGHTING);
        Genre horror = new Genre(GenreType.HORROR);
        Genre mmo = new Genre(GenreType.MMO);
        Genre puzzle = new Genre(GenreType.PUZZLE);

        discountService.save(classic);
        discountService.save(free);
        discountService.save(premium);
      
        

        genres.add(action);
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
        Game game5 = new Game("Sekiro", 100.0, "FromSoftware"
        ,"Activision","images/sekiro.jpg", "The game follows a shinobi known as Wolf, who attempts to take revenge on a samurai clan that imprisoned him and kidnapped his lord.", 80.0, LocalDate.now());
        Game game6 = new Game("Sekiro", 100.0, "FromSoftware"
        ,"Activision", "images/sekiro.jpg", "The game follows a shinobi known as Wolf, who attempts to take revenge on a samurai clan that imprisoned him and kidnapped his lord.", 80.0, LocalDate.now());
        Game game7 = new Game("Sekiro",100.0,"FromSoftware"
        ,"Activision","images/sekiro.jpg","The game follows a shinobi known as Wolf, who attempts to take revenge on a samurai clan that imprisoned him and kidnapped his lord.", 80.0,LocalDate.now());
        Game game8 = new Game("Sekiro",100.0,"FromSoftware"
        ,"Activision","images/sekiro.jpg","The game follows a shinobi known as Wolf, who attempts to take revenge on a samurai clan that imprisoned him and kidnapped his lord.", 80.0, LocalDate.now());
        

        genres.remove(adventure);
        // genres.add(war);
        genres.add(fighting);
        gameService.addGenresToGame(game1,genres);
        gameService.addPlatformsToGame(game1, platforms);
        game1.setDiscount(free);
        gameService.addGenresToGame(game3,genres);
        gameService.addPlatformsToGame(game3, platforms);


        platformService.save(linux);
        platformService.save(windows);
        platformService.save(xbox);
        genreService.save(action);
        genreService.save(puzzle);
        // genreService.save(shooter);
        genreService.save(horror);
        genreService.save(fighting);
        genreService.save(adventure);

        mainGames.add(game1);
        mainGames.add(game2);
        mainGames.add(game3);
        mainGames.add(game4);
        mainGames.add(game5);
        mainGames.add(game6);
        mainGames.add(game7);
        mainGames.add(game8);

         

        gameService.save(game1);
        gameService.save(game2);
        gameService.save(game3);
        gameService.save(game4);
        gameService.save(game5);
        gameService.save(game6);
        gameService.save(game7);
        gameService.save(game8);

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
        
        userService.save(user);
        
        Order order = new Order();
        order.setCreatedAt(LocalDate.now());
        order.setTotalPrice(20000.0);
        order.setOrderingUser(user);

        orderService.addGameToOrder(order, game1);
        orderService.addGameToOrder(order, game2);
        orderService.addGameToOrder(order, game3);

        userService.addGameToCart(user, game1);
        userService.addGameToCart(user, game2);
        userService.addGameToCart(user, game3);
        

        List<Game> allGames = new ArrayList<>();
        List<Game> gamesWithoutDiscount = new ArrayList<>();
        List<Game> new5Games = new ArrayList<>();
        List<Game> free2Games = new ArrayList<>();
        List<Game> gamesOnSale = new ArrayList<>();

        allGames = gameService.findAllGames();
        gamesWithoutDiscount =  gameService.findGamesWithNoDiscount();
        if(gamesWithoutDiscount.size()>15)
            gamesWithoutDiscount = getRandomElements(gamesWithoutDiscount);

        new5Games = gameService.findTopNewer(4);
        free2Games = gameService.findFreeGames(2);
        gamesOnSale = gameService.findGamesOnSale();

        if(gamesOnSale.size()>15)
            gamesOnSale = getRandomElements(gameService.findGamesOnSale());
        request.setAttribute("allGames",allGames);
        request.setAttribute("weHave",gamesWithoutDiscount);
        request.setAttribute("newReleases",new5Games);
        request.setAttribute("freeGames",free2Games);
        request.setAttribute("gamesOnSale",gamesOnSale);
        // System.out.println(new GenreService(request).groupGameWithGenre(GenreType.ACTION));
        System.out.println(gamesOnSale.size()+"===================================================================");
        request.getRequestDispatcher("home-page.jsp").forward(request, response);
    }
    public List<Game>getRandomElements(List<Game> list)
    {
        Random rand = new Random();
 
        // create a temporary list for storing
        // selected element
        List<Game> newList = new ArrayList<>();
        for (int i = 0; i < list.size(); i++) {
            int randomIndex = rand.nextInt(list.size());
             newList.add(list.get(randomIndex));
             list.remove(randomIndex);
             
        }
        return newList;
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        GameService gameService = new GameService(request);
        Gson gson = new Gson();
        EntityManager entityManager = (EntityManager) request.getAttribute("EntityManager");
        String jsonList = gson.toJson(gameService.findAllGames().stream().map((g->g.getName())).toList());
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonList);
          }
    }

