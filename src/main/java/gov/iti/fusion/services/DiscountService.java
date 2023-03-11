package gov.iti.fusion.services;

import gov.iti.fusion.models.Discount;
import gov.iti.fusion.persistence.repositories.DiscountRepository;

public class DiscountService {
    
    private final DiscountRepository discountRepository = new DiscountRepository();

    public Discount save(Discount discount){
        return discountRepository.save(discount);
    }

    public Discount findById(Long id){
        return discountRepository.find(id);
    }
  
}
