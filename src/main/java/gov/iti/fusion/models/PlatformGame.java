package gov.iti.fusion.models;

import jakarta.persistence.*;

import java.util.Objects;

@Entity
@Table(name = "platforms_games")
public class PlatformGame {
    @EmbeddedId
    private PlatformGameId id = new PlatformGameId();

    @MapsId("gameId")
    @ManyToOne(fetch = FetchType.LAZY, optional = false, cascade = CascadeType.REFRESH)
    @JoinColumn(name = "game_id", nullable = false)
    private Game game;

    @MapsId("platformId")
    @ManyToOne(fetch = FetchType.LAZY, optional = false, cascade = CascadeType.REFRESH)
    @JoinColumn(name = "platform_id", nullable = false)
    private Platform platform;

    public PlatformGame() {}

    public PlatformGame(Game game, Platform platform) {
        this.game = game;
        this.platform = platform;
    }

    public PlatformGameId getId() {
        return id;
    }

    public void setId(PlatformGameId id) {
        this.id = id;
    }

    public Game getGame() {
        return game;
    }

    public void setGame(Game game) {
        this.game = game;
    }

    public Platform getPlatform() {
        return platform;
    }

    public void setPlatform(Platform platform) {
        this.platform = platform;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        PlatformGame that = (PlatformGame) o;

        if (!Objects.equals(id, that.id)) return false;
        if (!Objects.equals(game, that.game)) return false;
        return Objects.equals(platform, that.platform);
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (game != null ? game.hashCode() : 0);
        result = 31 * result + (platform != null ? platform.hashCode() : 0);
        return result;
    }
}