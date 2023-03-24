package gov.iti.fusion.models;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import org.hibernate.Hibernate;

import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class OrderedGameId implements Serializable {
    private static final long serialVersionUID = -111631734670454815L;
    @Column(name = "game_id", nullable = false)
    private String gameId;

    public OrderedGameId(String gameId, String orderId) {
        this.gameId = gameId;
        this.orderId = orderId;
    }

    @Column(name = "order_id", nullable = false)
    private String orderId;

    public String getGameId() {
        return gameId;
    }

    public void setGameId(String gameId) {
        this.gameId = gameId;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        OrderedGameId entity = (OrderedGameId) o;
        return Objects.equals(this.gameId, entity.gameId) &&
                Objects.equals(this.orderId, entity.orderId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(gameId, orderId);
    }

}