package gov.iti.fusion.servlets.game;

import jakarta.servlet.*;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

public class GamePictureServlet extends HttpServlet {

    private final String BASE_GAME_PICTURE_PATH = "C:\\fusion-games\\games\\images\\";
    private static final String IMAGE_TYPE = "image/png";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestURI = request.getRequestURI();
        String[] urlParts = requestURI.split("/");
        String fileName = urlParts[urlParts.length - 1];
        File imageFile = new File(BASE_GAME_PICTURE_PATH + fileName);
        byte[] imageData = Files.readAllBytes(imageFile.toPath());
        response.setContentType(IMAGE_TYPE);
        response.setContentLength(imageData.length);
        response.getOutputStream().write(imageData);
        response.getOutputStream().flush();
    }
}
