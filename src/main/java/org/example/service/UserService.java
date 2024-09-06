package org.example.service;

import jakarta.persistence.EntityManager;
import org.apache.commons.validator.routines.EmailValidator;
import org.example.dao.UserDao;
import org.example.entity.Address;
import org.example.entity.GENDER;
import org.example.entity.User;

import java.security.PublicKey;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Optional;

public class UserService {
    private UserDao userDao;
    private EntityManager em;
    public UserService(EntityManager entityManager)
    {
        em = entityManager;
        this.userDao = new UserDao(entityManager);
    }
    public User loginCheck(String email,String password) throws RuntimeException
    {
        Optional<User> result = userDao.findUserByEmail(email);

        if(result.isPresent())
        {
            if(password.equals(result.get().getPassword()))
                return result.get();
        }
        throw new RuntimeException("Wrong email or password, user not found");
    }
    public User registerNewUser(String name, String email, String password
            ,String street,String city,String country,String phone,String dob,String gender) {
        User user = new User();
        if (checkData(name, email, password, street, city, country, phone, dob, gender)){
            System.out.println("username:"+name);
            if (EmailValidator.getInstance().isValid(email)){

               if(!userDao.findUserByEmail(email).isPresent()){
                   GENDER g=gender.equals("Female")?GENDER.FEMALE:GENDER.MALE;

                   user = new User(name,email,password,g,0.0,dob,phone);
                   Address a = new Address(street,city,country,user);
                   user.setAddress(a);
                   try {
                       em.getTransaction().begin();
                       userDao.create(user);
                       em.getTransaction().commit();
                   }catch (Exception e) {
                       em.getTransaction().rollback();
                       throw new RuntimeException(e);
                   }
               }else {
                   System.out.println("Email already in use");
                   return null;
               }
            }else {
                System.out.println("invalid email");
                return null;
            }
        }else {
            System.out.println("enter all fields please");
            return null;
        }

        return user;

    }
    private boolean checkData(String name, String email, String password
            ,String street,String city,String country,String phone,String dob,String gender){
        if (name != null && !name.trim().isEmpty() &&
                email != null && !email.trim().isEmpty() &&
                password != null && !password.trim().isEmpty() &&
                street != null && !street.trim().isEmpty() &&
                city != null && !city.trim().isEmpty() &&
                country != null && !country.trim().isEmpty() &&
                phone != null && !phone.trim().isEmpty() &&
                dob != null && !dob.trim().isEmpty() &&
                gender != null && !gender.trim().isEmpty()){
            return true;
        }else {
            return false;
        }
    }

    public User findUserById(int id) throws RuntimeException
    {

        Optional<User> user = userDao.findById(id);

        if(user.isPresent())
        {
            System.out.println("Birthdate: " + user.get().getDateOfBirth());
            return user.get();
        }
        else{
            throw new RuntimeException("User not found");
        }
    }

    public void updateUser(User user) throws RuntimeException
    {
        try {
            em.getTransaction().begin();
            System.out.println("transatction has begun");
            userDao.update(user);
            System.out.println("merge operation applied");

            em.getTransaction().commit();
            System.out.println("commit done");

        }catch (RuntimeException e)
        {
            System.out.println("exception happened, commit is rolled back");
            throw new RuntimeException("Can't update this user");
        }
    }

}
