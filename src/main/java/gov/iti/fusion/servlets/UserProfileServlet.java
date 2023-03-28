package gov.iti.fusion.servlets;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import gov.iti.fusion.models.User;
import gov.iti.fusion.services.UserService;
import gov.iti.fusion.utils.HashUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class UserProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User currentUser = (User) req.getAttribute("user");
        if(currentUser != null){
            req.getRequestDispatcher("../user-profile.jsp").forward(req, resp);
        }
        else{
            resp.sendRedirect("../login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        JsonObject requestBody = JsonParser.parseReader(req.getReader()).getAsJsonObject();
        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        UserService userService = new UserService(req);

        User currentUser = (User) req.getAttribute("user");
        currentUser.setUsername(requestBody.get("username").getAsString());
        currentUser.setFirstName(requestBody.get("firstName").getAsString());
        currentUser.setLastName(requestBody.get("lastName").getAsString());
        currentUser.setEmail(requestBody.get("email").getAsString());
        currentUser.setPhoneNumber(requestBody.get("phoneNumber").getAsString());
        currentUser.setPassword(HashUtils.getHashedValue(requestBody.get("password").getAsString(), currentUser.getSalt()));
        currentUser.setCountry(requestBody.get("country").getAsString());
        currentUser.setBirthDate(LocalDate.parse(requestBody.get("birthDate").getAsString(), dateTimeFormatter));
        currentUser.setCreditLimit(Double.parseDouble(requestBody.get("creditLimit").getAsString()));
        userService.save(currentUser);

        JsonObject responseBody = new JsonObject();
        responseBody.addProperty("status", "User profile edited successfully");
        resp.setStatus(200);
        resp.setContentType("application/json");
        out.println(responseBody);
    }
}
