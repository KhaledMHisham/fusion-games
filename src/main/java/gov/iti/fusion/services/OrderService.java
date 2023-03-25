package gov.iti.fusion.services;

import gov.iti.fusion.models.Game;
import gov.iti.fusion.models.Order;
import gov.iti.fusion.models.OrderedGame;
import gov.iti.fusion.persistence.repositories.OrderRepository;
import gov.iti.fusion.persistence.repositories.OrderedGameRepository;
import jakarta.servlet.http.HttpServletRequest;

import java.util.List;

public class OrderService {

    private final OrderRepository orderRepository;
    private final OrderedGameRepository orderedGameRepository;

    public OrderService(HttpServletRequest request) {
        this.orderRepository = new OrderRepository(request);
        this.orderedGameRepository = new OrderedGameRepository(request);
    }

    public Order findById(String id){
        return orderRepository.findById(Order.class, id);
    }

    public Order save(Order order){
        return orderRepository.save(order);
    }


    public void addGameToOrder(Order order,Game game){
        OrderedGame orderedGame = new OrderedGame(game, order);
        Double totalPrice = order.getTotalPrice();
        totalPrice+=game.getNetPrice();
        order.setTotalPrice(totalPrice);
        orderedGameRepository.save(orderedGame);

    }

    
    public void addGamesToOrder(Order order, List<Game> games){
        for(Game game : games){
            addGameToOrder(order, game);
        }
    }
}
