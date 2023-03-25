package gov.iti.fusion.servlets.admin.game;

import java.io.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Objects;
import java.util.UUID;

import gov.iti.fusion.models.*;
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

import static gov.iti.fusion.servlets.admin.game.utils.GameMultipartFormUtils.*;


@MultipartConfig(
        fileSizeThreshold = -1,
        maxFileSize = -1,
        maxRequestSize = -1
)
public class AddGameServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        GameService gameService = new GameService(request);
        GenreService genreService = new GenreService(request);
        DiscountService discountService = new DiscountService(request);
        PlatformService platformService = new PlatformService(request);

        Game game = extractGameData(request, discountService);

        gameService.save(game);
        gameService.addGenresToGame(game, GameMultipartFormUtils.extractGenres(request, genreService));
        gameService.addPlatformsToGame(game, GameMultipartFormUtils.extractPlatforms(request, platformService));
        response.sendRedirect("../../admin");
    }

    Game extractGameData(HttpServletRequest request, DiscountService discountService) throws ServletException, IOException {
        Game game = new Game();
        String uuid = UUID.randomUUID().toString();
        game.setName((String) extractPartData(request, "add-game-name"));
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String releaseDate = (String) extractPartData(request, "add-release-date");
        LocalDate localDate = releaseDate != null ? LocalDate.parse(releaseDate, formatter) : null;
        game.setReleaseDate(localDate);
        game.setDeveloper((String) extractPartData(request, "add-developer"));
        game.setPrice(Double.valueOf((String) Objects.requireNonNull(extractPartData(request, "add-price"))));

        String discount = (String) extractPartData(request, "add-discount");
        if(!"NONE".equals(discount)){
            game.setDiscount(discountService.findById((String) extractPartData(request, "add-discount")));
        }

        game.setPublisher((String) extractPartData(request, "add-publisher"));
        game.setDescription((String) extractPartData(request, "add-description"));
        game.setPictureUrl("games/images/" + uuid +".png");
        game.setGameFileUrl("games/files" + uuid);
        GameMultipartFormUtils.saveGameImageToDisk(request, uuid+".png", "add-game-picture");
        GameMultipartFormUtils.saveFileToDisk(request, uuid,"add-game-files");
        game.setMinimumSpec(extractMinimumGameSpec(request));
        game.setRecommendedSpec(extractRecommendedGameSpec(request));
        return game;
    }

    public GameSpec extractRecommendedGameSpec(HttpServletRequest request) throws ServletException, IOException {
        GameSpec recommendedSpec = new GameSpec();
        recommendedSpec.setProcessor((String) extractPartData(request, "add-recommended-processor"));
        recommendedSpec.setGraphicsCard((String) extractPartData(request, "add-recommended-gpu"));
        recommendedSpec.setMemory(Integer.valueOf((String) Objects.requireNonNull(extractPartData(request, "add-recommended-ram"))));
        recommendedSpec.setStorage(Integer.valueOf((String) Objects.requireNonNull(extractPartData(request, "add-recommended-storage"))));
        recommendedSpec.setDirectXVersion(Integer.valueOf((String) Objects.requireNonNull(extractPartData(request, "add-recommended-dxversion"))));
        return recommendedSpec;
    }

    public GameSpec extractMinimumGameSpec(HttpServletRequest request) throws ServletException, IOException {
        GameSpec minimumSpec = new GameSpec();
        minimumSpec.setProcessor((String) extractPartData(request, "add-minimum-processor"));
        minimumSpec.setGraphicsCard((String) extractPartData(request, "add-minimum-gpu"));
        minimumSpec.setMemory(Integer.valueOf((String) Objects.requireNonNull(extractPartData(request, "add-minimum-ram"))));
        minimumSpec.setStorage(Integer.valueOf((String) Objects.requireNonNull(extractPartData(request, "add-minimum-storage"))));
        minimumSpec.setDirectXVersion(Integer.valueOf((String) Objects.requireNonNull(extractPartData(request, "add-minimum-dxversion"))));
        return minimumSpec;
    }

}
