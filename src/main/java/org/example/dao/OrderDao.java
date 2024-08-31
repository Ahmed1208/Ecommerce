package org.example.dao;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import org.example.Factory;

import org.example.entity.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class OrderDao extends Repository<Order>{

    public OrderDao(EntityManager entityManager) {super(Order.class, entityManager);
    }

    public List<Order> findOrdersByUser(User user)
    {
        return new ArrayList<Order>(user.getOrders());
    }

    public List<Order> findByStatus(STATUS status)
    {
        String queryString  = "SELECT o FROM Order o WHERE o.status = :status";
        TypedQuery<Order> query = entityManager.createQuery(queryString , Order.class)
                .setParameter("status", status);
        return query.getResultList();
    }

    public List<Order> findByPayment(PAYMENT payment)
    {
        String queryString  = "SELECT o FROM Order o WHERE o.paymentType = :payment";
        TypedQuery<Order> query = entityManager.createQuery(queryString , Order.class)
                .setParameter("payment", payment);
        return query.getResultList();
    }

    public List<Order> findByOrderDateBetween(Date startDate, Date endDate) {
        String queryString = "SELECT o FROM Order o WHERE o.orderDate BETWEEN :startDate AND :endDate";
        TypedQuery<Order> query = entityManager.createQuery(queryString, Order.class)
        .setParameter("startDate", startDate)
        .setParameter("endDate", endDate);
        return query.getResultList();
    }

}
