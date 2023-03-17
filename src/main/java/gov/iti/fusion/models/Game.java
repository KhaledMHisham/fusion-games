package gov.iti.fusion.models;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Set;
import java.util.UUID;
import org.hibernate.annotations.Check;
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
@Table(name="games")
public class Game {
    @Id
    @UuidGenerator(style = Style.TIME)
    private String id;

    @Column(unique = true, nullable = false)
    private String name;

    @Column(nullable = false)
    private Double price; 

    @Column(nullable = false)
    private String developer;
    
    @Column(nullable = false)
    private String publisher;

    @Column(unique = true, nullable = false)
    private String pictureUrl;

    @Column(nullable = false)
    private String description;

    @ManyToMany(mappedBy = "library")
    private Set<User> owners;

    @ManyToMany(mappedBy = "wishes")
    private Set<User> wishes;

    @ManyToMany(mappedBy = "cart")
    private Set<User> carts;

    @ManyToMany(mappedBy = "games")
    private Set<Order> orders;

    @Column( name = "release_date", nullable = false)
    @Check(constraints = "release_date <= CURRENT_DATE")
    private LocalDate releaseDate;

    @ManyToOne
    @JoinColumn(name = "discount_id")
    private Discount discount;

    @ManyToMany
    private Set<Genre> genres;

    @ManyToMany
    @JoinTable(name = "platforms_games",
                joinColumns = @JoinColumn(name = "game_id"),
                inverseJoinColumns = @JoinColumn(name = "platform_id"))
    private Set<Platform> platforms;
    
    public Game() {}

    
    public Game(String id, String name, Double price, String developer, String publisher, String pictureUrl,
            String description, Set<User> owners, Set<User> wishes, Set<User> carts, Set<Order> orders,
            LocalDate releaseDate, Discount discount, Set<Genre> genres, Set<Platform> platforms) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.developer = developer;
        this.publisher = publisher;
        this.pictureUrl = pictureUrl;
        this.description = description;
        this.owners = owners;
        this.wishes = wishes;
        this.carts = carts;
        this.orders = orders;
        this.releaseDate = releaseDate;
        this.discount = discount;
        this.genres = genres;
        this.platforms = platforms;
    }


    public Game(String name, Double price, LocalDate releaseDate, String pictureUrl, String description, String developer, String publisher,
        Discount discount) {
        this.name = name;
        this.price = price;
        this.releaseDate = releaseDate;
        this.pictureUrl = pictureUrl;
        this.description = description;
        this.developer = developer;
        this.publisher = publisher;
        this.discount = discount;
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


    public String getId() {
        return id;
    }


    public void setId(String id) {
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

    
    public Set<User> getOwners() {
        return owners;
    }

    public void setOwners(Set<User> owners) {
        this.owners = owners;
    }

    public Set<User> getWishes() {
        return wishes;
    }

    public void setWishes(Set<User> wishes) {
        this.wishes = wishes;
    }

    public Set<User> getCarts() {
        return carts;
    }

    public void setCarts(Set<User> carts) {
        this.carts = carts;
    }

    public Set<Order> getOrders() {
        return orders;
    }

    public void setOrders(Set<Order> orders) {
        this.orders = orders;
    }

    public Set<Genre> getGenres() {
        return genres;
    }

    public void setGenres(Set<Genre> genres) {
        this.genres = genres;
    }

    @Override
    public String toString() {
        return "Game [id=" + id + ", name=" + name + ", price=" + price + ", developer=" + developer + ", publisher="
                + publisher + ", pictureUrl=" + pictureUrl + ", description=" + description + ", releaseDate="
                + releaseDate + ", discount=" + discount + ", genres=" + genres + ", platforms=" + platforms + "]";
    }



}