package org.example.dao;

import jakarta.persistence.EntityManager;
import org.example.Factory;
import org.example.entity.Category;
import org.example.entity.Interest;
import org.example.entity.Order;
import org.example.entity.User;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class InterestDao extends Repository<Interest>{

    public InterestDao(EntityManager entityManager) {
        super(Interest.class, entityManager);
    }


    //interests for user
    public List<Interest> findInterestsByUser(User user)
    {
        return new ArrayList<Interest>(user.getInterests());
    }

    public Optional<Interest> findInterestByName(String interestName) {

        List<Interest> list = findBy("name",interestName);
        if(list.isEmpty())
            return Optional.ofNullable( null );
        else
            return Optional.ofNullable(list.get(0));
    }

}
