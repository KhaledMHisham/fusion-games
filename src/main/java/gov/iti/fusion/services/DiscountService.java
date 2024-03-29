package gov.iti.fusion.services;

import java.util.List;
import java.util.UUID;

import gov.iti.fusion.models.Discount;
import gov.iti.fusion.persistence.repositories.DiscountRepository;
import jakarta.servlet.http.HttpServletRequest;

public class DiscountService {
    
    private final DiscountRepository discountRepository;

    public DiscountService(HttpServletRequest request) {
        this.discountRepository = new DiscountRepository(request);
    }

    public Discount save(Discount discount){
        return discountRepository.save(discount);
    }

    public Discount findById(String id){
        return discountRepository.findById(Discount.class, id);
    }

    public List<Discount> findAll(){
        return discountRepository.findAll(Discount.class);
    }
}
