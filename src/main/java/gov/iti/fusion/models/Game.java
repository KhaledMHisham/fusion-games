package gov.iti.fusion.models;

import java.time.LocalDate;
import java.util.Collections;
import java.util.List;
import java.util.Set;

import jakarta.persistence.*;
import org.hibernate.annotations.Check;
import org.hibernate.annotations.UuidGenerator;
import org.hibernate.annotations.UuidGenerator.Style;

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

    @OneToMany(mappedBy = "game")
    private Set<LibraryItem> owners;

    @OneToMany(mappedBy = "game")
    private Set<WishItem> wishItems;

    @OneToMany(mappedBy = "game")
    private Set<CartItem> carts;

    @OneToMany(mappedBy = "game")
    private Set<OrderedGame> orders;

    @Column( name = "release_date", nullable = false)
    @Check(constraints = "release_date <= CURRENT_DATE")
    private LocalDate releaseDate;

    @ManyToOne
    @JoinColumn(name = "discount_id")
    private Discount discount;

    @OneToMany(mappedBy = "game")
    private Set<GameGenre> genres;

    @OneToMany(mappedBy = "game")
    private Set<PlatformGame> platforms;
    
    public Game() {}

    public Game(String name, Double price, String developer, String publisher, String pictureUrl, String description, LocalDate releaseDate) {
        this.name = name;
        this.price = price;
        this.developer = developer;
        this.publisher = publisher;
        this.pictureUrl = pictureUrl;
        this.description = description;
        this.releaseDate = releaseDate;
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

    public List<Game> getWishItems() {
        return Collections.unmodifiableList(wishItems.stream().map(WishItem::getGame).toList());
    }

    public List<Game> getOwners() {
        return Collections.unmodifiableList(owners.stream().map(LibraryItem::getGame).toList());
    }

    public List<Game> getCarts() {
        return Collections.unmodifiableList(carts.stream().map(CartItem::getGame).toList());
    }

    public List<Order> getOrders() {
        return Collections.unmodifiableList(orders.stream().map(OrderedGame::getOrder).toList());
    }

    @Override
    public String toString() {
        return "Game [id=" + id + ", name=" + name + ", price=" + price + ", developer=" + developer + ", publisher="
                + publisher + ", pictureUrl=" + pictureUrl + ", description=" + description + ", releaseDate="
                + releaseDate + ", discount=" + discount + ", genres=" + genres + ", platforms=" + platforms + "]";
    }



}