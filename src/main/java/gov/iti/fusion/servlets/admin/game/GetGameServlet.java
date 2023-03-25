package gov.iti.fusion.servlets.admin.game;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import gov.iti.fusion.models.Game;
import gov.iti.fusion.services.GameService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class GetGameServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        GameService gameService = new GameService(request);
        PrintWriter out = response.getWriter();

        List<Game> allGames = gameService.findAllGames();
        JsonArray jsonArray = new JsonArray();
        allGames.forEach(game -> {
            JsonObject gameJson = new JsonObject();
            gameJson.addProperty("id", game.getId());
            gameJson.addProperty("name", game.getName());
            gameJson.addProperty("price", game.getPrice());
            gameJson.addProperty("netPrice", game.getNetPrice());
            gameJson.addProperty("discount", game.getDiscount() != null? game.getDiscount().getType().getDiscount() : null);
            gameJson.addProperty("pictureUrl", game.getPictureUrl());
            jsonArray.add(gameJson);
        });
        response.setStatus(200);
        out.println(jsonArray);
    }

}
