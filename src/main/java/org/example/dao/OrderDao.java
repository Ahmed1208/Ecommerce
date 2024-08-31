package org.example.dao;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;


import org.example.entity.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class OrderDao extends Repository<Order>{

    public OrderDao(EntityManager entityManager) {super(Order.class, entityManager);
    }

    //user Orders
    //products per Order
    public List<Order> findOrdersByUser(int userId)
    {
        String s = "from Order o where o.user.id = :userId";
        Query query = entityManager.createQuery(s).setParameter("userId",userId);
        return query.getResultList();
    }

    public List<Order> findOrdersByStatus(STATUS status)
    {
        String queryString  = "SELECT o FROM Order o WHERE o.status = :status";
        Query query = entityManager.createQuery(queryString).setParameter("status", status);
        return query.getResultList();
    }

    public List<Order> findOrdersByPayment(PAYMENT payment)
    {
        String queryString  = "SELECT o FROM Order o WHERE o.paymentType = :payment";
        Query query = entityManager.createQuery(queryString).setParameter("payment", payment);
        return query.getResultList();
    }

    public List<Order> findOrdersByDateBetween(Date startDate, Date endDate) {
        String queryString = "SELECT o FROM Order o WHERE o.orderDate BETWEEN :startDate AND :endDate";
        Query query = entityManager.createQuery(queryString)
                      .setParameter("startDate", startDate)
                       .setParameter("endDate", endDate);
        return query.getResultList();
    }

    public List<Order> filterOrders(STATUS status,PAYMENT payment,Date startDate, Date endDate) {

        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Order> query = criteriaBuilder.createQuery(Order.class);
        Root<Order> root = query.from(Order.class);


        // Initialize a list of predicates
        List<Predicate> predicates = new ArrayList<>();

        if(status != null)
            predicates.add( criteriaBuilder.equal(root.get("status"),status) );

        if(payment != null)
            predicates.add( criteriaBuilder.and( criteriaBuilder.equal(root.get("paymentType"),payment) ) );

        if(startDate != null && endDate != null)
            predicates.add( criteriaBuilder.and(criteriaBuilder.between(root.get("orderDate"),startDate,endDate) ) );


        Predicate result = null;
        for(Predicate p : predicates) {
            if (result == null) {
                result = p;
            } else {
                result = criteriaBuilder.and(p);
            }
        }
        // Combine all predicates with AND operation
        if(result == null)
            query.select(root);
        else
            query.select(root).where(result);


        return entityManager.createQuery(query).getResultList();
    }

}
