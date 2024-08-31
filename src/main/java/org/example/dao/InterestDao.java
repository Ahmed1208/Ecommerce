package org.example.dao;

import jakarta.persistence.EntityManager;
import org.example.Factory;
import org.example.entity.Interest;

public class InterestDao extends Repository<Interest>{
    public InterestDao() {
        super(Interest.class, Factory.entityManagerFactory.createEntityManager());
    }



    //interests for user


}
