package gov.iti.fusion.servlets.admin.game;

import com.google.gson.*;
import gov.iti.fusion.models.Game;
import gov.iti.fusion.models.GameSpec;
import gov.iti.fusion.models.Genre;
import gov.iti.fusion.models.Platform;
import gov.iti.fusion.services.DiscountService;
import gov.iti.fusion.services.GameService;
import gov.iti.fusion.services.GenreService;
import gov.iti.fusion.services.PlatformService;
import gov.iti.fusion.servlets.admin.game.utils.GameMultipartFormUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Objects;
import java.util.UUID;

@MultipartConfig(
        fileSizeThreshold = -1,
        maxFileSize = -1,
        maxRequestSize = -1
)
public class EditGameServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        GameService gameService = new GameService(request);
        DiscountService discountService = new DiscountService(request);
        GenreService genreService = new GenreService(request);
        PlatformService platformService = new PlatformService(request);

        String gameId = (String) GameMultipartFormUtils.extractPartData(request, "edit-id");
        Game currentGame = gameService.findById(gameId);

        updateGameFromRequest(request, currentGame, discountService);
        saveGameFiles(request, currentGame);
        updateGameSpecsFromRequest(request, currentGame);
        updateGenresAndPlatforms(request, currentGame,gameService, genreService, platformService);

        gameService.save(currentGame);
        response.sendRedirect("../../admin");
    }

    private void updateGameFromRequest(HttpServletRequest request, Game currentGame, DiscountService discountService) throws ServletException, IOException {
        currentGame.setName((String) GameMultipartFormUtils.extractPartData(request, "edit-game-name"));
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String releaseDate = (String) GameMultipartFormUtils.extractPartData(request, "edit-release-date");
        LocalDate localDate = releaseDate != null ? LocalDate.parse(releaseDate, formatter) : null;
        currentGame.setReleaseDate(localDate);
        currentGame.setDeveloper((String) GameMultipartFormUtils.extractPartData(request, "edit-developer"));
        currentGame.setPrice(Double.valueOf((String) Objects.requireNonNull(GameMultipartFormUtils.extractPartData(request, "edit-price"))));
        currentGame.setDiscount(discountService.findById((String) GameMultipartFormUtils.extractPartData(request, "edit-discount")));
        currentGame.setPublisher((String) GameMultipartFormUtils.extractPartData(request, "edit-publisher"));
        currentGame.setDescription((String) GameMultipartFormUtils.extractPartData(request, "edit-description"));
        updateGamePictureFromRequest(request, currentGame);
    }

    private void updateGamePictureFromRequest(HttpServletRequest request, Game currentGame) throws ServletException, IOException {
        if (request.getPart("edit-game-picture").getSize() != 0) {
            String uuid = UUID.randomUUID().toString();
            currentGame.setPictureUrl("games/images/" + uuid + ".png");
            GameMultipartFormUtils.saveGameImageToDisk(request, uuid + ".png", "edit-game-picture");
        }
    }

    private void saveGameFiles(HttpServletRequest request, Game currentGame) throws ServletException, IOException {
        if (request.getPart("edit-game-files").getSize() != 0) {
            String uuid = UUID.randomUUID().toString();
            currentGame.setGameFileUrl("games/files/" + uuid);
            GameMultipartFormUtils.saveFileToDisk(request, uuid, "edit-game-files");
        }
    }

    private void updateGameSpecsFromRequest(HttpServletRequest request, Game currentGame) throws ServletException, IOException {
        currentGame.getMinimumSpec().setProcessor((String) GameMultipartFormUtils.extractPartData(request, "edit-minimum-processor"));
        currentGame.getMinimumSpec().setGraphicsCard((String) GameMultipartFormUtils.extractPartData(request, "edit-minimum-gpu"));
        currentGame.getMinimumSpec().setMemory(Integer.valueOf((String) GameMultipartFormUtils.extractPartData(request, "edit-minimum-ram")));
        currentGame.getMinimumSpec().setStorage(Integer.valueOf((String) GameMultipartFormUtils.extractPartData(request, "edit-minimum-storage")));
        currentGame.getMinimumSpec().setDirectXVersion(Integer.valueOf((String) GameMultipartFormUtils.extractPartData(request, "edit-minimum-dxversion")));
        currentGame.getRecommendedSpec().setProcessor((String) GameMultipartFormUtils.extractPartData(request, "edit-minimum-processor"));
        currentGame.getRecommendedSpec().setGraphicsCard((String) GameMultipartFormUtils.extractPartData(request, "edit-minimum-gpu"));
        currentGame.getRecommendedSpec().setMemory(Integer.valueOf((String) GameMultipartFormUtils.extractPartData(request, "edit-minimum-ram")));
        currentGame.getRecommendedSpec().setStorage(Integer.valueOf((String) GameMultipartFormUtils.extractPartData(request, "edit-minimum-storage")));
        currentGame.getRecommendedSpec().setDirectXVersion(Integer.valueOf((String) GameMultipartFormUtils.extractPartData(request, "edit-minimum-dxversion")));
    }

    private void updateGenresAndPlatforms(HttpServletRequest request, Game game,GameService gameService, GenreService genreService, PlatformService platformService) throws IOException, ServletException {
        gameService.clearGenresFromGame(game);
        gameService.clearPlatformsFromGame(game);
        gameService.addGenresToGame(game, GameMultipartFormUtils.extractGenres(request, genreService));
        gameService.addPlatformsToGame(game, GameMultipartFormUtils.extractPlatforms(request, platformService));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        GameService gameService = new GameService(request);
        String gameId = request.getParameter("gameId");
        PrintWriter out  = response.getWriter();

        Game game = gameService.findById(gameId);

        JsonObject responseBody = new JsonObject();

        responseBody.add("gameInfo", extractGameInfo(game));
        responseBody.add("genres", extractGenres(game));
        responseBody.add("platforms", extractPlatforms(game));
        responseBody.add("minimumSpec", extractMinimumSpec(game));
        responseBody.add("recommendedSpec", extractRecommendedSpec(game));

        response.setContentType("application/json");
        response.setStatus(200);
        out.print(responseBody);
    }

    private JsonElement extractGameInfo(Game game){
        JsonObject gameInfo = new JsonObject();
        gameInfo.addProperty("id", game.getId());
        gameInfo.addProperty("name", game.getName());
        gameInfo.addProperty("price", game.getPrice());
        gameInfo.addProperty("discount", game.getDiscount().getId());
        gameInfo.addProperty("developer", game.getDeveloper());
        gameInfo.addProperty("publisher", game.getPublisher());
        gameInfo.addProperty("description", game.getDescription());
        gameInfo.addProperty("releaseDate", game.getReleaseDate().format(DateTimeFormatter.ofPattern("MM/dd/yyyy")));
        gameInfo.addProperty("description", game.getDescription());
        return gameInfo;
    }
    private JsonElement extractGenres(Game game){
        JsonArray jsonArray = new JsonArray();
        game.getGenres()
                .stream()
                .map(Genre::getId)
                .forEach(jsonArray::add);
        return jsonArray;
    }

    private JsonElement extractPlatforms(Game game){
        JsonArray jsonArray = new JsonArray();
        game.getPlatfomrs()
                .stream()
                .map(Platform::getId)
                .forEach(jsonArray::add);
        return jsonArray;
    }

    private JsonElement extractMinimumSpec(Game game) {
        GameSpec minimumSpec = game.getMinimumSpec();
        return getSpecJson(minimumSpec);
    }
    private JsonElement extractRecommendedSpec(Game game) {
        GameSpec recommendedSpec = game.getRecommendedSpec();
        return getSpecJson(recommendedSpec);
    }
    private JsonElement getSpecJson(GameSpec spec) {
        JsonObject jsonObject =   new JsonObject();
        jsonObject.addProperty("cpu", spec.getProcessor());
        jsonObject.addProperty("gpu", spec.getGraphicsCard());
        jsonObject.addProperty("ram", spec.getMemory());
        jsonObject.addProperty("storage", spec.getStorage());
        jsonObject.addProperty("dxVersion", spec.getDirectXVersion());
        return jsonObject;
    }
}
