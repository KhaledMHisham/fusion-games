package gov.iti.fusion.models;

import jakarta.persistence.*;

@Entity
@Table(name = "library")
public class LibraryItem {
    @EmbeddedId
    private LibraryItemId id = new LibraryItemId();
    @ManyToOne(fetch = FetchType.LAZY, optional = false, cascade = CascadeType.REFRESH)
    @MapsId("userId")
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @ManyToOne(fetch = FetchType.LAZY, optional = false, cascade = CascadeType.REFRESH)
    @MapsId("gameId")
    @JoinColumn(name = "game_id", nullable = false)
    private Game game;

    public LibraryItem(User user, Game game) {
        this.user = user;
        this.game = game;
    }

    public LibraryItem() {}

    public LibraryItemId getId() {
        return id;
    }

    public void setId(LibraryItemId id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;

    }

    public Game getGame() {
        return game;
    }

    public void setGame(Game game) {
        this.game = game;
    }

    @Override
    public String toString() {
        return "LibraryItem{" +
                "id=" + id +
                ", user=" + user +
                ", game=" + game +
                '}';
    }
}