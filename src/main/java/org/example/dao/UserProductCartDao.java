package org.example.dao;

import jakarta.persistence.EntityManager;
import org.example.Factory;
import org.example.entity.*;

import java.util.Optional;

public class UserProductCartDao extends Repository<UserProductCart>
{
    public UserProductCartDao(EntityManager entityManager) {
        super(UserProductCart.class, entityManager);
    }


    public Optional<UserProductCart> findUserProduct(int userId,int productId)
    {
        UserProductCart userProductCart = entityManager.find(UserProductCart.class,new UserProductId(userId,productId));

        return Optional.ofNullable(userProductCart);
    }

}
