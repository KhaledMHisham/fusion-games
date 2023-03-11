package gov.iti.fusion.services;

import gov.iti.fusion.models.Genre;
import gov.iti.fusion.persistence.repositories.GenreRepository;

public class GenreService {
    
    private final GenreRepository genreRepository = new GenreRepository();

    public Genre save(Genre genre){
        return genreRepository.save(genre);
    }

    public Genre findById(Long id){
        return genreRepository.find(id);
    }
  
}
