package gov.iti.fusion.models;

import java.io.Serializable;
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

    @ManyToOne
    @JoinColumn(name = "discount_id")
    private Discount discount;

    @Column(nullable = false)
    private String developer;
    
    @Column(nullable = false)
    private String publisher;

    @Column(unique = true, nullable = false)
    private String pictureUrl;

    @Column(unique = true, nullable = false)
    private String gameFileUrl;

    @Column(nullable = false)
    private String description;

    @Column(name = "net_price",nullable = false)
    private Double netPrice;

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

    @OneToMany(mappedBy = "game")
    private Set<GameGenre> genres;

    @OneToMany(mappedBy = "game")
    private Set<PlatformGame> platforms;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "minimum_spec_id", nullable = false)
    private GameSpec minimumSpec;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "recommended_spec_id", nullable = false)
    private GameSpec recommendedSpec;

    public Game() {}

    public Game(String name, Double price, String developer, String publisher, String pictureUrl, String description, LocalDate releaseDate) {
        this.name = name;
        this.price = price;
        this.developer = developer;
        this.publisher = publisher;
        this.pictureUrl = pictureUrl;
        this.description = description;
        this.releaseDate = releaseDate;
        this.netPrice = price;
        try {
            releaseDate.getClass().getField("year").setAccessible(true);
        } catch (NoSuchFieldException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SecurityException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
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

    public String getGameFileUrl() {
        return gameFileUrl;
    }

    public void setGameFileUrl(String gameFileUrl) {
        this.gameFileUrl = gameFileUrl;
    }

    public void setPrice(Double price) {
        this.price = price;
        if(discount!=null)
            netPrice = price - (price * discount.getType().getDiscount()/100);
        else
            netPrice = price;
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
        netPrice = price - (price * discount.getType().getDiscount()/100);
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
    public Double getNetPrice() {
        return netPrice;
    }

    public List<User> getWishingUsers() {
        return Collections.unmodifiableList(wishItems.stream().map(WishItem::getUser).toList());
    }
    public List<Genre> getGenres() {
        return Collections.unmodifiableList(genres.stream().map(GameGenre::getGenre).toList());
    }

    public List<User> getOwners() {
        return Collections.unmodifiableList(owners.stream().map(LibraryItem::getUser).toList());
    }

    public List<User> getUsersFromCarts() {
        return Collections.unmodifiableList(carts.stream().map(CartItem::getUser).toList());
    }

    public List<Order> getOrders() {
        return Collections.unmodifiableList(orders.stream().map(OrderedGame::getOrder).toList());
    }
    public List<Platform> getPlatfomrs() {
        return Collections.unmodifiableList(platforms.stream().map(PlatformGame::getPlatform).toList());
    }
    public GameSpec getMinimumSpec() {
        return minimumSpec;
    }

    public void setMinimumSpec(GameSpec minimumSpec) {
        this.minimumSpec = minimumSpec;
    }

    public GameSpec getRecommendedSpec() {
        return recommendedSpec;
    }

    public void setRecommendedSpec(GameSpec recommendedSpec) {
        this.recommendedSpec = recommendedSpec;
    }

    public Set<LibraryItem> getLibraryItems() {
        return owners;
    }

    public Set<WishItem> getWishItems() {
        return wishItems;
    }

    public Set<CartItem> getCartItems() {
        return carts;
    }

    public Set<OrderedGame> getOrderedGames() {
        return orders;
    }

    public Set<PlatformGame> getPlatformGames() {
        return platforms;
    }

    public Set<GameGenre> getGameGenres() {
        return genres;
    }

    @Override
    public String toString() {
        return "Game [id=" + id + ", name=" + name + ", price=" + price + ", developer=" + developer + ", publisher="
                + publisher + ", pictureUrl=" + pictureUrl + ", description=" + description + ", releaseDate="
                + releaseDate + ", discount=" + discount + ", genres=" + genres + ", platforms=" + platforms + "]";
    }
}