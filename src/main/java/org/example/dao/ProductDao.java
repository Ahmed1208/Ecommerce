package org.example.dao;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import org.example.Factory;
import org.example.entity.Category;
import org.example.entity.Product;

import java.util.ArrayList;
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


    
    public List<Product> findProductsBySubCategory(Category subCategory)
    {
        return new ArrayList<Product>(subCategory.getProducts());
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




}
