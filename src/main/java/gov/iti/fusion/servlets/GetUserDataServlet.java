package gov.iti.fusion.servlets;

import com.google.gson.JsonObject;
import gov.iti.fusion.models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.format.DateTimeFormatter;

public class GetUserDataServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User currentUser = (User) req.getAttribute("user");
        if(currentUser != null){
            PrintWriter out = resp.getWriter();
            JsonObject responseBody = new JsonObject();
            responseBody.addProperty("username", currentUser.getUsername());
            responseBody.addProperty("firstName", currentUser.getFirstName());
            responseBody.addProperty("lastName", currentUser.getLastName());
            responseBody.addProperty("email", currentUser.getEmail());
            responseBody.addProperty("creditLimit", currentUser.getCreditLimit());
            responseBody.addProperty("phoneNumber", currentUser.getPhoneNumber());
            responseBody.addProperty("birthDate", currentUser.getBirthDate().format(DateTimeFormatter.ofPattern("MM/dd/yyyy")));
            responseBody.addProperty("country", currentUser.getCountry());

            resp.setStatus(200);
            resp.setContentType("application/json");
            out.println(responseBody);
        }
        else{
            resp.sendRedirect("../login");
        }
    }
}
