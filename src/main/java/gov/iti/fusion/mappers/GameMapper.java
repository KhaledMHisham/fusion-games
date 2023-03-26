package gov.iti.fusion.mappers;

import gov.iti.fusion.models.Game;
import gov.iti.fusion.models.Dto.GameDto;

public class GameMapper {
    
    
    public static GameDto entityToDTO(Game gameEntity) {
        Integer discount = gameEntity.getDiscount()!= null
                                                        ?gameEntity.getDiscount().getType().getDiscount()
                                                        :null;
        GameDto gameDto = new GameDto(gameEntity.getId(), gameEntity.getName(),
                                    gameEntity.getPrice(),discount,
                                    gameEntity.getPictureUrl(),gameEntity.getDescription(),gameEntity.getNetPrice());
        return gameDto;

    }
}
