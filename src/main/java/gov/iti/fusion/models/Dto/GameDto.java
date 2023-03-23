package gov.iti.fusion.models.Dto;

import java.util.Set;

import gov.iti.fusion.models.Discount;


public class GameDto {
   
    private String id;

    private String name;

    private Double price; 

    private Integer discount;

    private String pictureUrl;

    private String description;

    private Double netPrice;

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

    public Integer getDiscount() {
        return discount;
    }

    public void setDiscount(Integer discount) {
        this.discount = discount;
    }

    public String getPictureUrl() {
        return pictureUrl;
    }

    public void setPictureUrl(String pictureUrl) {
        this.pictureUrl = pictureUrl;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Double getNetPrice() {
        return netPrice;
    }

    public void setNetPrice(Double netPrice) {
        this.netPrice = netPrice;
    }

    
    public GameDto() {
    }

    public GameDto(String id, String name, Double price, Integer discount, String pictureUrl, String description,
            Double netPrice) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.discount = discount;
        this.pictureUrl = pictureUrl;
        this.description = description;
        this.netPrice = netPrice;
    }



    
}
