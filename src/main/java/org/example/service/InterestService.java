package org.example.service;

import jakarta.persistence.EntityManager;
import org.example.dao.InterestDao;
import org.example.entity.Interest;
import org.example.entity.User;

import java.util.List;

public class InterestService {
    EntityManager entityManager;
    InterestDao interestDao;
    public InterestService(EntityManager entityManager) {
        this.entityManager = entityManager;
        interestDao = new InterestDao(entityManager);

    }
    public List<Interest> getUserInterests( User user ) {
        return interestDao.findInterestsByUser(user);
    }
}
