package gov.iti.fusion.models;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;
import org.hibernate.annotations.UuidGenerator;

@Entity
public class GameSpec {

    @Id
    @UuidGenerator(style = UuidGenerator.Style.TIME)
    private String id;
    private String processor;
    private String graphicsCard;
    private Integer directXVersion;
    private Integer storage;
    private Integer memory;

    public GameSpec() {}
    public String getProcessor() {
        return processor;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setProcessor(String processor) {
        this.processor = processor;
    }

    public String getGraphicsCard() {
        return graphicsCard;
    }

    public void setGraphicsCard(String graphicsCard) {
        this.graphicsCard = graphicsCard;
    }

    public Integer getDirectXVersion() {
        return directXVersion;
    }

    public void setDirectXVersion(Integer directXVersion) {
        this.directXVersion = directXVersion;
    }

    public Integer getStorage() {
        return storage;
    }

    public void setStorage(Integer storage) {
        this.storage = storage;
    }

    public Integer getMemory() {
        return memory;
    }

    public void setMemory(Integer memory) {
        this.memory = memory;
    }
}
