package gov.iti.fusion.models;

import java.util.Set;
import java.util.UUID;
import org.hibernate.annotations.UuidGenerator;
import org.hibernate.annotations.UuidGenerator.Style;
import gov.iti.fusion.models.enums.DiscountType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name="discounts")
public class Discount {
    
    @Id
    @UuidGenerator(style = Style.TIME)
    private String id;

    @Column(unique = true, nullable = false)
    @Enumerated(EnumType.ORDINAL)
    private DiscountType type;

    @OneToMany(mappedBy = "discount")
    private Set<Game> games;

    public Discount(DiscountType type) {
        this.type = type;
    }

    public Discount(String id, DiscountType type, Set<Game> games) {
        this.id = id;
        this.type = type;
        this.games = games;
    }

    public Discount() {
    }
    public String getId() {
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
    public void setId(String id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "Discount [id=" + id + ", type=" + type + "]";
    }
      
}

