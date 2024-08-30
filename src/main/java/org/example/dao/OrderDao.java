package org.example.dao;

import org.example.Factory;

import org.example.entity.Order;

public class OrderDao extends Repository<Order>{

    public OrderDao() {super(Order.class, Factory.entityManagerFactory.createEntityManager());
    }



}
