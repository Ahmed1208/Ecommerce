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
import java.util.List;

public class CartService {

    private UserProductCartDao cartDao;
    private EntityManager entityManager;

    public CartService(EntityManager entityManager)
    {
        this.entityManager = entityManager;
        this.cartDao = new UserProductCartDao(entityManager);
    }


    public void addProductToCart(int userId,int productId)
    {

        Optional<User> user = new UserDao(entityManager).findById(userId);
        Optional<Product> product = new ProductDao(entityManager).findById(productId);

        if(user.isPresent() && product.isPresent())
        {
//            if(product.get().getQuantity() < 1)
//                throw new RuntimeException("No Enough quantity for the product");

            //no need to decrease product qunatity here, beacuse no action taken to make an order yet

            //check if there is old history before
            Optional<UserProductCart> oldUserProductCart = cartDao.findUserProduct(userId,productId);
            if(oldUserProductCart.isPresent())
            {
                //update
                oldUserProductCart.get().setProductQuantity(oldUserProductCart.get().getProductQuantity()+1);
                cartDao.update(oldUserProductCart.get());
            }
            else
            {
                //create new object
                UserProductCart userProductCart = new UserProductCart(user.get(),product.get(),1);

                //create in persistance context
                cartDao.create(userProductCart);
            }

            try {

                entityManager.getTransaction().begin();
                entityManager.getTransaction().commit();

            }catch (RuntimeException e)
            {
                throw new RuntimeException("Transaction has failed");
            }
        }
        else {
            throw new RuntimeException("Error, Add product or user not valid");
        }
    }

    public List<UserProductCart> getUserCartProducts(User user){
        List<UserProductCart> productCartList= cartDao.getCartByUser(user);
        return productCartList;
    }

    public boolean deleteProductFromCart(int userId,int productId){
        entityManager.getTransaction().begin();
        boolean result= cartDao.deleteProductFromCart(userId,productId);
        entityManager.getTransaction().commit();
        return result;
    }
    public void updateProductQuantity(int userId,int productId,int quantity){
        try {
            entityManager.getTransaction().begin();
            cartDao.updateProductQuantity(userId,productId,quantity);
            entityManager.getTransaction().commit();
        }catch (Exception e){
            throw new RuntimeException(e.getMessage());
        }
    }
    public int cartProductsCount(int userId)
    {
        return cartDao.countProductsByUser(userId);
    }
}
