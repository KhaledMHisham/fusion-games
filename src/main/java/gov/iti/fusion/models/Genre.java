package gov.iti.fusion.models;

import java.util.Set;
import java.util.UUID;
import org.hibernate.annotations.UuidGenerator;
import org.hibernate.annotations.UuidGenerator.Style;
import gov.iti.fusion.models.enums.GenreType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;

@Entity
@Table(name="genres")
public class Genre {
    @Id
    @UuidGenerator(style = Style.TIME)
    private String id;

    
    @Enumerated(EnumType.STRING)
    @Column(unique = true, nullable = false)
    private GenreType genre;

    @ManyToMany(mappedBy = "genres")
    private Set<Game> games;

    public Genre() {
    }
    public Genre(GenreType genre, Set<Game> games) {
        this.genre = genre;
        this.games = games;
    }   
    public Genre(GenreType genre) {
        this.genre = genre;
    }    

    public String getId() {
        return id;
    }
    public void setId(String id) {
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
    @Override
    public String toString() {
        return "Genre [id=" + id + ", genre=" + genre + "]";
    }
     
}
