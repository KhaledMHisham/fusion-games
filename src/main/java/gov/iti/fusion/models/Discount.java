package gov.iti.fusion.models;

import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Set;

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
    public Discount() {}

    public Discount(String id, DiscountType type, Set<Game> games) {
        this.id = id;
        this.type = type;
        this.games = games;
    }


    public void setId(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public DiscountType getType() {
        return type;
    }

    public List<Game> getGames() {
        return Collections.unmodifiableList(games.stream().toList());
    }
    public void setType( DiscountType type) {
        this.type = type;
    }

    public String getName(){
        return this.type.name();
    }
    @Override
    public String toString() {
        return "Discount [id=" + id + ", type=" + type + "]";
    }
      
}

