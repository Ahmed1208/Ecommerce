package org.example.dao;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
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


    public List<Product> findByName(String name){
        return findBy("productName",name);
    }


    public List<Product> findProductsBySubCategory(Category subCategory)
    {
        return new ArrayList<Product>(subCategory.getProducts());
    }



}
