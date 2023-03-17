package gov.iti.fusion.models;

import jakarta.persistence.*;

@Entity
@Table(name = "cart_items")
public class CartItem {
    @EmbeddedId
    private CartItemId id = new CartItemId();

    @MapsId("userId")
    @ManyToOne(fetch = FetchType.LAZY, optional = false, cascade = CascadeType.REFRESH)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @MapsId("gameId")
    @ManyToOne(fetch = FetchType.LAZY, optional = false, cascade = CascadeType.REFRESH)
    @JoinColumn(name = "game_id", nullable = false)
    private Game game;

    public CartItem() {}

    public CartItem(User user, Game game) {
        this.user = user;
        this.game = game;
    }

    public CartItemId getId() {
        return id;
    }

    public void setId(CartItemId id) {
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

}