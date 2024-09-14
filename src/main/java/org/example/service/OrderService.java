package org.example.service;

import jakarta.persistence.EntityManager;
import org.example.dao.OrderDao;
import org.example.dao.ProductDao;
import org.example.dao.UserDao;
import org.example.dao.UserProductCartDao;
import org.example.entity.*;

import java.time.LocalDate;
import java.util.*;

public class OrderService {
    EntityManager entityManager;
    OrderDao orderDao;
    ProductDao productDao;
    UserDao userDao;
    UserProductCartDao userProductCartDao;

    public OrderService(EntityManager em) {
        entityManager = em;
        orderDao = new OrderDao(entityManager);
        productDao = new ProductDao(entityManager);
        userProductCartDao = new UserProductCartDao(entityManager);
        userDao= new UserDao(entityManager);
    }


    public List<Order> getOrdersByUserId(int userId){
        return orderDao.findOrdersByUser(userId);
    }


    public void placeOrder(User user, List<UserProductCart> cart,String paymentType,double bill,double payedFromBalance){
        if (cart == null || cart.isEmpty()){
            throw new RuntimeException("cart is empty");
        }
        double totalBill = payedFromBalance + bill;
        PAYMENT payment;
        if (bill==0){
            payment=PAYMENT.VISA;
        }else{
            payment=paymentType.equals("cash")?PAYMENT.CASH:PAYMENT.VISA;
        }
        StringBuilder result = new StringBuilder();

        // compare quantity for each product in the cart with the quantity in the inventory
        String s=validateAvailabilityOfProductsQuantity(cart);
        result.append(s);
        if (result.length()>0){
            throw new RuntimeException(result.toString());
        }else{
            try {
                entityManager.getTransaction().begin();
                Order order=new Order(totalBill,LocalDate.now(),STATUS.PENDING,payment,user);
                orderDao.create(order);
                for(UserProductCart cartItem:cart){
                    Product product=productDao.findById(cartItem.getProduct().getId()).get();
                    product.setQuantity(product.getQuantity()-cartItem.getProductQuantity());
                    productDao.update(product);
                    OrderProductList orderProduct=new OrderProductList(cartItem.getProductQuantity(), product.getPrice(),product,order );
                    entityManager.persist(orderProduct);
                }
                double newBalance = Math.round((user.getBalance() - payedFromBalance) * 100.0) / 100.0;
                user.setBalance(newBalance);
                userDao.update(user);
                userProductCartDao.deleteAllProductsFromCartByUserId(user.getId());
                entityManager.getTransaction().commit();
            }catch (Exception e){
                entityManager.getTransaction().rollback();
                throw new RuntimeException(e.getMessage());
            }

        }
    }



    private String validateAvailabilityOfProductsQuantity(List<UserProductCart> cart){
        StringBuilder result = new StringBuilder();
        for (UserProductCart cartItem : cart) {
            Optional<Product> p=productDao.findById(cartItem.getProduct().getId());
            if(p.isPresent()){
                Product product=p.get();
                if (product.getQuantity()==0){
                    result.append("product : ").append(cartItem.getProduct().getProductName()).append(" is out of stock\n");
                }else if (product.getQuantity()<cartItem.getProductQuantity()){
                    result.append("you want ")
                            .append(cartItem.getProductQuantity())
                            .append(" from product ")
                            .append(product.getProductName())
                            .append(" and there only ")
                            .append(product.getQuantity()).append("\n");
                }
            }else {
                result.append("product : ").append(cartItem.getProduct().getProductName()).append(" is not exist\n");
            }
        }
        return result.toString();
    }


    public Optional<Order> getOrderById(int id){
        return Optional.of(orderDao.findById(id).get());
    }
    public Optional<Order> cancelOrder(int orderId){
        entityManager.getTransaction().begin();
        Order order=orderDao.findById(orderId).get();
        order.setStatus(STATUS.CANCELED);
        orderDao.update(order);
        entityManager.getTransaction().commit();
        return Optional.of(order);
    }
}
