package gov.iti.fusion.models;

import java.time.LocalDate;
import java.util.Collections;
import java.util.List;
import java.util.Set;

import jakarta.persistence.*;
import org.hibernate.annotations.UuidGenerator;
import org.hibernate.annotations.UuidGenerator.Style;

@Entity
@Table(name = "orders")
public class Order {

    @Id
    @UuidGenerator(style = Style.TIME)
    private String id;


    @Column(name = "created_at", nullable = false)
    private LocalDate createdAt;
    
    @Column(name = "total_price", nullable = false)
    private Double totalPrice;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User orderingUser;


    @OneToMany(mappedBy = "order")
    private Set<OrderedGame> orderedGames;

    {
        totalPrice=0.0;
    }

    public Order(LocalDate createdAt, Double totalPrice) {
        this.createdAt = createdAt;
        this.totalPrice = totalPrice;
    }

    public Order() {}

    public Order(LocalDate createdAt) {
        this.createdAt = createdAt;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public LocalDate getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDate createdAt) {
        this.createdAt = createdAt;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public User getOrderingUser() {
        return orderingUser;
    }

    public void setOrderingUser(User orderingUser) {
        this.orderingUser = orderingUser;
    }

    public List<Game> getOrderedGames() {
        return Collections.unmodifiableList(orderedGames.stream().map(OrderedGame::getGame).toList());
    }
    @Override
    public String toString() {
        return "Order [id=" + id + ", createdAt=" + createdAt + ", totalPrice=" + totalPrice + "]";
    }
    

}
