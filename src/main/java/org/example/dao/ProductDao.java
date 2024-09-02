package org.example.dao;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;
import org.example.Factory;
import org.example.entity.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

public class ProductDao extends Repository<Product>
{

    public ProductDao(EntityManager entityManager) {
        super(Product.class,entityManager);
    }


    public List<Product> findProductsByName(String name){
        TypedQuery<Product> query = entityManager
                .createQuery("select p from Product p where p.productName like : name", Product.class)
                .setParameter("name",name);

        return query.getResultList();
    }

    public List<Product> findProductsBySubCategory(int subCategoryId)
    {
        String s = "from Product p where p.category.id = :subCategoryId";
        Query q = entityManager.createQuery(s).setParameter("subCategoryId",subCategoryId);
        return q.getResultList();
    }

    public List<Product> sortProductsByPriceAsc(){
        TypedQuery<Product> query= entityManager.createQuery("select p from Product p ORDER BY p.price ASC ", Product.class);
        return query.getResultList();
    }
    public List<Product> sortProductsByPriceDesc(){
        TypedQuery<Product> query= entityManager.createQuery("select p from Product p ORDER BY p.price DESC ", Product.class);
        return query.getResultList();
    }
    public List<Product> getProductsBelowPrice(Double price){
        TypedQuery<Product> query= entityManager.
                createQuery("select p from Product p where p.price < :price ", Product.class).setParameter("price",price);
        return query.getResultList();
    }
    public List<Product> getProductsAbovePrice(Double price){
        TypedQuery<Product> query= entityManager.
                createQuery("select p from Product p where p.price > :price ", Product.class).setParameter("price",price);
        return query.getResultList();
    }
    public List<Product> getProductsBetweenPriceRange(Double lowestPrice,Double highestPrice){
        TypedQuery<Product> query= entityManager.
                createQuery("select p from Product p where p.price >= :low AND p.price <= :high", Product.class)
                .setParameter("low",lowestPrice).setParameter("high",highestPrice);
        return query.getResultList();
    }

    //filter by subcategorys(for loop) , range of price, sort by price , sort by quantity

    public List<Product> filterProducts(List<Category> subCategories,Double minPrice, Double maxPrice, boolean sortByPrice, boolean sortByQuantity)
    {

        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Product> query = criteriaBuilder.createQuery(Product.class);
        Root<Product> root = query.from(Product.class);


        // Initialize a list of predicates
        List<Predicate> predicates = new ArrayList<>();

        if (subCategories != null && !subCategories.isEmpty()) {
            predicates.add(root.get("category").in(subCategories));
        }

        if(minPrice != null && maxPrice != null)
            predicates.add( criteriaBuilder.and(criteriaBuilder.between(root.get("price"),minPrice,maxPrice) ) );


        // Apply predicates to the query
        if (!predicates.isEmpty()) {
            query.select(root).where(criteriaBuilder.and(predicates.toArray(new Predicate[0])));
        }


        if(sortByQuantity)
            query.orderBy(criteriaBuilder.asc(root.get("quantity") ));
        if(sortByPrice)
            query.orderBy(criteriaBuilder.asc(root.get("price") ));

        return entityManager.createQuery(query).getResultList();
    }




}
