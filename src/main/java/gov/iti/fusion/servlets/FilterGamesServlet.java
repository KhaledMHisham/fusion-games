package gov.iti.fusion.servlets;

import com.google.gson.Gson;
import gov.iti.fusion.mappers.GameMapper;
import gov.iti.fusion.models.Dto.GameDto;
import gov.iti.fusion.models.Game;
import gov.iti.fusion.services.GameService;
import gov.iti.fusion.services.UserService;
import jakarta.json.bind.Jsonb;
import jakarta.json.bind.JsonbBuilder;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.jose4j.json.internal.json_simple.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

public class FilterGamesServlet extends HttpServlet {
    ServletConfig myConfig;

    @Override
    public void destroy() {
        System.out.println("I am inside the destroy method");
        
    }

    @Override
    public ServletConfig getServletConfig() {
        return myConfig;
    }

    @Override
    public String getServletInfo() {
        return null;
    }

    @Override
    public void init(ServletConfig config) throws ServletException {
        System.out.println("I am inside the init method");
        myConfig=config;
        
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserService userService = new UserService(request);
        GameService gameService = new GameService(request);
        Gson gson = new Gson();
        BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
        String message = "";
        if (br != null) {
            message = br.readLine();
        }
        JSONObject msg = gson.fromJson(message, JSONObject.class);

        System.out.println("dis" + msg.get("discounts"));

        List<String> genres = (List<String>)msg.get("genres");
        List<String> discounts = (List<String>)msg.get("discounts");
        List<String> platforms = (List<String>)msg.get("platforms");

        Double minPrice = Double.parseDouble((String)msg.get("minPrice"));
        Double maxPrice =  Double.parseDouble((String) msg.get("maxPrice"));

        List<Game> allGames = gameService.findAllGames();
        List<Game> gamesWithoutDiscount = new LinkedList<>();
        gamesWithoutDiscount =  gameService.findGamesWithNoDiscount();

        List<Game> filteredGames = allGames.stream().filter(g -> g.getGenres().stream()
                                                    .map(ge->ge.getGenre().getGenre())
                                                    .anyMatch(genres.stream().collect(Collectors.toSet())::contains))
                                                    .collect(Collectors.toCollection(ArrayList::new));

        
        filteredGames = filteredGames.stream().filter(g -> g.getPlatfomrs().stream().map(p->p.getType().getPlatformType())
                                                 .anyMatch(platforms.stream().collect(Collectors.toSet())::contains))
                                                 .collect(Collectors.toCollection(ArrayList::new));

        

        filteredGames = filteredGames.stream().filter(g -> g.getDiscount()!=null && 
        discounts.contains(Integer.toString((g.getDiscount()
                                                .getType()
                                              .getDiscount()))))
                                              .collect(Collectors.toCollection(ArrayList::new));
        if(discounts.size()==0){
            System.out.println(gamesWithoutDiscount.size() + " game with no dis");
            filteredGames.addAll(gamesWithoutDiscount);
        }
        filteredGames = filteredGames.stream().filter(g -> g.getPrice()>=minPrice && g.getPrice()<=maxPrice)
                                                .collect(Collectors.toCollection(ArrayList::new));


       
       
        List<GameDto> filtereGameDtos = new ArrayList<>();
        for(Game game :filteredGames ){
            filtereGameDtos.add(GameMapper.entityToDTO(game));
        }
        System.out.println("filter "  + filtereGameDtos.size());

        // String json = gson.toJson(filtereGameDtos);
        // ObjectMapper objectMapper = new ObjectMapper();
        // String json = objectMapper.writeValueAsString(filtereGameDtos);

         Jsonb jsonb = JsonbBuilder.create(); 
         String result = jsonb.toJson(filtereGameDtos); 

        System.out.println(result);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(result);



    }
    
    
}
