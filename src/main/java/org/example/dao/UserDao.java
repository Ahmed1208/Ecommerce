package org.example.dao;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import org.example.entity.GENDER;
import org.example.entity.User;

import java.util.List;

public class UserDao extends Repository<User> {

        public UserDao(EntityManager entityManager)
        {
            super(User.class, entityManager);
        }

        public User userLogin(String email,String password){
                User user = findUserByEmail(email);
                if(user != null && user.getPassword().equals(password)){
                        return user;
                }else {
                        return null;
                }

        }

        public List<User> findUsersPerCity(String city){
                TypedQuery<User> query = entityManager
                        .createQuery("select u from User u join Address a on a.city = :city ", User.class)
                        .setParameter("city", city);

                return query.getResultList();
        }
        public List<User> findUsersPerCountry(String country){
                TypedQuery<User> query = entityManager
                        .createQuery("select u from User u join Address a on a.country = :country ", User.class)
                        .setParameter("country", country);

                return query.getResultList();
        }

        public User findUserByEmail(String email){
                return findBy("email",email).get(0);
        }
        public List<User> findUsersByName(String name){
                return findBy("name",name);
        }
        public List<User> findUsersByGender(GENDER gender){
                return findBy("gender",gender);
        }





}
