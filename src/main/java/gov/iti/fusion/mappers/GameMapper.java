package gov.iti.fusion.mappers;

import gov.iti.fusion.models.Game;
import gov.iti.fusion.models.Dto.GameDto;

public class GameMapper {
    
    
    public static GameDto entityToDTO(Game gameEntity) {
        GameDto gameDto = new GameDto(gameEntity.getId(), gameEntity.getName(),
                                    gameEntity.getPrice(),gameEntity.getDiscount().getType().getDiscount(),
                                    gameEntity.getPictureUrl(),gameEntity.getDescription(),gameEntity.getNetPrice());
        return gameDto;

    }
}
