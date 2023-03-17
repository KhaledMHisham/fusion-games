package gov.iti.fusion.models;

import java.time.LocalDate;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import org.hibernate.annotations.UuidGenerator;
import org.hibernate.annotations.UuidGenerator.Style;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "users")
public class User {

    @Id
    @UuidGenerator(style = Style.TIME)
    private String id;
    
    @Column(unique = true, nullable = false)
    private String username;

    @Column(name = "first_name", nullable = false)
    private String firstName;

    @Column(name = "last_name", nullable = false)
    private String lastName;

    @Column(unique = true, nullable = false)
    private String email;

    @Column(nullable = false)
    private String password;

    @Column(nullable = false)
    private String country;

    @Column(nullable = false)
    private String salt;

    @Column(name = "phonenumber", unique = true, nullable = false)
    private String phoneNumber;

    @Column(name = "birth_date", nullable = false)
    private LocalDate birthDate;

    @Column(nullable = false)
    private String gender;

    @Column(nullable = false)
    private Boolean isAdmin;

    @OneToMany(mappedBy = "orderingUser")
    private Set<Order> orders;

    @OneToMany(mappedBy = "user")
    private Set<LibraryItem> library;

    @OneToMany(mappedBy = "user")
    private Set<WishItem> wishItems;

    @OneToMany(mappedBy = "user")
    private Set<CartItem> cartItems;

    
    public User() {}
    

    public User(String username, String firstName, String lastName, String email, String password, String salt, String phoneNumber,
            LocalDate birthDate, String gender,String country, Boolean isAdmin) {
        this.username = username;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.salt = salt;
        this.phoneNumber = phoneNumber;
        this.birthDate = birthDate;
        this.gender = gender;
        this.country = country;
        this.isAdmin = isAdmin;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public LocalDate getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(LocalDate birthDate) {
        this.birthDate = birthDate;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Boolean isAdmin() {
        return isAdmin;
    }

    public void setAdmin(Boolean isAdmin) {
        this.isAdmin = isAdmin;
    }
    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public List<Order> getOrders() {
        return Collections.unmodifiableList(orders.stream().toList());
    }

    public List<Game> getWishList() {
        return Collections.unmodifiableList(wishItems.stream().map(WishItem::getGame).toList());
    }

    public List<Game> getCartItems(){
        return Collections.unmodifiableList(cartItems.stream().map(CartItem::getGame).toList());
    }

    public List<Game> getOwnedGames(){
            return Collections.unmodifiableList(library.stream().map(LibraryItem::getGame).toList());
    }


    @Override
    public boolean equals(Object o) {
      if (this == o) return true;
      if (o == null || getClass() != o.getClass()) return false;
  
      User user = (User) o;
  
      if (id != null ? !id.equals(user.id) : user.id != null) return false;
      if (username != null ? !username.equals(user.username) : user.username != null) return false;
      if (email != null ? !email.equals(user.email) : user.email != null) return false;
      if (phoneNumber != null ? !phoneNumber.equals(user.phoneNumber) : user.phoneNumber != null) return false;

      return true;
    }

    @Override
    public int hashCode() {
        int result = 0;
        result = 31 * result + (id != null ? id.hashCode() : 0);
        result = 31 * result + (username != null ? username.hashCode() : 0);
        result = 31 * result + (email != null ? email.hashCode() : 0);
        result = 31 * result + (phoneNumber != null ? phoneNumber.hashCode() : 0);

        return result;
    }

    @Override
    public String toString() {
        return "User [id=" + id + ", username=" + username + ", firstName=" + firstName + ", lastName=" + lastName
                + ", email=" + email + ", password=" + password + ", salt=" + salt + ", phoneNumber=" + phoneNumber
                + ", birthDate=" + birthDate + ", gender=" + gender + ", isAdmin=" + isAdmin + "]";
    }
}
