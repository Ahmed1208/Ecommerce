package org.example.dao;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import org.example.Factory;
import org.example.entity.Address;
import org.example.entity.GENDER;
import org.example.entity.User;
import org.hibernate.exception.ConstraintViolationException;
import org.junit.jupiter.api.*;

import java.util.Date;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)

class UserDaoTest {

    static EntityManagerFactory emf;
    static EntityManager em;
    static UserDao userDao;

    @BeforeAll
    static void start() {
        emf= Factory.entityManagerFactory;

    }

    @AfterAll
    static void close() {
        emf.close();
    }
    @BeforeEach
    void setUp() {
        em=emf.createEntityManager();
        userDao=new UserDao(em);
    }
    @AfterEach
    void end() {
        em.close();
    }


    @Test
    @Order(1)
    void createUser() {
        User u=new User("mohamed","Mohamed@gmail.com",
                "12345",GENDER.MALE,500.0,
                new Date(2000,6,7),"01012312312");
       Address address=new Address("abu bakr st","Berlin","Germany",u);
       u.setAddress(address);
        em.getTransaction().begin();
        userDao.create(u);
        em.persist(address);
        em.getTransaction().commit();
        User u2= em.find(User.class, u.getId());
        assertNotNull(u2.getId());

        User u3=new User("mohamed","Mo@gmail.com",
                "12345",GENDER.MALE,500.0,
                new Date(2000,6,7),"01012312312");

        assertThrows(Exception.class,()->{
            em.getTransaction().begin();
            userDao.create(u3);
            em.getTransaction().commit();
        });

        assertThrows(RuntimeException.class,()->{
            em.getTransaction().begin();
            userDao.create(null);
            em.getTransaction().commit();
        });
    }



    @Test
    void userLogin() {
        assertNull(userDao.userLogin("Mo@gmail.com","123"));
        assertNull(userDao.userLogin("Moha@gmail.com","123"));
        assertNotNull(userDao.userLogin("men3m@yahoo.com","123"));
    }
    @Test
    void deleteUser() {
        em.getTransaction().begin();
        User user=userDao.findUserByEmail("Mohamed@gmail.com");
        assertTrue(userDao.delete(user.getId()));
        em.getTransaction().commit();
        em.getTransaction().begin();
        assertFalse(userDao.delete(20));
        em.getTransaction().commit();
    }

    @Test
    void updateUser(){
        User user=userDao.findUsersByName("Men3m").get(0);
        user.setPhone("01014789456");
        em.getTransaction().begin();
        userDao.update(user);
        em.getTransaction().commit();

        assertEquals("01014789456",userDao.findById(1).getPhone());
    }

    @Test
    void getAllUsers(){
        List<User> users=userDao.findAll();
        assertEquals(1,users.size());
        assertEquals(1,users.get(0).getId());
    }

    @Test
    @Order(2)
    void findUsersPerCity() {
        List<User> user=userDao.findUsersPerCity("Maadi");
        assertFalse(user.isEmpty());
        assertEquals(1,user.size());
        List<User> user2=userDao.findUsersPerCity("Alex");
        assertTrue(user2.isEmpty());
    }

    @Test
    void findUsersPerCountry() {
        List<User> user=userDao.findUsersPerCountry("Egypt");
        assertTrue(!user.isEmpty());
        user.forEach(System.out::println);
        assertEquals(1,user.size());
        List<User> user2=userDao.findUsersPerCountry("France");
        assertTrue(user2.isEmpty());

    }

    @Test
    @Order(3)
    void findUserByEmail() {
        User u=userDao.findUserByEmail("men3m@yahoo.com");
        assertNotNull(u);
        assertEquals(1,u.getId());
    }

    @Test
    @Order(4)
    void findUsersByName() {
        List<User> user=userDao.findUsersByName("Men3m");
        assertEquals(1,user.size());
        assertEquals(1,user.get(0).getId());
        List<User> user1=userDao.findUsersByName("moh");
        assertEquals(0,user1.size());
    }

    @Test
    @Order(5)
    void findUsersByGender() {
        List<User> user=userDao.findUsersByGender(GENDER.MALE);
        assertEquals(0,user.size());
        List<User> user2=userDao.findUsersByGender(GENDER.FEMALE);
        assertEquals(1,user2.size());

    }
}