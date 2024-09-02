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

        @Override
        public boolean delete(int id) {
                entityManager.createQuery("delete from Address a where a.id=:id").setParameter("id",id).executeUpdate();
                return super.delete(id);
        }

        public List<User> findUsersPerCity(String city){
                TypedQuery<User> query = entityManager
                        .createQuery("select u from User u where u.address.city = :city ", User.class)
                        .setParameter("city", city);

                return query.getResultList();
        }
        public List<User> findUsersPerCountry(String country){
                TypedQuery<User> query = entityManager
                        .createQuery("select u from User u where u.address.country = :country ", User.class)
                        .setParameter("country", country);

                return query.getResultList();
        }

        public User findUserByEmail(String email){
                List<User> users=findBy("email",email);

                return users.isEmpty()?null:users.get(0);
        }
        public List<User> findUsersByName(String name){
                return findBy("name",name);
        }
        public List<User> findUsersByGender(GENDER gender){
                return findBy("gender",gender);
        }





}
