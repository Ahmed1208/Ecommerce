package org.example.service;

import jakarta.persistence.EntityManager;
import org.example.dao.UserProductCartDao;
import org.example.entity.User;
import org.example.entity.UserProductCart;

import java.util.List;

public class CartService {
    EntityManager entityManager;
    UserProductCartDao cartDao;
    public CartService(EntityManager entityManager){
        this.entityManager = entityManager;
        cartDao=new UserProductCartDao(entityManager);
    }

    public List<UserProductCart> getUserCartProducts(User user){
        List<UserProductCart> productCartList= cartDao.getCartByUser(user);
        return productCartList;
    }
}
