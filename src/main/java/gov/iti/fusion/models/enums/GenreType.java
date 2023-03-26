package gov.iti.fusion.models.enums;

public enum GenreType {

    ACTION("Action"),
    ADVENTURE("Adventure"),
    RPG("Role-playing"),
    STRATEGY("Strategy"),
    SPORTS("Sports"),
    SIMULATION("Simulation"),
    PUZZLE("Puzzle"),
    HORROR("Horror"),
    FIGHTING("Fighting"),
    RACING("Racing"),
    SHOOTER("Shooter"),
    MMO("MMO"),
    STEALTH("Stealth"),
    SURVIVAL("Survival");

    private final String genre;

    GenreType(String genre){
        this.genre = genre;
    }

    public String getGenre() {
        return genre;
    }

}
