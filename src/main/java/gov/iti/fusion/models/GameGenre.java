package gov.iti.fusion.models;

import jakarta.persistence.*;

@Entity
@Table(name = "games_genres")
public class GameGenre {
    @EmbeddedId
    private GameGenreId id = new GameGenreId();

    @MapsId("gamesId")
    @ManyToOne(fetch = FetchType.LAZY, optional = false, cascade = CascadeType.REFRESH)
    @JoinColumn(name = "games_id", nullable = false)
    private Game game;

    @MapsId("genresId")
    @ManyToOne(fetch = FetchType.LAZY, optional = false, cascade = CascadeType.REFRESH)
    @JoinColumn(name = "genres_id", nullable = false)
    private Genre genre;

    public GameGenre() {}

    public GameGenre(Game game, Genre genre) {
        this.game = game;
        this.genre = genre;
    }

    public GameGenreId getId() {
        return id;
    }

    public void setId(GameGenreId id) {
        this.id = id;
    }

    public Game getGame() {
        return game;
    }

    public void setGame(Game game) {
        this.game = game;
    }

    public Genre getGenre() {
        return genre;
    }

    public void setGenre(Genre genre) {
        this.genre = genre;
    }
}