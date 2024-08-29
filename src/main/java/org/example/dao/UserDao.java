package org.example.dao;

import org.example.entity.User;

public class UserDao extends DAO<User> {


        public UserDao()
        {
            super(User.class);
        }

        public User findByName(String name)
        {
            return null;
        }

}
