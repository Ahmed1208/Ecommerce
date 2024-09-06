package org.example;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.criteria.CriteriaBuilder;
import org.example.dao.*;
import org.example.entity.*;
import org.example.service.UserService;
import java.time.LocalDate;

import java.util.*;


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


    public static void printGroupByOrder(EntityManager entityManager)
    {
        OrderDao orderDao = new OrderDao(entityManager);
        Map<Object,List<Integer>> list1 = orderDao.getOrdersByGroupBy(GROUPBY.GROUPBYDATE);


        for (Map.Entry<Object, List<Integer>> entry : list1.entrySet()) {
            Object payment =  entry.getKey();
            List<Integer> orderIds = entry.getValue();
            System.out.println("Payment: " + payment + ", Order ID: " +orderIds);
        }
    }


    public static void main(String[] args) {

    EntityManagerFactory entityManagerFactory = Factory.entityManagerFactory;
    EntityManager entityManager = entityManagerFactory.createEntityManager();
//    entityManager.getTransaction().begin();
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
//        entityManager.getTransaction().commit();

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
        //add category
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
//        Category rice = new Category();
//        rice.setName("rice");
//        rice.setParentCategory(food);
//        rice.setDescription("this is rice category");
//
//        Category kofta = new Category();
//        kofta.setName("kofta");
//        kofta.setParentCategory(food);
//        kofta.setDescription("this is kofta category");
//
//        entityManager.persist(food);
//        entityManager.persist(pasta);
//        entityManager.persist(rice);
//        entityManager.persist(kofta);
//
////
////
//        entityManager.getTransaction().commit();




//        Category c1 = entityManager.find(Category.class,2);
//        Category c2 = entityManager.find(Category.class,3);
//
//
//        entityManager.getTransaction().begin();
//
//        Product product1 = new Product("pasta1",50,10.0,pasta);
//        Product product2 = new Product("pasta2",60,20.0,pasta);
//
//        Product product3 = new Product("rice1",20,30.0,rice);
//        Product product4 = new Product("rice2",10,40.0,rice);
//        //Product product5 = new Product("e",90,50.0,rice);
//        Product product6 = new Product("kofta1",5,60.0,kofta);
//        Product product7 = new Product("kofta2",1,70.0,kofta);
//
//        entityManager.persist(product1);
//        entityManager.persist(product2);
//        entityManager.persist(product3);
//        entityManager.persist(product4);
//        //entityManager.persist(product5);
//        entityManager.persist(product6);
//        entityManager.persist(product7);
////
////
//       entityManager.getTransaction().commit();


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


//
//        CategoryDao categoryDao = new CategoryDao(entityManager);
//        Category category = categoryDao.findById(2);  //food
//
//        categoryDao.getParentCategories().forEach(System.out::println);  //food
//        categoryDao.getSubCategoriesByCategory(category).forEach(System.out::println);  //pasta -> tomato sauce
//
//
//        EntityManager entityManager2 = entityManagerFactory.createEntityManager();
//        ProductDao productDao = new ProductDao(entityManager2);
//
//        productDao.findProductsBySubCategory(category).forEach(x ->System.out.println(x.getProductName()));

//        CategoryDao categoryDao = new CategoryDao(entityManager);
//        Category category = categoryDao.findById(2);  //food
//
//        categoryDao.getParentCategories().forEach(System.out::println);  //food
//        categoryDao.getSubCategoriesByCategory(category).forEach(System.out::println);  //pasta -> tomato sauce
//
//
//        EntityManager entityManager2 = entityManagerFactory.createEntityManager();
//        ProductDao productDao = new ProductDao(entityManager2);
//
//        productDao.findProductsBySubCategory(category).forEach(x ->System.out.println(x.getProductName()));


//         User user= entityManager.find(User.class,1);
//       Order a=new Order();
//       a.setStatus(STATUS.CANCELED);
//       a.setTotalPrice(600.0);
//        a.setOrderDate(new Date(2022, 5, 5));
//        a.setPaymentType(PAYMENT.CASH);
//        a.setUser(user);
//        Order b= new Order();
//        b.setStatus(STATUS.PENDING);
//        b.setTotalPrice(1900.0);
//        b.setOrderDate(new Date(2023, 5, 5));
//        b.setPaymentType(PAYMENT.VISA);
//        b.setUser(user);
//        entityManager.persist(a);
//        entityManager.persist(b);
//        entityManager.getTransaction().begin();
//        entityManager.getTransaction().commit();

//        OrderDao orderDao= new OrderDao(entityManager);
//        List<Order> orders=orderDao.findByOrderDateBetween(new Date(2020, 1, 1),new Date(2021, 12, 30));
//        orders.forEach(x ->System.out.println(x.getId()));





//        UserDao userDao=new UserDao(entityManager);
//        userDao.findUsersPerCity("Berlin").forEach((X)->System.out.println(X.getName()));
//        userDao.findUsersPerCountry("Germany").forEach((X)->System.out.println(X.getName()));
//        userDao.findUsersByGender(GENDER.FEMALE).forEach((X)->System.out.println(X.getName()));
//        userDao.findUserByEmail("men3m@yahoo.com").getInterests().forEach(System.out::println);

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


//        ProductDao productDao1=new ProductDao(entityManager);
//
//        List<Product> list=productDao1.findProductsBySubCategory(2);
//
//        list.forEach(x -> x.getProductName());


//        OrderDao orderDao = new OrderDao(entityManager);
//
//        List<Order> products = orderDao.filterOrders(null,null,new Date(2023, 5, 5),new Date(2023, 5, 5));
//
//        products.forEach(x -> System.out.println(x.getId()));


//        User user = entityManager.find(User.class,2);
//
//        for(int i=1;i<5;i++)
//        {
//            Product product = entityManager.find(Product.class,i);
//            UserProductCart userProductCart = new UserProductCart(user,product,5);
//            entityManager.persist(userProductCart);
//        }


//        OrderDao orderDao = new OrderDao(entityManager);
//
//        List<Order> list = orderDao.filterOrders(STATUS.PENDING,
//                                                PAYMENT.CASH,
//                                                null,null,
//                                                null,null,
//                                                true);
//
//        for(Order o : list)
//        {
//            System.out.println(o);
//        }
//
//
//        List<Object[]> list1 = orderDao.getOrdersByGroupBy(GROUPBY.PAYMENT);
//
//        for(Object[] o: list1)
//        {
//            System.out.println(o[0] + "  " + o[1]);
//        }

//        Category a= entityManager.find(Category.class,10);
//        Category b= entityManager.find(Category.class,12);
//        List<Category> categories = new ArrayList<>();
//        categories.add(a);
//        categories.add(b);

//        List<Order> list = orderDao.filterOrders(STATUS.PENDING,
//                                                PAYMENT.CASH,
//                                                null,null,
//                                                null,null,
//                                                true);
//
//        for(Order o : list)
//        {
//            System.out.println(o);
//        }

//        User user = entityManager.find(User.class,4);
//        Order order1 = new Order();
//        order1.setUser(user);
//        order1.setOrderDate(new Date(2024,4,3));
//        order1.setStatus(STATUS.PENDING);
//        order1.setPaymentType(PAYMENT.VISA);
//        order1.setTotalPrice(5566.0);
//
//        entityManager.persist(order1);
//        entityManager.getTransaction().begin();
//        entityManager.getTransaction().commit();


        User user1 = new User("ahmed","ahmed@yahoo.com", "123456",GENDER.MALE, 0.0, LocalDate.parse("2023-09-05"), "012345");
//
        entityManager.getTransaction().begin();
//
        UserDao userDao = new UserDao(entityManager);
        userDao.create(user1);
//
////
////        userDao.findById(1).ifPresent(user -> System.out.println(user));
//
    //            entityManager.getTransaction().begin();
            entityManager.getTransaction().commit();

//        BalanceLogs balanceLogs = new BalanceLogs(25.2,PAYMENT.CASH,user1);
//        BalanceLogs balanceLogs2 = new BalanceLogs(25.2,PAYMENT.CASH,user1);
//        entityManager.persist(balanceLogs);
//        entityManager.persist(balanceLogs2);
//        entityManager.getTransaction().commit();

        LocalDate dateFromString = LocalDate.parse("2025-09-15");
        System.out.println(dateFromString);
        User user = entityManager.find(User.class,1);
        user.setDateOfBirth(dateFromString);

        entityManager.merge(user);
        entityManager.getTransaction().begin();
        entityManager.getTransaction().commit();





//        UserService userService = new UserService(entityManager);
//
//
//        try {
//            userService.loginCheck("ahmed@yahoo.com","123456");
//        }catch (RuntimeException e)
//        {
//            e.printStackTrace();
//        }


    }

}


