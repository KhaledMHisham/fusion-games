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

        // UserService userService = new UserService(request);
        // DiscountService discountService = new DiscountService(request);
        // PlatformService platformService = new PlatformService(request);
        // GenreService genreService = new GenreService(request);
        // OrderService orderService = new OrderService(request);


        // Set<Game> mainGames =  new HashSet<>();
        // Set<Platform> platforms =  new HashSet<>();
        // Set<Genre> genres =  new HashSet<>();

        // Discount classic = new Discount(DiscountType.CLASSIC);
        // Discount free = new Discount(DiscountType.FREE);
        // Discount premium = new Discount(DiscountType.PREMIUM);

        // Platform linux =  new Platform(PlatformType.LINUX);
        // Platform windows =  new Platform(PlatformType.WINDOWS);
        // Platform xbox =  new Platform(PlatformType.XBOX);
        // platforms.add(linux);
        // platforms.add(windows);
        // platforms.add(xbox);

        // Genre action = new Genre(GenreType.ACTION);
        // Genre adventure = new Genre(GenreType.ADVENTURE);
        // Genre fighting = new Genre(GenreType.FIGHTING);
        // Genre horror = new Genre(GenreType.HORROR);
        // Genre mmo = new Genre(GenreType.MMO);
        // Genre puzzle = new Genre(GenreType.PUZZLE);

        // discountService.save(classic);
        // discountService.save(free);
        // discountService.save(premium);
      
        

        // genres.add(action);
        // Game game1 = new Game("Subway",10.0,"rahma"
        // ,"rahma","images/hellblade.jpg","war game using wolfs",LocalDate.now());
        // gameService.addGenresToGame(game1,genres);
        // gameService.addPlatformsToGame(game1, platforms);
        // game1.setDiscount(premium);
        // Game game2 = new Game("Pubg",10.0,"rahma","rahma","images/12.webp","war game using wolfs",LocalDate.now());
        // genres.add(adventure);
        // gameService.addGenresToGame(game2,genres);
        // gameService.addPlatformsToGame(game2, platforms);
        // game2.setDiscount(classic);
        // Game game3 = new Game("Sudden Attack",10.0,"rahma","rahma","images/1.webp","war game using wolfs",LocalDate.now());
        // genres.add(horror);
        // gameService.addGenresToGame(game3,genres);
        // gameService.addPlatformsToGame(game3, platforms);
        // game3.setDiscount(premium);
        // Game game4 = new Game("Wolf Team",10.0,"rahma","rahma","images/1.jpg","war game using wolfs",LocalDate.now());
        // genres.add(puzzle);
        // gameService.addGenresToGame(game4,genres);
        // gameService.addPlatformsToGame(game4, platforms);
        // Game game5 = new Game("Assasswin Creed Valhalla Standard Edition",10.0,"rahma","rahma","images/heldlblade.jpg","war game using wolfs",LocalDate.now());
        // gameService.addGenresToGame(game5,genres);
        // gameService.addPlatformsToGame(game5, platforms);
        // Game game6 = new Game("Assassin sss Creedd Valhalla Standard Edition",10.0,"rahma","rahma","images/1232.webp","war game using wolfs",LocalDate.now());
        // gameService.addGenresToGame(game6,genres);
        // gameService.addPlatformsToGame(game6, platforms);
        // game6.setDiscount(free);
        // Game game7 = new Game("Assassin Creed Valhalla Standard Edition",10.0,"rahma","rahma","images/1.fwebp","war game using wolfs",LocalDate.now());
        // genres.remove(puzzle);
        // genres.add(mmo);
        // genres.add(fighting);
        // gameService.addGenresToGame(game7,genres);
        // gameService.addPlatformsToGame(game7, platforms);
        // game7.setDiscount(free);
        // Game game8= new Game("Assassinn Creed Vaalhalla Standard Ediition",10.0,"rahma","rahma","images/1.jsepg","war game using wolfs",LocalDate.now());
        // gameService.addGenresToGame(game8,genres);
        // gameService.addPlatformsToGame(game8, platforms);


        // // platformService.save(linux);
        // // platformService.save(windows);
        // // platformService.save(xbox);
        // // genreService.save(action);
        // // genreService.save(puzzle);
        // // genreService.save(mmo);
        // // genreService.save(horror);
        // // genreService.save(fighting);
        // // genreService.save(adventure);

        // mainGames.add(game1);
        // mainGames.add(game2);
        // mainGames.add(game3);
        // mainGames.add(game4);
        // mainGames.add(game5);
        // mainGames.add(game6);
        // mainGames.add(game7);
        // mainGames.add(game8);

    
        // // gameService.save(game1);
        // // gameService.save(game2);
        // // gameService.save(game3);
        // // gameService.save(game4);
        // // gameService.save(game5);
        // // gameService.save(game6);
        // // gameService.save(game7);
        // // gameService.save(game8);

        // User user = new User();
        // user.setUsername("khaledhisham");
        // user.setFirstName("khaled");
        // user.setLastName("hisham");
        // user.setPassword("password");
        // user.setCountry("Egypt");
        // user.setSalt("SALT");
        // user.setPassword("PASSWORD");
        // user.setPhoneNumber("01278158298");
        // user.setGender("Male");
        // user.setEmail("Khaled@gmail.com");
        // user.setAdmin(true);
        // user.setBirthDate(LocalDate.now());
        
        // userService.save(user);
        // //User user = userService.findUserbyEmail("rm1742@fayoum.edu");
        
        // Order order = new Order();
        // order.setCreatedAt(LocalDate.now());
        // order.setTotalPrice(20000.0);
        // order.setOrderingUser(user);
        // Order order2 = new Order();
        // order2.setCreatedAt(LocalDate.now());
        // order2.setTotalPrice(20000.0);
        // order2.setOrderingUser(user);
        // Order order3 = new Order();
        // order3.setCreatedAt(LocalDate.now());
        // order3.setTotalPrice(20000.0);
        // order3.setOrderingUser(user);
        // Order order4 = new Order();
        // order4.setCreatedAt(LocalDate.now());
        // order4.setTotalPrice(20000.0);
        // order4.setOrderingUser(user);

        // orderService.addGameToOrder(order, game1);
        // orderService.addGameToOrder(order, game2);
        // orderService.addGameToOrder(order, game3);

        // orderService.addGameToOrder(order2, game1);
        // orderService.addGameToOrder(order2, game5);
        // orderService.addGameToOrder(order2, game3);

        // orderService.addGameToOrder(order3, game1);
        // orderService.addGameToOrder(order3, game4);
        // orderService.addGameToOrder(order3, game3);

        // orderService.addGameToOrder(order4, game1);
        // orderService.addGameToOrder(order4, game2);



        // userService.addGameToCart(user, game1);
        // userService.addGameToCart(user, game2);
        // userService.addGameToCart(user, game3);
        

        List<Game> allGames = new ArrayList<>();
        List<Game> gamesWithoutDiscount = new ArrayList<>();
        List<Game> new5Games = new ArrayList<>();
        List<Game> free2Games = new ArrayList<>();
        List<Game> gamesOnSale = new ArrayList<>();
        List<Game> mostOrderdGame = new ArrayList<>();

        allGames = gameService.findAllGames();
        gamesWithoutDiscount =  gameService.findGamesWithNoDiscount();
        if(gamesWithoutDiscount.size()>15)
            gamesWithoutDiscount = getRandomElements(gamesWithoutDiscount);

        new5Games = gameService.findTopNewer(4);
        free2Games = gameService.findFreeGames(2);
        gamesOnSale = gameService.findGamesOnSale();

        if(gamesOnSale.size()>15)
            gamesOnSale = getRandomElements(gameService.findGamesOnSale());

        mostOrderdGame = gameService.findMostOrderedGames(12);
        request.setAttribute("allGames",allGames);
        request.setAttribute("weHave",gamesWithoutDiscount);
        request.setAttribute("newReleases",new5Games);
        request.setAttribute("freeGames",free2Games);
        request.setAttribute("gamesOnSale",gamesOnSale);
        request.setAttribute("mostPurchased",mostOrderdGame);
        // System.out.println(mostOrderdGame);
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

