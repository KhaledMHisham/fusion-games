package gov.iti.fusion.servlets;

import java.io.IOException;
import java.lang.reflect.Array;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


import gov.iti.fusion.models.Discount;
import gov.iti.fusion.models.Game;
import gov.iti.fusion.models.Genre;
import gov.iti.fusion.models.Platform;
import gov.iti.fusion.models.enums.DiscountType;
import gov.iti.fusion.models.enums.GenreType;
import gov.iti.fusion.models.enums.PlatformType;
import gov.iti.fusion.persistence.repositories.GameRepository;
import gov.iti.fusion.services.DiscountService;
import gov.iti.fusion.services.GameService;
import gov.iti.fusion.services.GenreService;
import gov.iti.fusion.services.PlatformService;
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
        DiscountService discountService = new DiscountService(request);
        PlatformService platformService = new PlatformService(request);
        GenreService genreService = new GenreService(request);


        //List<Game> mainGames = new ArrayList<>();
        Set<Game> mainGames =  new HashSet<>();
        Set<Platform> platforms =  new HashSet<>();
        Set<Genre> genres =  new HashSet<>();

        Discount discount1 = new Discount(DiscountType.CLASSIC);

        Platform linux =  new Platform(PlatformType.LINUX);
        platforms.add(linux);

        Genre action = new Genre(GenreType.ACTION);
        genres.add(action);


        Game game1 = new Game("Assassin'ss Creed Valhalla Standard Edition",10.0,"war game using wolfs",discount1
        ,genres,LocalDate.now(),"rahma","rahma","images/hellblade.jpg",platforms);
        Game game2 = new Game("Assassin'sss Creed Valhalla Standard Edition",10.0,"war game using wolfs",discount1
        ,genres,LocalDate.now(),"rahma","rahma","images/12.webp",platforms);
        Game game3 = new Game("Assassin'ssss Creed Valhallrea Standard Edition",10.0,"war game using wolfs",discount1
        ,genres,LocalDate.now(),"rahma","rahma","images/1.webp",platforms);
        Game game4 = new Game("Assassinn's Creed Valhalla Standard Edition",10.0,"war game using wolfs",discount1
        ,genres,LocalDate.now(),"rahma","rahma","images/1.jpg",platforms);
        Game game5 = new Game("Assasswin'ss Creed Valhalla Standard Edition",10.0,"war game using wolfs",discount1
        ,genres,LocalDate.now(),"rahma","rahma","images/heldlblade.jpg",platforms);
        Game game6 = new Game("Assassin'sss Creedd Valhalla Standard Edition",10.0,"war game using wolfs",discount1
        ,genres,LocalDate.now(),"rahma","rahma","images/1232.webp",platforms);
        Game game7 = new Game("Assassin'ssss Creed Valhalla Standard Edition",10.0,"war game using wolfs",discount1
        ,genres,LocalDate.now(),"rahma","rahma","images/1.fwebp",platforms);
        Game game8= new Game("Assassinn's Creed Vaalhalla Standard Edition",10.0,"war game using wolfs",discount1
        ,genres,LocalDate.now(),"rahma","rahma","images/1.jsepg",platforms);

        mainGames.add(game1);
        mainGames.add(game2);
        mainGames.add(game3);
        mainGames.add(game4);
        mainGames.add(game5);
        mainGames.add(game6);
        mainGames.add(game7);
        mainGames.add(game8);

        

        discountService.save(discount1);
        platformService.save(linux);
        genreService.save(action);

        
        linux.setGames(mainGames);
        discount1.setGames(mainGames);
        action.setGames(mainGames);

        gameService.save(game1);
        gameService.save(game2);
        gameService.save(game3);
        gameService.save(game4);
        gameService.save(game5);
        gameService.save(game6);
        gameService.save(game7);
        gameService.save(game8);

        //mainGames =  gameService.findAllGames();
        request.setAttribute("weHave",mainGames);
        //System.out.println(mainGames);
        request.getRequestDispatcher("home-page.jsp").forward(request, response);
    }
}
