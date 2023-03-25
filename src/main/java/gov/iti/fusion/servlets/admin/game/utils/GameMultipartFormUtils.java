package gov.iti.fusion.servlets.admin.game.utils;

import gov.iti.fusion.models.Game;
import gov.iti.fusion.models.GameSpec;
import gov.iti.fusion.models.Genre;
import gov.iti.fusion.models.Platform;
import gov.iti.fusion.services.DiscountService;
import gov.iti.fusion.services.GenreService;
import gov.iti.fusion.services.PlatformService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

import java.io.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;

public class GameMultipartFormUtils {

    public static final String BASE_IMAGE_URL = "C:\\fusion-games\\games\\images";
    public static final String BASE_FILE_URL = "C:\\fusion-games\\games\\files";


    public static void saveFileToDisk(HttpServletRequest request, String gameName, String parameterName) throws ServletException, IOException {
        saveFileToDisk(request, gameName, parameterName, BASE_FILE_URL);
    }
    public static void saveGameImageToDisk(HttpServletRequest request, String gameName, String parameterName) throws ServletException, IOException {
        saveFileToDisk(request, gameName, parameterName, BASE_IMAGE_URL);
    }

    private static void saveFileToDisk(HttpServletRequest request, String gameName, String parameterName, String baseImageUrl) throws IOException, ServletException {
        Part filePart = request.getPart(parameterName);
        OutputStream out = new FileOutputStream(new File(baseImageUrl, gameName));
        InputStream fileContent = filePart.getInputStream();
        byte[] buffer = new byte[1024];
        int bytesRead = 0;
        while ((bytesRead = fileContent.read(buffer)) != -1) {
            out.write(buffer, 0, bytesRead);
        }
        fileContent.close();
        out.close();
    }

    public static List<Genre> extractGenres(HttpServletRequest request, GenreService genreService) throws ServletException, IOException {
        Collection<Part> parts = request.getParts();
        List<Genre> genres = new ArrayList<>();
        for(Part part : parts){
            if(part.getName().equals("genres")){
                genres.add(genreService.findById(new Scanner(part.getInputStream()).useDelimiter("\\A").next()));
            }
        }
        return genres;
    }

    public static List<Platform> extractPlatforms(HttpServletRequest request, PlatformService platformService) throws ServletException, IOException {
        Collection<Part> parts = request.getParts();
        List<Platform> platforms = new ArrayList<>();
        for(Part part : parts){
            if(part.getName().equals("platforms")){
                platforms.add(platformService.findById(new Scanner(part.getInputStream()).useDelimiter("\\A").next()));
            }
        }
        return platforms;
    }

    public static Object extractPartData(HttpServletRequest request, String partName) throws IOException, ServletException {
        Part gameNamePart = request.getPart(partName);
        return gameNamePart != null ? new Scanner(gameNamePart.getInputStream()).useDelimiter("\\A").next() : null;
    }

}
