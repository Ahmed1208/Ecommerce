package org.example.service;

import jakarta.persistence.EntityManager;
import org.example.dao.ProductDao;
import org.example.dao.UserDao;
import org.example.dao.UserProductCartDao;
import org.example.entity.Product;
import org.example.entity.User;
import org.example.entity.UserProductCart;
import org.example.entity.UserProductId;

import java.util.Optional;

public class CartService {

    private UserProductCartDao userProductCartDao;
    private EntityManager em;

    public CartService(EntityManager entityManager)
    {
        em = entityManager;
        this.userProductCartDao = new UserProductCartDao(entityManager);
    }


    public void addProductToCart(int userId,int productId)
    {

        Optional<User> user = new UserDao(em).findById(userId);
        Optional<Product> product = new ProductDao(em).findById(productId);

        if(user.isPresent() && product.isPresent())
        {
            if(product.get().getQuantity() < 1)
                throw new RuntimeException("No Enough quantity for the product");

            //no need to decrease product qunatity here, beacuse no action taken to make an order yet

            //check if there is old history before
            Optional<UserProductCart> oldUserProductCart = userProductCartDao.findUserProduct(userId,productId);
            if(oldUserProductCart.isPresent())
            {
                //update
                oldUserProductCart.get().setProductQuantity(oldUserProductCart.get().getProductQuantity()+1);
                userProductCartDao.update(oldUserProductCart.get());
            }
            else
            {
                //create new object
                UserProductCart userProductCart = new UserProductCart(user.get(),product.get(),1);

                //create in persistance context
                userProductCartDao.create(userProductCart);
            }


            try {

                em.getTransaction().begin();
                em.getTransaction().commit();

            }catch (RuntimeException e)
            {
                throw new RuntimeException("Transaction has failed");
            }
        }
        else {
            throw new RuntimeException("Error, Add product or user not valid");
        }
    }


}
