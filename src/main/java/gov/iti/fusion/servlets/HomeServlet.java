package gov.iti.fusion.servlets;

import java.io.IOException;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

import org.hibernate.mapping.List;

import gov.iti.fusion.models.Discount;
import gov.iti.fusion.models.Game;
import gov.iti.fusion.models.Genre;
import gov.iti.fusion.models.Platform;
import gov.iti.fusion.models.enums.DiscountType;
import gov.iti.fusion.models.enums.GenreType;
import gov.iti.fusion.models.enums.PlatformType;
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
    GameService gameService = new GameService();

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
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public void init(ServletConfig config) throws ServletException {
        System.out.println("I am inside the init method");
        myConfig=config;
        
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        GameService gameService = new GameService();
        DiscountService discountService = new DiscountService();
        PlatformService platformService = new PlatformService();
        GenreService genreService = new GenreService();


        Set<Game> mainGames = new HashSet<>();
        Set<Platform> platforms =  new HashSet<>();
        Set<Genre> genres =  new HashSet<>();

        Discount discount1 = new Discount(DiscountType.CLASSIC);

        Platform linux =  new Platform(PlatformType.LINUX);
        platforms.add(linux);

        Genre action = new Genre(GenreType.ACTION);
        genres.add(action);


        Game game1 = new Game("wolf",10.0,"war game using wolfs",discount1
        ,genres,LocalDate.now(),"rahma","rahma","images/hellblade.jpg",platforms);

        mainGames.add(game1);

        linux.setGames(mainGames);
        discount1.setGames(mainGames);
        action.setGames(mainGames);

        discountService.save(discount1);
        platformService.save(linux);
        genreService.save(action);
        gameService.save(game1);

        
        request.setAttribute("weHave",mainGames);
        request.getRequestDispatcher("home-page.jsp").forward(request, response);
    }
}
