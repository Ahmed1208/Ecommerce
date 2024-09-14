package org.example.dao;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;
import org.example.entity.Admin;
import org.example.entity.GENDER;
import org.example.entity.Order;
import org.example.entity.User;

import java.util.*;

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

        public Map<Integer,List<User>> findAllUsers(int pageNumber,int pageSize)
        {

                // Get the CriteriaBuilder from the EntityManager
                CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();

                // Create a CriteriaQuery object for the User entity
                CriteriaQuery<User> query = criteriaBuilder.createQuery(User.class);

                // Define the root of the query, which represents the User entity
                Root<User> root = query.from(User.class);

                // Define the query selection
                query.select(root);

                // Create TypedQuery from CriteriaQuery
                TypedQuery<User> typedQuery = entityManager.createQuery(query);
                int usersNumber = typedQuery.getResultList().size();

                // Apply pagination parameters to TypedQuery
                int firstResult = (pageNumber - 1) * pageSize;
                typedQuery.setFirstResult(firstResult);
                typedQuery.setMaxResults(pageSize);


                Map<Integer,List<User>> result = new HashMap<>();

                result.put(usersNumber,typedQuery.getResultList());

                // Execute the query and return the results
                return result;
        }



}
