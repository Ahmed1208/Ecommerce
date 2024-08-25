package org.example;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import org.example.entity.Admin;
import org.example.entity.Category;
import org.example.entity.GENDER;


public class Main {
    public static void main(String[] args) {
//        Category category = new Category();
//        category.setName("Fashion");
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("ecommerce");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
          Admin a= new Admin();
          a.setName("salem");
          a.setGender(GENDER.MALE);

        Admin b= new Admin();
        b.setName("sohaila");
        b.setGender(GENDER.FEMALE);



        entityManager.getTransaction().begin();
        //entityManager.persist(a);
        entityManager.persist(b);
        a.setId(1000);
       // entityManager.merge(a);
        entityManager.getTransaction().commit();


    }
}
