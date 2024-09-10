package org.example.dao;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import org.example.Factory;
import org.example.entity.Order;
import org.example.entity.User;
import org.example.entity.UserProductCart;

import java.util.List;

public class UserProductCartDao extends Repository<UserProductCart>{
    public UserProductCartDao(EntityManager em) {
        super(UserProductCart.class, em);
    }
    public List<UserProductCart> getCartByUser(User user){
        TypedQuery<UserProductCart> query= entityManager.
                createQuery("select u from UserProductCart u where u.user=:user", UserProductCart.class)
                .setParameter("user",user);
        return query.getResultList();

    }
}
