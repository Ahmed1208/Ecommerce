package org.example;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import org.example.entity.*;

import java.util.HashSet;
import java.util.Set;


public class Main {
    public static void main(String[] args) {

        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("ecommerce");
        EntityManager entityManager = entityManagerFactory.createEntityManager();

        entityManager.getTransaction().begin();

        User u= new User();
        u.setName("Moemen");
        u.setBalance(12.0);

        Address address = new Address();
        address.setCity("Cairo");
        address.setCountry("Egypt");
        address.setUser(u);


        entityManager.persist(u);
        entityManager.persist(address);

        entityManager.getTransaction().commit();

        entityManager.detach(u);
        entityManager.detach(address);

        entityManager.find(User.class,2);


    }
}
