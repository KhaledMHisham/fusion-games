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

import gov.iti.fusion.models.*;
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

    //      UserService userService = new UserService(request);
    //      DiscountService discountService = new DiscountService(request);
    //      PlatformService platformService = new PlatformService(request);
    //      GenreService genreService = new GenreService(request);
    //      OrderService orderService = new OrderService(request);


    //      Set<Game> mainGames =  new HashSet<>();
    //      Set<Platform> platforms =  new HashSet<>();
    //      Set<Genre> genres =  new HashSet<>();

    //      Discount classic = new Discount(DiscountType.CLASSIC);
    //      Discount free = new Discount(DiscountType.FREE);
    //      Discount premium = new Discount(DiscountType.PREMIUM);

    //      Platform linux =  new Platform(PlatformType.LINUX);
    //      Platform windows =  new Platform(PlatformType.WINDOWS);
    //      Platform xbox =  new Platform(PlatformType.XBOX);
    //      platforms.add(linux);
    //      platforms.add(windows);
    //      platforms.add(xbox);

    //      Genre action = new Genre(GenreType.ACTION);
    //      Genre adventure = new Genre(GenreType.ADVENTURE);
    //      Genre fighting = new Genre(GenreType.FIGHTING);
    //      Genre horror = new Genre(GenreType.HORROR);
    //      Genre mmo = new Genre(GenreType.MMO);
    //      Genre puzzle = new Genre(GenreType.PUZZLE);

    //      discountService.save(classic);
    //      discountService.save(free);
    //      discountService.save(premium);



    //    genres.add(action);
    //     Game game1 = new Game("Assassinss Creed Valhalla Standard Edition",10.0,"rahma"
    //     ,"rahma","images/hellblade.jpg","war game using wolfs",LocalDate.now());
    //    game1.setGameFileUrl("qweqweqewqewqew");
    //    game1.setMinimumSpec(getStaticSpec());
    //    game1.setRecommendedSpec(getStaticSpec());
    //     gameService.addGenresToGame(game1,genres);
    //     gameService.addPlatformsToGame(game1, platforms);
    //     game1.setDiscount(premium);
    //     Game game2 = new Game("Assassinsss Creed Valhalla Standard Edition",10.0,"rahma","rahma","images/12.webp","war game using wolfs",LocalDate.now());
    //    game2.setGameFileUrl("qweqweqewqewqew221");
    //    game2.setMinimumSpec(getStaticSpec());
    //    game2.setRecommendedSpec(getStaticSpec());
    //     genres.add(adventure);
    //     gameService.addGenresToGame(game2,genres);
    //     gameService.addPlatformsToGame(game2, platforms);
    //     game2.setDiscount(classic);
    //     Game game3 = new Game("Assassinssss Creed Valhallrea Standard Edition",10.0,"rahma","rahma","images/1.webp","war game using wolfs",LocalDate.now());
    //    game3.setGameFileUrl("qweqweqewqewqewqweqwe");
    //    game3.setMinimumSpec(getStaticSpec());
    //    game3.setRecommendedSpec(getStaticSpec());
    //     genres.add(horror);
    //     gameService.addGenresToGame(game3,genres);
    //     gameService.addPlatformsToGame(game3, platforms);
    //     game3.setDiscount(premium);
    //     Game game4 = new Game("Assassinns Creed Valhalla Standard Edition",10.0,"rahma","rahma","images/1.jpg","war game using wolfs",LocalDate.now());
    //    game4.setGameFileUrl("qweqweqewqewqew123213213");
    //    game4.setMinimumSpec(getStaticSpec());
    //    game4.setRecommendedSpec(getStaticSpec());
    //    genres.add(puzzle);
    //     gameService.addGenresToGame(game4,genres);
    //     gameService.addPlatformsToGame(game4, platforms);
    //     Game game5 = new Game("Assasswin Creed Valhalla Standard Edition",10.0,"rahma","rahma","images/heldlblade.jpg","war game using wolfs",LocalDate.now());
    //    game5.setGameFileUrl("qweqweqewqewqewqeasdasdqw");
    //    game5.setMinimumSpec(getStaticSpec());
    //    game5.setRecommendedSpec(getStaticSpec());
    //     gameService.addGenresToGame(game5,genres);
    //     gameService.addPlatformsToGame(game5, platforms);
    //     Game game6 = new Game("Assassin sss Creedd Valhalla Standard Edition",10.0,"rahma","rahma","images/1232.webp","war game using wolfs",LocalDate.now());
    //    game6.setGameFileUrl("qweqweqewqewqew123qeqeqwewq");
    //    game6.setMinimumSpec(getStaticSpec());
    //    game6.setRecommendedSpec(getStaticSpec());
    //     gameService.addGenresToGame(game6,genres);
    //     gameService.addPlatformsToGame(game6, platforms);
    //     game6.setDiscount(free);
    //     Game game7 = new Game("Assassin Creed Valhalla Standard Edition",10.0,"rahma","rahma","images/1.fwebp","war game using wolfs",LocalDate.now());
    //    game7.setGameFileUrl("qweqweqewqewqew213qwedqwe");
    //    game7.setMinimumSpec(getStaticSpec());
    //    game7.setRecommendedSpec(getStaticSpec());
    //     genres.remove(puzzle);
    //     genres.add(mmo);
    //     genres.add(fighting);
    //     gameService.addGenresToGame(game7,genres);
    //     gameService.addPlatformsToGame(game7, platforms);
    //     game7.setDiscount(free);
    //     Game game8= new Game("Assassinn Creed Vaalhalla Standard Ediition",10.0,"rahma","rahma","images/1.jsepg","war game using wolfs",LocalDate.now());
    //    game8.setGameFileUrl("qweqweqewqewqew4132113asded");
    //    game8.setMinimumSpec(getStaticSpec());
    //    game8.setRecommendedSpec(getStaticSpec());
    //     gameService.addGenresToGame(game8,genres);
    //     gameService.addPlatformsToGame(game8, platforms);


    //       platformService.save(linux);
    //       platformService.save(windows);
    //       platformService.save(xbox);
    //       genreService.save(action);
    //       genreService.save(puzzle);
    //       genreService.save(mmo);
    //       genreService.save(horror);
    //       genreService.save(fighting);
    //       genreService.save(adventure);


    
    //     gameService.save(game1);
    //     gameService.save(game2);
    //     gameService.save(game3);
    //     gameService.save(game4);
    //     gameService.save(game5);
    //     gameService.save(game6);
    //     gameService.save(game7);
    //     gameService.save(game8);

    //     User user = new User();
    //     user.setUsername("khaledhisham");
    //     user.setFirstName("khaled");
    //     user.setLastName("hisham");
    //     user.setPassword("password");
    //     user.setCountry("Egypt");
    //     user.setSalt("SALT");
    //     user.setPassword("PASSWORD");
    //     user.setPhoneNumber("01278158298");
    //     user.setGender("Male");
    //     user.setEmail("Khaled@gmail.com");
    //     user.setAdmin(true);
    //     user.setCreditLimit(100.0);
    //     user.setBirthDate(LocalDate.of(2023, 3, 21));
        
    //     userService.save(user);

        List<Game> allGames = new ArrayList<>();
        List<Game> gamesWithoutDiscount = new ArrayList<>();
        List<Game> new5Games = new ArrayList<>();
        List<Game> free2Games = new ArrayList<>();
        List<Game> gamesOnSale = new ArrayList<>();
        List<Game> mostOrderdGame = new ArrayList<>();
        List<Game> recomndedGames = new ArrayList<>();


        allGames = gameService.findAllGames();
        gamesWithoutDiscount =  gameService.findGamesWithNoDiscount();
        // if(gamesWithoutDiscount.size()>15)
        //     gamesWithoutDiscount = getRandomElements(gamesWithoutDiscount);

        new5Games = gameService.findTopNewer(4);
        free2Games = gameService.findFreeGames(2);
        gamesOnSale = gameService.findGamesOnSale();

        User user =(User) request.getAttribute("user");
        if(user != null && user.getWishList().size() > 3){
            recomndedGames = gameService.findRecomendedGamesForUser(user, 4);
        }else{
            recomndedGames = getRandomElements(allGames);
            recomndedGames = recomndedGames.subList(0, 4);
        }

        if(gamesOnSale.size()>15)
            gamesOnSale = getRandomElements(gameService.findGamesOnSale());

        mostOrderdGame = gameService.findMostOrderedGames(12);
        if(mostOrderdGame.size()==0)
            mostOrderdGame = getRandomElements(allGames).subList(0, Math.min(allGames.size()/2,20));

        request.setAttribute("allGames",allGames);
        request.setAttribute("weHave",gamesWithoutDiscount);
        request.setAttribute("newReleases",new5Games);
        request.setAttribute("freeGames",free2Games);
        request.setAttribute("gamesOnSale",gamesOnSale);
        request.setAttribute("mostPurchased",mostOrderdGame);
        request.setAttribute("recomndedGames",recomndedGames);
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

    private GameSpec getStaticSpec(){
        GameSpec recommendedSpec = new GameSpec();
        recommendedSpec.setProcessor("QWEQWQEWWQE");
        recommendedSpec.setGraphicsCard("QEWQWQEWQWADASDDASZXc");
        recommendedSpec.setMemory(16);
        recommendedSpec.setStorage(64);
        recommendedSpec.setDirectXVersion(12);
        return recommendedSpec;
    }
}

