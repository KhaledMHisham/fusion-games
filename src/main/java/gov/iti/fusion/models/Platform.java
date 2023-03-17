package gov.iti.fusion.models;

import java.util.Collections;
import java.util.List;
import java.util.Set;
import jakarta.persistence.*;
import org.hibernate.annotations.UuidGenerator;
import org.hibernate.annotations.UuidGenerator.Style;
import gov.iti.fusion.models.enums.PlatformType;

@Entity
@Table(name="platforms")
public class Platform {
    @Id
    @UuidGenerator(style = Style.TIME)
    private String id;
    
    @Enumerated(EnumType.STRING)
    @Column(unique = true, nullable = false)
    private PlatformType type;

    @OneToMany(mappedBy = "platform")
    private Set<PlatformGame> platformGames;

    public Platform(PlatformType type, Set<PlatformGame> platformGames) {
        this.type = type;
        this.platformGames = platformGames;
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

    public Platform() {}

    public List<Game> getPlatformGames(){
        return Collections.unmodifiableList( platformGames.stream().map(PlatformGame::getGame).toList());
    }
}
