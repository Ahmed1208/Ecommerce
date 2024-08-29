package org.example.dao;

import org.example.Factory;
import org.example.entity.User;

public class UserDao extends Repository<User> {

        public UserDao()
        {
            super(User.class, Factory.entityManagerFactory.createEntityManager());
        }



}
