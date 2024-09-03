package org.example.service;

import jakarta.persistence.EntityManager;
import org.example.dao.UserDao;
import org.example.entity.User;

import java.util.Optional;

public class UserService {

    private UserDao userDao;

    public UserService(EntityManager entityManager)
    {
        this.userDao = new UserDao(entityManager);
    }

    public User loginCheck(String email,String password) throws RuntimeException
    {
        Optional<User> result = userDao.findUserByEmail(email);

        if(result.isPresent())
        {
            if(password.equals(result.get().getPassword()))
                return result.get();
        }

        throw new RuntimeException("Wrong email or password, user not found");
    }
}
