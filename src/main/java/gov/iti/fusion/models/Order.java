package gov.iti.fusion.models;

import java.time.LocalDate;
import java.util.Set;
import java.util.UUID;
import org.hibernate.annotations.UuidGenerator;
import org.hibernate.annotations.UuidGenerator.Style;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "orders")
public class Order {

    @Id
    @UuidGenerator(style = Style.TIME)
    private UUID id;


    @Column(name = "created_at", nullable = false)
    private LocalDate createdAt;
    
    @Column(name = "total_price", nullable = false)
    private Double totalPrice;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User orderingUser;


    @ManyToMany
    @JoinTable(name = "ordered_games",
                joinColumns = @JoinColumn(name = "game_id"),
                inverseJoinColumns = @JoinColumn(name = "order_id"))
    private Set<Game> games;

    
    public Order(LocalDate createdAt, Double totalPrice) {
        this.createdAt = createdAt;
        this.totalPrice = totalPrice;
    }

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
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

    @Override
    public String toString() {
        return "Order [id=" + id + ", createdAt=" + createdAt + ", totalPrice=" + totalPrice + "]";
    }
    
    

}
