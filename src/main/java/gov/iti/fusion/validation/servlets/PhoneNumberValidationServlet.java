package gov.iti.fusion.validation.servlets;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import gov.iti.fusion.models.User;
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

public class PhoneNumberValidationServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        Gson gson = new Gson();
        PrintWriter out = response.getWriter();
        UserService userService = new UserService(request);
        JsonObject requestBody = JsonParser.parseReader(request.getReader()).getAsJsonObject();
        String phoneNumber = requestBody.get("phoneNumber").getAsString();
        System.out.println(phoneNumber);
        response.setStatus(200);
        JsonObject responseBody = new JsonObject();

        User currentUser = (User) request.getAttribute("user");
        if(currentUser != null && currentUser.getPhoneNumber().equals(phoneNumber)){
            responseBody.addProperty("status", "valid");
            responseBody.addProperty("message", "");
        }
        else if (phoneNumber.isEmpty()){
            responseBody.addProperty("status", "invalid");
            responseBody.addProperty("message", "");
        }
        else if(!hasValidFormat(phoneNumber)){
            responseBody.addProperty("status", "invalid");
            responseBody.addProperty("message", "Invalid phone number format");
        }
        else{
            try {
                userService.findUserbyPhoneNumber(phoneNumber);
                responseBody.addProperty("status", "invalid");
                responseBody.addProperty("message", "Phone number is already taken");
            }
            catch (NoResultException e){
                responseBody.addProperty("status", "valid");
                responseBody.addProperty("message", "");
            }
        }
        String responseBodyJson = gson.toJson(responseBody);
        out.println(responseBodyJson);
    }

    private boolean hasValidFormat(String phoneNumber){
        String regex = "^01[0125][0-9]{8}$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(phoneNumber);
        return matcher.matches();
    }


}
