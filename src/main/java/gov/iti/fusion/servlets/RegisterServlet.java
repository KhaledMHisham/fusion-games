package gov.iti.fusion.servlets;

import com.google.gson.GsonBuilder;
import gov.iti.fusion.models.User;
import gov.iti.fusion.utils.HashUtils;
import gov.iti.fusion.utils.LocalDateAdapter;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.SecureRandom;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Base64;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import gov.iti.fusion.services.UserService;

public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getAttribute("user") == null){
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("register.html");
            requestDispatcher.forward(request, response);
        }
        else{
            response.sendRedirect("home");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("application/json");
        Gson gson = new GsonBuilder().registerTypeAdapter(LocalDate.class, new LocalDateAdapter()).create();
        PrintWriter out = response.getWriter();
        UserService userService = new UserService(request);

        byte[] saltBytes = new byte[24];
        new SecureRandom().nextBytes(saltBytes);
        String salt = Base64.getEncoder().encodeToString(saltBytes);

        User user = gson.fromJson(request.getReader(), User.class);
        user.setPassword(HashUtils.getHashedValue(user.getPassword(), salt));
        user.setSalt(salt);
        user.setAdmin(false);
        userService.save(user);

        response.setStatus(200);
        JsonObject responseBody = new JsonObject();
        responseBody.addProperty("message", "Registered Successfully");
        String responseBodyJson = gson.toJson(responseBody);
        out.println(responseBodyJson);
    }
}
