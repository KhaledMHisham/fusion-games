package gov.iti.fusion.models;

import java.util.Set;
import java.util.UUID;
import org.hibernate.annotations.UuidGenerator;
import org.hibernate.annotations.UuidGenerator.Style;
import gov.iti.fusion.models.enums.PlatformType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;

@Entity
@Table(name="platforms")
public class Platform {
    @Id
    @UuidGenerator(style = Style.TIME)
    private String id;
    
    @Enumerated(EnumType.STRING)
    @Column(unique = true, nullable = false)
    private PlatformType type;

    @ManyToMany(mappedBy = "platforms")
    private Set<Game> games;

    public Platform(PlatformType type, Set<Game> games) {
        this.type = type;
        this.games = games;
    }

    public Platform(PlatformType type) {
        this.type = type;
    }

    public String getId() {
        return id;
    }


    public void setId(String id) {
        this.id = id;
    }


    public PlatformType getType() {
        return type;
    }


    public void setType(PlatformType type) {
        this.type = type;
    }


    public Set<Game> getGames() {
        return games;
    }


    public void setGames(Set<Game> games) {
        this.games = games;
    }

}
