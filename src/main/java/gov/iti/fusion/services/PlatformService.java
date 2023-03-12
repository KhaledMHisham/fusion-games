package gov.iti.fusion.services;

import java.util.UUID;

import gov.iti.fusion.models.Platform;
import gov.iti.fusion.persistence.repositories.PlatformsRepository;
import jakarta.servlet.http.HttpServletRequest;

public class PlatformService {
    
    private final PlatformsRepository platformsRepository;

    public PlatformService(HttpServletRequest request) {
        this.platformsRepository = new PlatformsRepository(request);
    }

    public Platform save(Platform platform){
        return platformsRepository.save(platform);
    }

    public Platform findById(String id){
        return platformsRepository.findById(Platform.class, id);
    }
  
}
