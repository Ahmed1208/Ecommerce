package org.example.dao;

import jakarta.persistence.EntityManager;
import org.example.Factory;
import org.example.entity.Product;
import org.example.entity.User;

import java.util.List;

public class UserDao extends Repository<User> {

        public UserDao(EntityManager entityManager)
        {
            super(User.class, entityManager);
        }

//        public User login(String email,String password){
//
//        }

        public User findByName(String email){
                return findBy("email",email).get(0);
        }

        public void createUser(User u){

        }

}
