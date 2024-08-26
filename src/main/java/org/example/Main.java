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

        BalanceLogs balanceLogs = new BalanceLogs();
        balanceLogs.setUser(u);
        balanceLogs.setAmount(122.0);

        entityManager.persist(u);             //insert
        entityManager.persist(balanceLogs);  // insert

        entityManager.getTransaction().commit();


        entityManager.detach(balanceLogs);
        entityManager.detach(u);

        entityManager.find(BalanceLogs.class,1);     //select


//        Interest i1= new Interest();
//        i1.setName("travel");
//        Interest i2= new Interest();
//        i2.setName("swim");
//        Set<Interest> interests= new HashSet<Interest>();
//        interests.add(i1);
//        interests.add(i2);
//        u.setInterests(interests);




    }
}
