package gov.iti.fusion.models;

import jakarta.persistence.*;

@Entity
@Table(name = "ordered_games")
public class OrderedGame {
    @EmbeddedId
    private OrderedGameId id;

    @MapsId("gameId")
    @ManyToOne(fetch = FetchType.LAZY, optional = false, cascade = CascadeType.REFRESH)
    @JoinColumn(name = "game_id", nullable = false)
    private Game game;

    @MapsId("orderId")
    @ManyToOne(fetch = FetchType.LAZY, optional = false, cascade = CascadeType.REFRESH)
    @JoinColumn(name = "order_id", nullable = false)
    private Order order;

    public OrderedGame() {}

    public OrderedGame(Game game, Order order) {
        this.game = game;
        this.order = order;
    }

    public OrderedGameId getId() {
        return id;
    }

    public void setId(OrderedGameId id) {
        this.id = id;
    }

    public Game getGame() {
        return game;
    }

    public void setGame(Game game) {
        this.game = game;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }
}