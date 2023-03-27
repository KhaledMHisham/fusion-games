package gov.iti.fusion.mappers;

import java.util.ArrayList;
import java.util.List;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import gov.iti.fusion.models.Game;
import gov.iti.fusion.models.Order;
import gov.iti.fusion.models.Dto.GameDto;
import gov.iti.fusion.models.Dto.OrderDto;


public interface OrderMapper {
    
    public static OrderDto entityToDTO(Order orderEntity) {
        List<String> orderingGamesName = orderEntity.getOrderedGames().stream()
        .map(Game::getName)
        .toList();
        String fullName = orderEntity.getOrderingUser().getFirstName() + " " + orderEntity.getOrderingUser().getLastName();
        OrderDto orderDto = new OrderDto(orderEntity.getId(),orderEntity.getCreatedAt(),
                                        orderEntity.getTotalPrice(),fullName,orderingGamesName);
        return orderDto;

    }
}
 