package org.example.dao;

import org.example.Factory;
import org.example.entity.Product;
import org.example.entity.User;

import java.util.List;

public class UserDao extends Repository<User> {

        public UserDao()
        {
            super(User.class, Factory.entityManagerFactory.createEntityManager());
        }

//        public User login(String email,String password){
//
//        }

        public User findByName(String email){
                return findBy("email",email).get(0);
        }


}
