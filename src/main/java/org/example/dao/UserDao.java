package org.example.dao;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import org.example.entity.Admin;
import org.example.entity.GENDER;
import org.example.entity.User;

import java.util.List;
import java.util.Optional;

public class UserDao extends Repository<User> {

        public UserDao(EntityManager entityManager)
        {
            super(User.class, entityManager);
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

        public Optional<User> findUserByEmail(String email){

                List<User> list = findBy("email",email);
                if(list.isEmpty())
                        return Optional.ofNullable( null );
                else
                        return Optional.ofNullable(list.get(0));
        }
        public List<User> findUsersByName(String name){
                return findBy("name",name);
        }
        public List<User> findUsersByGender(GENDER gender){
                return findBy("gender",gender);
        }





}
