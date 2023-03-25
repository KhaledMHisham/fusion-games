package gov.iti.fusion.servlets.admin.user;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import gov.iti.fusion.models.Game;
import gov.iti.fusion.models.User;
import gov.iti.fusion.services.GameService;
import gov.iti.fusion.services.UserService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class GetUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserService userService = new UserService(request);
        PrintWriter out = response.getWriter();

        List<User> allUsers = userService.findAll();
        JsonArray jsonArray = new JsonArray();
        allUsers.forEach(user -> {
            JsonObject userJson = new JsonObject();
            userJson.addProperty("id", user.getId());
            userJson.addProperty("username", user.getUsername());
            userJson.addProperty("email", user.getEmail());
            userJson.addProperty("country", user.getCountry());
            userJson.addProperty("creditLimit", 5000);
            jsonArray.add(userJson);
        });
        response.setStatus(200);
        out.println(jsonArray);
    }

}
