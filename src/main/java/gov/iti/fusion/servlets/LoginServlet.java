package gov.iti.fusion.servlets;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import gov.iti.fusion.auth.JWTManagerSingleton;
import gov.iti.fusion.models.*;
import gov.iti.fusion.services.*;
import gov.iti.fusion.utils.HashUtils;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.jose4j.jws.JsonWebSignature;
import org.jose4j.jwt.JwtClaims;
import org.jose4j.jwt.NumericDate;
import org.jose4j.lang.JoseException;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.time.LocalDate;
import java.util.Date;




public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getAttribute("user") == null){
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("login.html");
            requestDispatcher.forward(request, response);
        }
        else{
            response.sendRedirect("home");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json");
        Gson gson = new Gson();
        PrintWriter out = response.getWriter();
        UserService userService = new UserService(request);
        JsonObject requestBody = JsonParser.parseReader(request.getReader()).getAsJsonObject();

        String email = requestBody.get("email").getAsString();
        String password = requestBody.get("password").getAsString();

        User user = userService.findUserbyEmail(email);
        String hashedPassword = HashUtils.getHashedValue(password, user.getSalt());
        if(user != null && user.getPassword().equals(hashedPassword)){
            try {
                JsonWebSignature jws = JWTManagerSingleton.INSTANCE.getNewSignedToken();
                Date now = new Date();
                JwtClaims claims = new JwtClaims();
                claims.setIssuer("http://"+ InetAddress.getLocalHost().getHostAddress() + ":8888/fusion/api");
                claims.setAudience(request.getRemoteAddr());
                claims.setSubject(user.getId().toString());
                claims.setIssuedAt( NumericDate.fromMilliseconds(now.getTime()));
                claims.setExpirationTime(NumericDate.fromMilliseconds(now.getTime() + 86400000));
                claims.setClaim("username", user.getUsername());
                claims.setClaim("first_name", user.getFirstName());
                claims.setClaim("last_name", user.getLastName());
                claims.setClaim("email", user.getEmail());
                claims.setClaim("phone_number", user.getPhoneNumber());
                claims.setClaim("birth_date", LocalDate.now());
                claims.setClaim("gender", user.getGender());
                claims.setClaim("country", user.getCountry());
                claims.setClaim("admin", user.isAdmin());
                jws.setPayload(claims.toJson());

                String jwt = jws.getCompactSerialization();
                response.setStatus(200);
                response.addCookie(new Cookie("auth_token", jwt));
                JsonObject responseBody = new JsonObject();
                responseBody.addProperty("message", "logged in successfully");

                String responseBodyJson = gson.toJson(responseBody);
                out.println(responseBodyJson);
            } catch (JoseException e) {
                e.printStackTrace();
            }
        }
        else{
            response.setStatus(401);
            JsonObject responseBody = new JsonObject();
            responseBody.addProperty("message", "Unauthorized");
            String responseBodyJson = gson.toJson(responseBody);
            out.println(responseBodyJson);
        }
    }
}

