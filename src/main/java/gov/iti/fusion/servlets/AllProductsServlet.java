package gov.iti.fusion.servlets;

import java.io.IOException;
import java.lang.reflect.Array;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
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

public class AllProductsServlet extends HttpServlet {
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
      
        List<Game> gamesWithoutDiscount = new ArrayList<>();
        List<Game> new5Games = new ArrayList<>();
        List<Game> free2Games = new ArrayList<>();
        List<Game> gamesOnSale = new ArrayList<>();

        gamesWithoutDiscount =  gameService.findAllGames();
        if(gamesWithoutDiscount.size()>12)
            gamesWithoutDiscount = getRandomElements(gamesWithoutDiscount);
        new5Games = gameService.findTopNewer(4);
        free2Games = gameService.findFreeGames(2);
        gamesOnSale = gameService.findGamesOnSale();
        
        if(gamesOnSale.size()>12)
            gamesOnSale = getRandomElements(gameService.findGamesOnSale());
        request.setAttribute("weHave",gamesWithoutDiscount);
        request.setAttribute("newReleases",new5Games);
        request.setAttribute("freeGames",free2Games);
        request.setAttribute("gamesOnSale",gamesOnSale);
        // System.out.println(new GenreService(request).groupGameWithGenre(GenreType.ACTION));
        System.out.println(gamesOnSale.size()+"===================================================================");
        request.getRequestDispatcher("all-products-page.jsp").forward(request, response);
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
}
