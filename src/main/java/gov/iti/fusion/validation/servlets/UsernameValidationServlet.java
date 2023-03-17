package gov.iti.fusion.validation.servlets;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import gov.iti.fusion.services.UserService;
import jakarta.persistence.NoResultException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class UsernameValidationServlet extends HttpServlet {
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            response.setContentType("application/json");
            Gson gson = new Gson();
            PrintWriter out = response.getWriter();
            UserService userService = new UserService(request);
            JsonObject requestBody = JsonParser.parseReader(request.getReader()).getAsJsonObject();
            String username = requestBody.get("username").getAsString();
            System.out.println(username);
            response.setStatus(200);
            JsonObject responseBody = new JsonObject();

            if (username.isEmpty()){
                responseBody.addProperty("status", "invalid");
                responseBody.addProperty("message", "");
            }
            else if(!hasValidFormat(username)){
                responseBody.addProperty("status", "invalid");
                responseBody.addProperty("message", "Invalid username format");
            }
            else{
                try {
                    userService.findUserbyUsername(username);
                    responseBody.addProperty("status", "invalid");
                    responseBody.addProperty("message", "Username is already taken");
                }
                catch (NoResultException e){
                    responseBody.addProperty("status", "valid");
                    responseBody.addProperty("message", "");
                }
            }
            String responseBodyJson = gson.toJson(responseBody);
            out.println(responseBodyJson);
        }

    private boolean hasValidFormat(String email){
        String regex = "^[A-Za-z0-9-]{6,15}$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }
}
