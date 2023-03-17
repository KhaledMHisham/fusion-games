package gov.iti.fusion.validation.servlets;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import gov.iti.fusion.models.User;
import gov.iti.fusion.services.UserService;
import jakarta.persistence.NoResultException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class EmailValidationServlet extends HttpServlet {
        @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            response.setContentType("application/json");
            Gson gson = new Gson();
            PrintWriter out = response.getWriter();
            UserService userService = new UserService(request);
            JsonObject requestBody = JsonParser.parseReader(request.getReader()).getAsJsonObject();
            String email = requestBody.get("email").getAsString();
            System.out.println(email);
            response.setStatus(200);
            JsonObject responseBody = new JsonObject();

            if (email.isEmpty()){
                responseBody.addProperty("status", "invalid");
                responseBody.addProperty("message", "");
            }
            else if(!hasValidFormat(email)){
                responseBody.addProperty("status", "invalid");
                responseBody.addProperty("message", "Invalid Email Format");
            }
            else{
                try {
                    userService.findUserbyEmail(email);
                    responseBody.addProperty("status", "invalid");
                    responseBody.addProperty("message", "Email is already taken");
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
        String regex = "^[a-zA-Z0-9.!#$%&'\\+/=?^_`{|}~\\-]+@[a-zA-Z0-9-]+(?:\\.[a-zA-Z0-9-]+){1,4}$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }
}
