package gov.iti.fusion.services;

import gov.iti.fusion.models.Platform;
import gov.iti.fusion.persistence.repositories.PlatformsRepository;

public class PlatformService {
    
    private final PlatformsRepository platformsRepository = new PlatformsRepository();

    public Platform save(Platform platform){
        return platformsRepository.save(platform);
    }

    public Platform findById(Long id){
        return platformsRepository.find(id);
    }
  
}
