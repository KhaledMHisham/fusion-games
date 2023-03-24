package gov.iti.fusion.servlets.admin;

import gov.iti.fusion.models.Discount;
import gov.iti.fusion.models.Game;
import gov.iti.fusion.models.Genre;
import gov.iti.fusion.models.Platform;
import gov.iti.fusion.services.DiscountService;
import gov.iti.fusion.services.GameService;
import gov.iti.fusion.services.GenreService;
import gov.iti.fusion.services.PlatformService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class AdminServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        GameService gameService = new GameService(request);
        GenreService genreService = new GenreService(request);
        PlatformService platformService = new PlatformService(request);
        DiscountService discountService = new DiscountService(request);

        List<Genre> allGenres = genreService.findAllGenre();
        List<Platform> allPlatforms = platformService.findAll();
        List<Discount> allDiscounts = discountService.findAll();

        request.setAttribute("allGenres", allGenres);
        request.setAttribute("allPlatforms", allPlatforms);
        request.setAttribute("allDiscounts", allDiscounts);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("admin-dashboard.jsp");
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
