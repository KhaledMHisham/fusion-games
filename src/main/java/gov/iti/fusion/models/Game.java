package gov.iti.fusion.models;

import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

import org.hibernate.annotations.Check;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="games")
public class Game {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true, nullable = false)
    private String name;

    @Column(nullable = false)
    private Double price; 

    @Column(nullable = false)
    private String description;

    @ManyToOne
    @JoinColumn(name = "discount_id")
    private Discount discount;


    @ManyToMany
    private Set<Genre> genres = new HashSet<>();


    @Column( name = "release_date", nullable = false)
    @Check(constraints = "release_date <= CURRENT_DATE")
    private LocalDate releaseDate;

    @Column(nullable = false)
    private String developer;
    
    @Column(nullable = false)
    private String publisher;

    @Column(unique = true, nullable = false)
    private String pictureUrl;


    @ManyToMany
    private Set<Platform> platforms;
    
    public Game() {
    }

    public Game(String name, Double price, String description, Discount discount, Set<Genre> genres, LocalDate releaseDate,
            String developer, String publisher, String pictureUrl, Set<Platform> platforms) {
        this.name = name;
        this.price = price;
        this.description = description;
        this.discount = discount;
        this.genres= genres;
        this.releaseDate = releaseDate;
        this.developer = developer;
        this.publisher = publisher;
        this.pictureUrl = pictureUrl;
        this.platforms = platforms;
    }


    public Long getId() {
        return id;
    }


    public void setId(Long id) {
        this.id = id;
    }


    public String getName() {
        return name;
    }


    public void setName(String name) {
        this.name = name;
    }


    public Double getPrice() {
        return price;
    }


    public void setPrice(Double price) {
        this.price = price;
    }


    public String getDescription() {
        return description;
    }


    public void setDescription(String description) {
        this.description = description;
    }


    public Discount getDiscount() {
        return discount;
    }


    public void setDiscount(Discount discount) {
        this.discount = discount;
    }


    public Set<Genre> getGenre() {
        return genres;
    }


    public void setGenre(Set<Genre> genres) {
        this.genres = genres;
    }


    public LocalDate getReleaseDate() {
        return releaseDate;
    }


    public void setReleaseDate(LocalDate releaseDate) {
        this.releaseDate = releaseDate;
    }


    public String getDeveloper() {
        return developer;
    }


    public void setDeveloper(String developer) {
        this.developer = developer;
    }


    public String getPublisher() {
        return publisher;
    }


    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }


    public String getPictureUrl() {
        return pictureUrl;
    }


    public void setPictureUrl(String pictureUrl) {
        this.pictureUrl = pictureUrl;
    }


    public Set<Platform> getPlatforms() {
        return platforms;
    }


    public void setPlatforms(Set<Platform> platforms) {
        this.platforms = platforms;
    }



}
