package gov.iti.fusion.models;

import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.Set;
import jakarta.persistence.*;
import org.hibernate.annotations.UuidGenerator;
import org.hibernate.annotations.UuidGenerator.Style;
import gov.iti.fusion.models.enums.GenreType;

@Entity
@Table(name="genres")
public class Genre{
    @Id
    @UuidGenerator(style = Style.TIME)
    private String id;

    
    @Enumerated(EnumType.STRING)
    @Column(unique = true, nullable = false)
    private GenreType genre;

    @OneToMany(mappedBy = "genre")
    private Set<GameGenre> gameGenres;

    public Genre() {}

    public Genre(GenreType genre, Set<GameGenre> gameGenres) {
        this.genre = genre;
        this.gameGenres = gameGenres;
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
    public List<Game> getGames() {
        return Collections.unmodifiableList(gameGenres.stream().map(GameGenre::getGame).toList());
    }
    @Override
    public String toString() {
        return "Genre [id=" + id + ", genre=" + genre + "]";
    }

    public String getName(){
        return genre.getGenre();
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Genre genre1 = (Genre) o;

        if (!Objects.equals(id, genre1.id)) return false;
        if (genre != genre1.genre) return false;
        return Objects.equals(gameGenres, genre1.gameGenres);
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (genre != null ? genre.hashCode() : 0);
        result = 31 * result + (gameGenres != null ? gameGenres.hashCode() : 0);
        return result;
    }
}
