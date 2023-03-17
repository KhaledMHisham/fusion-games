package gov.iti.fusion;

import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

import gov.iti.fusion.models.*;
import gov.iti.fusion.models.enums.DiscountType;
import gov.iti.fusion.models.enums.GenreType;
import gov.iti.fusion.models.enums.PlatformType;
import gov.iti.fusion.persistence.connection.JpaManagerSingleton;
import gov.iti.fusion.services.*;
import jakarta.ejb.Local;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;

public class Main {
    public static void main(String[] args) {
        // GameService gameService = new GameService(request);
        // DiscountService discountService = new DiscountService(request);
        // PlatformService platformService = new PlatformService(request);
        // GenreService genreService = new GenreService(request);


        // //List<Game> mainGames = new ArrayList<>();
        // Set<Game> mainGames =  new HashSet<>();
        // Set<Platform> platforms =  new HashSet<>();
        // Set<Genre> genres =  new HashSet<>();

        // Discount classic = new Discount(DiscountType.CLASSIC);
        // Discount free = new Discount(DiscountType.FREE);
        // Discount premium = new Discount(DiscountType.PREMIUM);

        // Platform linux =  new Platform(PlatformType.LINUX);
        // Platform windows =  new Platform(PlatformType.WINDOWS);
        // Platform xbox =  new Platform(PlatformType.XBOX);
        // platforms.add(linux);
        // platforms.add(windows);
        // platforms.add(xbox);

        // Genre action = new Genre(GenreType.ACTION);
        // Genre adventure = new Genre(GenreType.ADVENTURE);
        // Genre fighting = new Genre(GenreType.FIGHTING);
        // Genre horror = new Genre(GenreType.HORROR);
        // Genre mmo = new Genre(GenreType.MMO);
        // Genre puzzle = new Genre(GenreType.PUZZLE);


        // genres.add(action);
        // Game game1 = new Game("Assassin'ss Creed Valhalla Standard Edition",10.0,"war game using wolfs",classic
        // ,genres,LocalDate.now(),"rahma","rahma","images/hellblade.jpg",platforms);
        // genres.add(fighting);
        // Game game2 = new Game("Assassin'sss Creed Valhalla Standard Edition",10.0,"war game using wolfs",free
        // ,genres,LocalDate.now(),"rahma","rahma","images/12.webp",platforms);
        // genres.add(adventure);
        // Game game3 = new Game("Assassin'ssss Creed Valhallrea Standard Edition",10.0,"war game using wolfs",classic
        // ,genres,LocalDate.now(),"rahma","rahma","images/1.webp",platforms);
        // genres.add(horror);
        // genres.remove(fighting);
        // genres.remove(adventure);
        // Game game4 = new Game("Assassinn's Creed Valhalla Standard Edition",10.0,"war game using wolfs",premium
        // ,genres,LocalDate.now(),"rahma","rahma","images/1.jpg",platforms);
        // genres.add(puzzle);
        // Game game5 = new Game("Assasswin'ss Creed Valhalla Standard Edition",10.0,"war game using wolfs",premium
        // ,genres,LocalDate.now(),"rahma","rahma","images/heldlblade.jpg",platforms);
        // Game game6 = new Game("Assassin'sss Creedd Valhalla Standard Edition",10.0,"war game using wolfs",free
        // ,genres,LocalDate.now(),"rahma","rahma","images/1232.webp",platforms);
        // Game game7 = new Game("Assassin'ssss Creed Valhalla Standard Edition",10.0,"war game using wolfs",free
        // ,genres,LocalDate.now(),"rahma","rahma","images/1.fwebp",platforms);
        // genres.remove(puzzle);
        // genres.add(mmo);
        // Game game8= new Game("Assassinn's Creed Vaalhalla Standard Edition",10.0,"war game using wolfs",free
        // ,genres,LocalDate.now(),"rahma","rahma","images/1.jsepg",platforms);

        // mainGames.add(game1);
        // mainGames.add(game2);
        // mainGames.add(game3);
        // mainGames.add(game4);
        // mainGames.add(game5);
        // mainGames.add(game6);
        // mainGames.add(game7);
        // mainGames.add(game8);

        

        // discountService.save(classic);
        // discountService.save(free);
        // discountService.save(premium);
        // platformService.save(linux);
        // platformService.save(windows);
        // platformService.save(xbox);
        // genreService.save(action);
        // genreService.save(puzzle);
        // genreService.save(mmo);
        // genreService.save(horror);
        // genreService.save(fighting);
        // genreService.save(adventure);

        
        // linux.setGames(mainGames);
        // action.setGames(mainGames);

        // gameService.save(game1);
        // gameService.save(game2);
        // gameService.save(game3);
        // gameService.save(game4);
        // gameService.save(game5);
        // gameService.save(game6);
        // gameService.save(game7);
        // gameService.save(game8);

        User user = new User();
        user.setUsername("khaledhisham");
        user.setFirstName("khaled");
        user.setLastName("hisham");
        user.setPassword("password");
        user.setCountry("Egypt");
        user.setSalt("SALT");
        user.setPassword("PASSWORD");
        user.setPhoneNumber("01278158298");
        user.setGender("Male");
        user.setEmail("Khaled@gmail.com");
        user.setAdmin(true);
        user.setBirthDate(LocalDate.now());

        EntityManager em = JpaManagerSingleton.INSTANCE.getEntityManagerFactory().createEntityManager();
        em.getTransaction().begin();
        em.persist(user);
        em.getTransaction().commit();

         Game game1 = new Game("Assassin'ss Creed Valhalla Standard Edition",10.0,"war game using wolfs"
         ,"rahma","images/hellblade.jpg","rahma",LocalDate.now());
         Game game2 = new Game("Assassin'sss Creed Valhalla Standard Edition",10.0,"war game using wolfs"
         ,"rahma","images/12.webp","rahma",LocalDate.now());
         Game game3 = new Game("Assassin'ssss Creed Valhallrea Standard Edition",10.0,"war game using wolfs"
         ,"rahma","images/1.webp","rahma",LocalDate.now());


        em.getTransaction().begin();
        em.persist(game1);
        em.persist(game2);
        em.persist(game3);
        em.getTransaction().commit();

        LibraryItem libraryItem1 = new LibraryItem(user, game1);
        LibraryItem libraryItem2 = new LibraryItem(user, game2);
        LibraryItem libraryItem3 = new LibraryItem(user, game3);

        em.getTransaction().begin();
        em.persist(libraryItem1);
        em.persist(libraryItem2);
        em.persist(libraryItem3);
        em.getTransaction().commit();

        em.refresh(user);

        System.out.println(user.getOwnedGames());

    }
}
