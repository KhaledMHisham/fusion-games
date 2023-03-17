package gov.iti.fusion.models;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import org.hibernate.Hibernate;

import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class PlatformGameId implements Serializable {
    private static final long serialVersionUID = 345024234683248235L;
    @Column(name = "game_id", nullable = false)
    private String gameId;

    @Column(name = "platform_id", nullable = false)
    private String platformId;

    public String getGameId() {
        return gameId;
    }

    public void setGameId(String gameId) {
        this.gameId = gameId;
    }

    public String getPlatformId() {
        return platformId;
    }

    public void setPlatformId(String platformId) {
        this.platformId = platformId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        PlatformGameId entity = (PlatformGameId) o;
        return Objects.equals(this.gameId, entity.gameId) &&
                Objects.equals(this.platformId, entity.platformId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(gameId, platformId);
    }

}