package org.example.dao;

import jakarta.persistence.EntityManager;
import org.example.Factory;
import org.example.entity.Order;
import org.example.entity.UserProductCart;

public class UserProductCartDao extends Repository<UserProductCart>{
    public UserProductCartDao() {
        super(UserProductCart.class, Factory.entityManagerFactory.createEntityManager());
    }
}
