package gov.iti.fusion.models;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import org.hibernate.Hibernate;

import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class GameGenreId implements Serializable {
    private static final long serialVersionUID = -3733070201665316346L;
    @Column(name = "games_id", nullable = false)
    private String gamesId;

    @Column(name = "genres_id", nullable = false)
    private String genresId;

    public String getGamesId() {
        return gamesId;
    }

    public void setGamesId(String gamesId) {
        this.gamesId = gamesId;
    }

    public String getGenresId() {
        return genresId;
    }

    public void setGenresId(String genresId) {
        this.genresId = genresId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        GameGenreId entity = (GameGenreId) o;
        return Objects.equals(this.genresId, entity.genresId) &&
                Objects.equals(this.gamesId, entity.gamesId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(genresId, gamesId);
    }

}