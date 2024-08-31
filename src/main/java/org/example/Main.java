package org.example;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import org.example.dao.CategoryDao;
import org.example.dao.UserDao;
import org.example.entity.*;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


public class Main {


    static public void getCategory(Category c,Set<Category> categorySet)
    {
        categorySet.add(c);
        //base cases
        if(c.getChildCategories().size() == 0)
        {
            return;
        }

        //call
        for(Category i : c.getChildCategories())
        {
            getCategory(i,categorySet);
        }

        //return

    }


    public static void main(String[] args) {

//   EntityManagerFactory entityManagerFactory = Factory.entityManagerFactory;
//     EntityManager entityManager = entityManagerFactory.createEntityManager();
//     entityManager.getTransaction().begin();
////        // add new user WITH ADDRESS
//       User u = new User("Men3m", "men3m@yahoo.com", "123", GENDER.FEMALE, 2400.0
//               , new Date(2000, 6, 7), "0102030454");
//
//        Address address = new Address();
//        address.setCity("Berlin");
//        address.setCountry("Germany");
//        address.setStreet("ahmed");
//        address.setUser(u);
//          entityManager.persist(u);
//        entityManager.persist(address);
//
//        //add interests for user
//        Interest interest = new Interest("Writing");
//        Set<User> users = new HashSet<User>();
//        users.add(u);
//        interest.setUsers(users);
//        entityManager.persist(interest);
//        //add balance log for user
//        BalanceLogs balanceLogs = new BalanceLogs();
//        balanceLogs.setUser(u);
//        balanceLogs.setAmount(1000.0);
//        balanceLogs.setPaymentType(PAYMENT.VISA);
//        entityManager.persist(balanceLogs);
//
//        // add admin
//        Admin admin = new Admin("Moamen", "mo2@eti.com", "14785", GENDER.MALE);
//        entityManager.persist(admin);
//
//        //add category
//        Category food = new Category();
//        food.setName("food");
//        food.setDescription("this is food category");
//
//
//        Category pasta = new Category();
//        pasta.setName("pasta");
//        pasta.setParentCategory(food);
//        pasta.setDescription("this is pasta category");
//
//        Category c = new Category();
//        c.setName("tomato sauce");
//        c.setParentCategory(pasta);
//        c.setDescription("this is Sauces Category");
//
//
//        entityManager.persist(food);
//        entityManager.persist(pasta);
//        entityManager.persist(c);
//
//
//        entityManager.getTransaction().commit();

//        Category c1 = entityManager.find(Category.class,2);
//        Category c2 = entityManager.find(Category.class,3);
//
//
//        entityManager.getTransaction().begin();
//
//        Product product1 = new Product("a",10,10.0,c1);
//        Product product2 = new Product("b",20,20.0,c1);
//
//        Product product3 = new Product("c",30,30.0,c2);
//        Product product4 = new Product("d",40,40.0,c2);
//        Product product5 = new Product("e",50,50.0,c2);
//        Product product6 = new Product("f",60,60.0,c2);
//        Product product7 = new Product("g",70,70.0,c2);
//
//        entityManager.persist(product1);
//        entityManager.persist(product2);
//        entityManager.persist(product3);
//        entityManager.persist(product4);
//        entityManager.persist(product5);
//        entityManager.persist(product6);
//        entityManager.persist(product7);
//
//
//        entityManager.getTransaction().commit();


//
//        Category temp = entityManager.find(Category.class,1);
//        Set<Category> list = new HashSet<Category>();
//        getCategory(temp,list);
//
//
//        Set<Product> products = new HashSet<Product>();
//        for(Category c : list)
//        {
//            System.out.println(c.getName());
//            //c.getProducts().forEach(product -> products.add(product));
//            c.getProducts().forEach(x -> System.out.println(x.getProductName()));
//        }
//
//
//        UserDao userDAO = new UserDao();
//        System.out.println(userDAO.findByName("ahmed"));


//        System.out.println(temp.getName());
//
//        for(Category i : temp.getChildCategories())
//        {
//            System.out.println(i.getName());
//        }


//        UserDAO userDAO = new UserDAO();
//        User user= userDAO.findById(User.class,1);
//        System.out.println(user.getName());


//        UserDao userDAO1 = new UserDao();
//        userDAO1.findByName("ahmed");



//        CategoryDao categoryDao=new CategoryDao();
////        Category category=new Category();
////        category.setName("Cold Drinks");
////        category.setDescription("this is for cold drinks");
// //       Category parent=categoryDao.findById(1);
////        category.setParentCategory(parent);
////        categoryDao.insert(category);
//
////        parent.setDescription("this the parent category FOOD");
////        parent.setName("FOOD");
////        categoryDao.update(parent);
//        List<Category> categories=categoryDao.findAll();
//        categories.forEach((c)->System.out.println(c.getName()));
//       System.out.println( categoryDao.delete(4));
//        Category category=categoryDao.findByName("pasta");
//        System.out.println(category.getName()+" : "+category.getId());
       }

}
