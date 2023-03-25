package gov.iti.fusion;

import java.time.LocalDate;
import java.time.Month;
import java.util.Calendar;
import java.util.GregorianCalendar;
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
import jakarta.servlet.http.HttpServlet;

public class Main extends HttpServlet {
        public static void main(String[] args) {
                // Main main = new Main();

                // String // GameService gameService = new GameService(request);
                // DiscountService discountService = new DiscountService(request);
                // PlatformService platformService = new PlatformService(request);
                // GenreService genreService = new GenreService(request);

                // Game game = new Game("Sekiro", 100.0, "FromSoftware", "Activision", "images/sekiro.jpg",
                //                 "The game follows a shinobi known as Wolf, who attempts to take revenge on a samurai clan that imprisoned him and kidnapped his lord.",
                //                 80.0,LocalDate.of(23, Month.SEPTEMBER, 23));
                // Game game1 = new Game("Game of Thrones", 100.0, "FromSoftware", "Activision",
                //                 "images/GameofThrones.jpg",
                //                 "The game follows a shinobi known as Wolf, who attempts to take revenge on a samurai clan that imprisoned him and kidnapped his lord.",
                //                 80.0, LocalDate.of(23, Month.SEPTEMBER, 23));
                // Game game2 = new Game("Diablo", 100.0, "FromSoftware", "Activision", "images/Diablo.jpg",
                //                 "The game follows a shinobi known as Wolf, who attempts to take revenge on a samurai clan that imprisoned him and kidnapped his lord.",
                //                 80.0, LocalDate.of(23, Month.SEPTEMBER, 23));
                // Game game3 = new Game("Dark Souls", 100.0, "FromSoftware", "Activision", "images/DarkSouls.jpg",
                //                 "The game follows a shinobi known as Wolf, who attempts to take revenge on a samurai clan that imprisoned him and kidnapped his lord.",
                //                 80.0, LocalDate.of(23, Month.SEPTEMBER, 23));
                // Game game4 = new Game("bloodborne", 100.0, "FromSoftware", "Activision", "images/bloodborne.jpg",
                //                 "The game follows a shinobi known as Wolf, who attempts to take revenge on a samurai clan that imprisoned him and kidnapped his lord.",
                //                 80.0, LocalDate.of(23, Month.SEPTEMBER, 23));
                // Game game5 = new Game("Shadow Fight", 100.0, "FromSoftware", "Activision", "images/ShadowFight.jpg",
                //                 "The game follows a shinobi known as Wolf, who attempts to take revenge on a samurai clan that imprisoned him and kidnapped his lord.",
                //                 80.0, LocalDate.of(23, Month.SEPTEMBER, 23));
                // Game game6 = new Game("Injustice 1", 100.0, "FromSoftware", "Activision", "images/Injustice1.jpg",
                //                 "The game follows a shinobi known as Wolf, who attempts to take revenge on a samurai clan that imprisoned him and kidnapped his lord.",
                //                 80.0, LocalDate.of(23, Month.SEPTEMBER, 23));
                // Game game7 = new Game("Injustice 2", 100.0, "FromSoftware", "Activision", "images/Injustice2.jpg",
                //                 "The game follows a shinobi known as Wolf, who attempts to take revenge on a samurai clan that imprisoned him and kidnapped his lord.",
                //                 80.0, LocalDate.of(23, Month.SEPTEMBER, 23));
                // Game game8 = new Game("Soulcalibur", 100.0, "FromSoftware", "Activision", "images/Soulcalibur.jpg",
                //                 "The game follows a shinobi known as Wolf, who attempts to take revenge on a samurai clan that imprisoned him and kidnapped his lord.",
                //                 80.0, LocalDate.of(23, Month.SEPTEMBER, 23));

                // //List<Game> mainGames = new ArrayList<>();
                // Set<Game> mainGames = new HashSet<>();
                // Set<Platform> platforms = new HashSet<>();
                // Set<Genre> genres = new HashSet<>();

                Set<Game> mainGames = new HashSet<>();
                Set<Platform> platforms = new HashSet<>();
                Set<Genre> genres = new HashSet<>();

                // Discount classic = new Discount(DiscountType.CLASSIC);
                // Discount free = new Discount(DiscountType.FREE);
                // Discount premium = new Discount(DiscountType.PREMIUM);

                // Platform linux = new Platform(PlatformType.LINUX);
                // Platform windows = new Platform(PlatformType.WINDOWS);
                // Platform xbox = new Platform(PlatformType.XBOX);
                // platforms.add(linux);
                // platforms.add(windows);
                // platforms.add(xbox);

                // Genre action = new Genre(GenreType.ACTION);
                // Genre adventure = new Genre(GenreType.ADVENTURE);
                // Genre fighting = new Genre(GenreType.FIGHTING);
                // Genre horror = new Genre(GenreType.HORROR);
                // Genre mmo = new Genre(GenreType.MMO);
                // Genre puzzle = new Genre(GenreType.PUZZLE);
                // Genre shooter = new Genre(GenreType.SHOOTER);

                // discountService.save(classic);
                // discountService.save(free);
                // discountService.save(premium);

                // genres.add(action);
                // Game game = new Game("horse", 100.0,"FromSoftware"
                // ,"Activision", "images/image1.jpg","The game follows a shinobi known as Wolf,
                // who attempts to take revenge on a samurai clan that imprisoned him and
                // kidnapped his lord.", 80.0, LocalDate.now());
                // Game game1 = new Game("Game of Throne", 100.0, "FromSoftware"
                // ,"Activision","images/game.jpg", "The game follows a shinobi known as Wolf,
                // who attempts to take revenge on a samurai clan that imprisoned him and
                // kidnapped his lord.", 80.0, LocalDate.now());
                //

                // genres.remove(adventure);
                // genres.add(war);
                // genres.add(fighting);
                // gameService.addGenresToGame(game1,genres);
                // gameService.addPlatformsToGame(game1, platforms);
                // game1.setDiscount(free);
                // gameService.addGenresToGame(game3,genres);
                // gameService.addPlatformsToGame(game3, platforms);

                // platformService.save(linux);
                // platformService.save(windows);
                // platformService.save(xbox);
                // genreService.save(action);
                // genreService.save(puzzle);
                // genreService.save(shooter);
                // genreService.save(horror);
                // genreService.save(fighting);
                // genreService.save(adventure);

                // mainGames.add(game1);
                // mainGames.add(game2);
                // mainGames.add(game3);
                // mainGames.add(game4);
                // mainGames.add(game5);

                ////////////////////////////////////////////////
                // mainGames.add(game6);
                // mainGames.add(game7);
                // mainGames.add(game8);

                // gameService.save(game1);
                // gameService.save(game2);
                // gameService.save(game3);
                // gameService.save(game4);
                // gameService.save(game5);
                // gameService.save(game6);
                // gameService.save(game7);
                // gameService.save(game8);

                // User user = new User();
                // user.setUsername("SaraJaledRahma");
                // user.setFirstName("sara");
                // user.setLastName("Jaled");
                // user.setPassword("password");
                // user.setCountry("Egypt");
                // user.setSalt("SALT");
                // user.setPassword("PASSWORD");
                // user.setPhoneNumber("0101177546");
                // user.setGender("female");
                // user.setEmail("Sara@hotmail1.com");
                // user.setAdmin(true);
                // user.setBirthDate(LocalDate.now());

                // userService.save(user);

                // Order order = new Order();
                // order.setCreatedAt(LocalDate.now());
                // order.setTotalPrice(20000.0);
                // order.setOrderingUser(user);
                // CartItem cartItem = new CartItem(user, game);

                // orderService.addGameToOrder(order, game1);
                // orderService.addGameToOrder(order, game2);
                // orderService.addGameToOrder(order, game3);

                // userService.addGameToCart(user, game1);
                // userService.addGameToCart(user, game2);
                // userService.addGameToCart(user, game3);

                // List<Game> allGames = new ArrayList<>();
                // List<Game> gamesWithoutDiscount = new ArrayList<>();
                // List<Game> new5Games = new ArrayList<>();
                // List<Game> free2Games = new ArrayList<>();
                // List<Game> gamesOnSale = new ArrayList<>();

                // allGames = gameService.findAllGames();
                // gamesWithoutDiscount = gameService.findGamesWithNoDiscount();
                // if(gamesWithoutDiscount.size()>15)
                // gamesWithoutDiscount = getRandomElements(gamesWithoutDiscount);

                // new5Games = gameService.findTopNewer(4);
                // free2Games = gameService.findFreeGames(2);
                // gamesOnSale = gameService.findGamesOnSale();

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


//      ->                  game1.setMinimumSpec(main.getStaticSpec());
//      ->                  game1.setRecommendedSpec(main.getStaticSpec());
//      ->                  game1.setGameFileUrl("qweqweqewqewqew");


//      ->                game2.setMinimumSpec(main.getStaticSpec());
//      ->                game2.setRecommendedSpec(main.getStaticSpec());
//      ->                game2.setGameFileUrl("qweqweqewqewqe");

//      ->                game3.setMinimumSpec(main.getStaticSpec());
//      ->                game3.setRecommendedSpec(main.getStaticSpec());
//      ->                game3.setGameFileUrl("qweqweqewqewqw");

//      ->                game4.setMinimumSpec(main.getStaticSpec());
//      ->                game4.setRecommendedSpec(main.getStaticSpec());
//      ->                game4.setGameFileUrl("qweqweqewqewew");

//      ->                game5.setMinimumSpec(main.getStaticSpec());
//      ->                game5.setRecommendedSpec(main.getStaticSpec());
//      ->                game5.setGameFileUrl("qweqweqewqeqew");

//      ->                game6.setMinimumSpec(main.getStaticSpec());
//      ->                game6.setRecommendedSpec(main.getStaticSpec());
//      ->                game6.setGameFileUrl("qweqweqewqwqew");

//      ->                game7.setMinimumSpec(main.getStaticSpec());
//      ->                game7.setRecommendedSpec(main.getStaticSpec());
//      ->                game7.setGameFileUrl("qweqweqewewqew");

//      ->                game8.setMinimumSpec(main.getStaticSpec());
//      ->                game8.setRecommendedSpec(main.getStaticSpec());
//      ->                game8.setGameFileUrl("qweqweqeqewqew");

                EntityManager em = JpaManagerSingleton.INSTANCE.getEntityManagerFactory().createEntityManager();
//      ->                  em.getTransaction().begin();
//      ->                  em.persist(game1);
//      ->                  em.persist(game2);
//      ->                  em.persist(game3);
//      ->                  em.persist(game4);
//      ->                  em.persist(game5);
//      ->                  em.persist(game6);
//      ->                  em.persist(game7);
//      ->                  em.persist(game8);

                // em.persist(user);
                // em.persist(cartItem);

                //
                // em.persist(game1);
                // em.persist(game2);
                // em.persist(game3);
                // // em.getTransaction().commit();
                //
                // LibraryItem libraryItem1 = new LibraryItem(user, game1);
                // LibraryItem libraryItem2 = new LibraryItem(user, game2);
                // LibraryItem libraryItem3 = new LibraryItem(user, game3);
                // OrderedGame orderedGame = new OrderedGame(game,order);

                // em.getTransaction().begin();
                // em.persist(libraryItem1);
                // em.persist(libraryItem2);
                // em.persist(libraryItem3);
                // em.persist(order);
                // em.persist(orderedGame);
                
//      ->           // em.getTransaction().commit();

                // em.refresh(user);

                // System.out.println(user.getOwnedGames());

        }

        // private GameSpec getStaticSpec() {
        //         GameSpec recommendedSpec = new GameSpec();
        //         recommendedSpec.setProcessor("QWEQWQEWWQE");
        //         recommendedSpec.setGraphicsCard("QEWQWQEWQWADASDDASZXc");
        //         recommendedSpec.setMemory(16);
        //         recommendedSpec.setStorage(64);
        //         recommendedSpec.setDirectXVersion(12);
        //         return recommendedSpec;
        // }
}
