package gov.iti.fusion.models;

import java.util.Set;

import gov.iti.fusion.models.enums.DiscountType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name="discounts")
public class Discount {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true, nullable = false)
    @Enumerated(EnumType.ORDINAL)
    private DiscountType type;

    @OneToMany(mappedBy = "discount")
    private Set<Game> games;

    public Discount(DiscountType type) {
        this.type = type;
    }
    public Discount( DiscountType type, Set<Game> games) {
        this.type = type;
        this.games = games;
    }
    public Discount() {
    }
    public Long getId() {
        return id;
    }

    public DiscountType getType() {
        return type;
    }

    public Set<Game> getGames() {
        return games;
    }

    public void setType( DiscountType type) {
        this.type = type;
    }

    public void setGames(Set<Game> games) {
        this.games = games;
    }
    public void setId(Long id) {
        this.id = id;
    }

    
}

