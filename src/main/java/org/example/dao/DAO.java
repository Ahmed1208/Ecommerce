package org.example.dao;

import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;
import org.example.Factory;
import org.example.entity.Product;

import java.util.List;

public abstract class DAO<T> {

    public T findById(Class<T> t, int id) {

        return Factory.entityManager.find(t,id);
    }


    public T findId(int id) {

        CriteriaBuilder criteriaBuilder = Factory.entityManager.getCriteriaBuilder();

        CriteriaQuery<Product> criteriaQuery = criteriaBuilder.createQuery(Product.class);

        Root<Product> productRoot = criteriaQuery.from(Product.class);

    }

}
