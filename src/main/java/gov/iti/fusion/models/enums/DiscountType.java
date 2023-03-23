package gov.iti.fusion.models.enums;
public enum DiscountType {


    CLASSIC(15),
    PREMIUM(50),
    ULTIMATE(85),
    FREE(100);

    private final Integer discount;

    DiscountType(Integer discount){
        this.discount = discount;
    }

    public Integer getDiscount() {
        return discount;
    }

}
//game.