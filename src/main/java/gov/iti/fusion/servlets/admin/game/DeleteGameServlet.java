package gov.iti.fusion.servlets.admin.game;

import com.google.gson.JsonParser;
import com.google.gson.JsonObject;
import gov.iti.fusion.services.GameService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;

public class DeleteGameServlet extends HttpServlet {
    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        GameService gameService = new GameService(request);

        JsonObject requestBody = JsonParser.parseReader(request.getReader()).getAsJsonObject();
        String gameId = requestBody.get("gameId").getAsString();
        gameService.deleteById(gameId);

        JsonObject responseBody = new JsonObject();
        responseBody.addProperty("status", "game deleted successfully");
        response.setStatus(200);
        out.println(responseBody);
    }
}
