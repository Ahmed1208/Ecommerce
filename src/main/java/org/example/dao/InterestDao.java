package org.example.dao;

import jakarta.persistence.EntityManager;
import org.example.Factory;
import org.example.entity.Category;
import org.example.entity.Interest;
import org.example.entity.Order;
import org.example.entity.User;

import java.util.ArrayList;
import java.util.List;

public class InterestDao extends Repository<Interest>{
    public InterestDao(EntityManager entityManager) {
        super(Interest.class, entityManager);
    }

    public List<Interest> findOrdersByUser(User user)
    {
        return new ArrayList<Interest>(user.getInterests());
    }

    public Interest findByInterestName(String interestName) {
        return findBy("name",interestName).get(0);
    }

}
