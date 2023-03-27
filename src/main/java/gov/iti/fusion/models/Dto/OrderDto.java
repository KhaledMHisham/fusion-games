package gov.iti.fusion.models.Dto;

import java.time.LocalDate;
import java.util.List;
import java.util.Set;

import com.mysql.cj.x.protobuf.MysqlxCrud.Order;

import gov.iti.fusion.models.Discount;


public class OrderDto {
    
    private String id;

    private LocalDate createdAt;
    
    private Double totalPrice;

    private String orderingUserName;
    private List<String> orderingGamesName;

    public OrderDto() {}
    

    public OrderDto(String id, LocalDate createdAt, Double totalPrice, String orderingUserName,
            List<String> orderingGamesName) {
        this.id = id;
        this.createdAt = createdAt;
        this.totalPrice = totalPrice;
        this.orderingUserName = orderingUserName;
        this.orderingGamesName = orderingGamesName;
    }


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public LocalDate getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDate createdAt) {
        this.createdAt = createdAt;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getOrderingUserName() {
        return orderingUserName;
    }

    public void setOrderingUserName(String orderingUserName) {
        this.orderingUserName = orderingUserName;
    }

    public List<String> getOrderingGamesName() {
        return orderingGamesName;
    }

    public void setOrderingGamesName(List<String> orderingGamesName) {
        this.orderingGamesName = orderingGamesName;
    }
    

    
}
