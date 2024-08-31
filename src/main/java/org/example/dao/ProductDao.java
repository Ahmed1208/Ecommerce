package org.example.dao;

import jakarta.persistence.EntityManager;
import org.example.Factory;
import org.example.entity.Product;

import java.util.List;

public class ProductDao extends Repository<Product>
{

    public ProductDao() {
        super(Product.class,Factory.entityManagerFactory.createEntityManager());
    }


    public List<Product> findByName(String name){
        return findBy("productName",name);
    }



}
