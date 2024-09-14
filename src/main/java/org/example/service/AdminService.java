package org.example.service;

import jakarta.persistence.EntityManager;
import org.example.dao.AdminDao;
import org.example.dao.OrderDao;
import org.example.dao.UserDao;
import org.example.entity.*;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

public class AdminService {

    private AdminDao adminDao;
    private EntityManager entityManager;

    public AdminService(EntityManager entityManager)
    {
        this.entityManager = entityManager;
        this.adminDao = new AdminDao(entityManager);
    }


    public Admin checkAdmin(String email,String password)
    {
        Optional<Admin> admin = adminDao.findAdminByEmail(email);
        if(admin.isPresent())
        {
            if(password.equals( admin.get().getPassword()) )
                return admin.get();
            else
                throw new RuntimeException("Password is wrong");
        }
        else
            throw new RuntimeException("Email not found");
    }

    public void updateAdmin(Admin admin)
    {
        try {
            entityManager.getTransaction().begin();
            System.out.println("transaction begin to update admin");

            adminDao.update(admin);
            System.out.println(" merge admin");

            entityManager.getTransaction().commit();
            System.out.println(" transaction completed");

        } catch (RuntimeException e) {

            throw new RuntimeException("Can't update this admin");
        }
    }

    public Map<Integer, List<Order>> getOrders(int pageNumber,int pageSize,Double minPrice,Double maxPrice,boolean sortByPrice,PAYMENT payment,STATUS status) throws Exception
    {
        try {
            OrderDao orderDao = new OrderDao(entityManager);
            return orderDao.filterOrders(status, payment, null, null, minPrice, maxPrice, sortByPrice, pageNumber, pageSize);
        }catch (Exception e)
        {
            throw new Exception("Something went wrong");
        }
    }

    public Map<Integer, List<User>> getUsers(int pageNumber,int pageSize) throws Exception
    {
        try {
            UserDao userDao = new UserDao(entityManager);
            return userDao.findAllUsers(pageNumber, pageSize);
        }catch (Exception e)
        {
            throw new Exception("Something went wrong");
        }
    }


}
