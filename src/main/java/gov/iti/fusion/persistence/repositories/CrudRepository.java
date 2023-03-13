package gov.iti.fusion.persistence.repositories;

import java.util.List;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.persistence.Query;

public abstract class CrudRepository<T, Id> {

    protected EntityManager entityManager;
    
    protected CrudRepository(HttpServletRequest request) {
        this.entityManager = (EntityManager) request.getAttribute("EntityManager");
    }

    public List<T> findAll(Class objClass){
        String jpql = "SELECT o FROM " + objClass.getSimpleName() +" o";
        Query query = entityManager.createQuery(jpql, List.class);
        return (List<T>) query.getResultList();
    }
    
    public T save(T obj){
        EntityTransaction transaction = entityManager.getTransaction();
        transaction.begin();
        entityManager.persist(obj);
        transaction.commit();
        return obj;
    }

    public T delete(T obj){
        EntityTransaction transaction = entityManager.getTransaction();
        obj = entityManager.merge(obj);
        transaction.begin();
        entityManager.remove(obj);
        transaction.commit();
        return obj;
    }

    public T findById(Class objClass, Id id){
        return (T) entityManager.find(objClass, id);
    }
}
