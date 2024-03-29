package gov.iti.fusion.services;

import java.util.List;
import java.util.UUID;

import gov.iti.fusion.models.Genre;
import gov.iti.fusion.models.enums.GenreType;
import gov.iti.fusion.persistence.repositories.GenreRepository;
import jakarta.servlet.http.HttpServletRequest;

public class GenreService {
    
    private final GenreRepository genreRepository;

    public GenreService(HttpServletRequest request) {
        this.genreRepository = new GenreRepository(request);
    }

    public Genre save(Genre genre){
        return genreRepository.save(genre);
    }

    public Genre findById(String id){
        return genreRepository.findById(Genre.class, id);
    }
    public List<Genre> findAllGenre(){
        return genreRepository.findAll(Genre.class);
    }
    public Integer groupGameWithGenre(GenreType genreType){
        return genreRepository.groupGameWithGenre(genreType);
    }
  
}
