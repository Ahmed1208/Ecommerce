package org.example.dao;

import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import org.example.Factory;

import java.util.List;

public abstract class DAO<T> {

    public T findById(Class<T> t, int id) {

        return Factory.entityManagerFactory.createEntityManager()
                .find(t,id);
    }

}
