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

import java.util.*;

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

    public Map<Integer,List<Product>> filterProducts(List<Category> subCategories, Double minPrice, Double maxPrice, boolean sortByPrice, boolean sortByQuantity, int pageNumber, int pageSize,String searchText)
    {

        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Product> query = criteriaBuilder.createQuery(Product.class);
        Root<Product> root = query.from(Product.class);


        // Initialize a list of predicates
        List<Predicate> predicates = new ArrayList<>();

        if(searchText != null && !searchText.isEmpty())
            predicates.add(criteriaBuilder.and(criteriaBuilder.like(root.get("productName"), "%" + searchText + "%")));


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


        // Create TypedQuery from CriteriaQuery
        TypedQuery<Product> typedQuery = entityManager.createQuery(query);
        int cartSize = typedQuery.getResultList().size();

        // Apply pagination parameters to TypedQuery
        int firstResult = (pageNumber - 1) * pageSize;
        typedQuery.setFirstResult(firstResult);
        typedQuery.setMaxResults(pageSize);


        Map<Integer,List<Product>> result = new HashMap<>();

        result.put(cartSize,typedQuery.getResultList());

        // Execute the query and return the results
        return result;
    }


    public List<Product> getProducts(int pageNumber, int pageSize) {
        // Calculate the starting position of the records
        int firstResult = (pageNumber - 1) * pageSize;

        // Create a query
        String jpql = "SELECT p FROM Product p";
        Query query = entityManager.createQuery(jpql);

        // Set pagination parameters
        query.setFirstResult(firstResult);
        query.setMaxResults(pageSize);

        // Execute the query and get the results
        return query.getResultList();
    }

    public Integer getProductCount() {
        String s = "SELECT COUNT(p) FROM Product p";
        Query q = entityManager.createQuery(s);
        Long countResult = (Long) q.getSingleResult(); // Cast to Long
        return countResult != null ? countResult.intValue() : null; // Convert Long to Integer
    }



}
