package org.example.dao;

import jakarta.persistence.EntityManager;
import org.example.Factory;
import org.example.entity.Order;
import org.example.entity.OrderProductList;

public class OrderProductListDao extends Repository<OrderProductList>{
    public OrderProductListDao() {
        super(OrderProductList.class, Factory.entityManagerFactory.createEntityManager());
    }
}
