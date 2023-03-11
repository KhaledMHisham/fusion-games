package gov.iti.fusion.models;

import java.util.HashSet;
import java.util.Set;

import gov.iti.fusion.models.enums.GenreType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;

@Entity
@Table(name="genres")
public class Genre {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Enumerated(EnumType.STRING)
    @Column(unique = true, nullable = false)
    private GenreType genre;

    @ManyToMany(fetch=FetchType.LAZY,mappedBy = "genres")
    private Set<Game> games = new HashSet<>();
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public GenreType getGenre() {
        return genre;
    }
    public void setGenre(GenreType genre) {
        this.genre = genre;
    }
    public Set<Game> getGames() {
        return games;
    }
    public void setGames(Set<Game> games) {
        this.games = games;
    }
    public Genre() {
    }
    public Genre(GenreType genre, Set<Game> games) {
        this.genre = genre;
        this.games = games;
    }   
    public Genre(GenreType genre) {
        this.genre = genre;
    }    



}
