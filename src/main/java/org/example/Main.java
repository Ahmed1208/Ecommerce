package org.example;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import org.example.dao.UserDAO;
import org.example.entity.*;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;


public class Main {
    public static void main(String[] args) {

        EntityManagerFactory entityManagerFactory = Factory.entityManagerFactory;
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        // add new user WITH ADDRESS
        User u = new User("Men3m", "men3m@yahoo.com", "123", GENDER.FEMALE, 2400.0
                , new Date(2000, 6, 7), "0102030454");

        Address address = new Address();
        address.setCity("Berlin");
        address.setCountry("Germany");
        address.setStreet("ahmed");
        address.setUser(u);
        entityManager.persist(u);
        entityManager.persist(address);

        //add interests for user
        Interest interest = new Interest("Writing");
        Set<User> users = new HashSet<User>();
        users.add(u);
        interest.setUsers(users);
        entityManager.persist(interest);
        //add balance log for user
        BalanceLogs balanceLogs = new BalanceLogs();
        balanceLogs.setUser(u);
        balanceLogs.setAmount(1000.0);
        balanceLogs.setPaymentType(PAYMENT.VISA);
        entityManager.persist(balanceLogs);

        // add admin
        Admin admin = new Admin("Moamen", "mo2@eti.com", "14785", GENDER.MALE);
        entityManager.persist(admin);

        //add category
        Category food = new Category();
        food.setName("food");
        food.setDescription("this is food category");


        Category pasta = new Category();
        pasta.setName("pasta");
        pasta.setParentCategory(food);
        pasta.setDescription("this is pasta category");

        Category c = new Category();
        c.setName("tomato sauce");
        c.setParentCategory(pasta);
        c.setDescription("this is Sauces Category");


        entityManager.persist(food);
        entityManager.persist(pasta);
        entityManager.persist(c);


        entityManager.getTransaction().commit();


//        Category temp = entityManager.find(Category.class,1);
//        System.out.println(temp.getName());
//        temp.getChildCategories().forEach(System.out::println);

        UserDAO userDAO = new UserDAO();
        User user= userDAO.findById(User.class,1);
        System.out.println(user.getName());

       }

}
