package org.example.service;

import jakarta.persistence.EntityManager;
import org.example.dao.AdminDao;
import org.example.dao.UserDao;
import org.example.entity.Admin;
import org.example.entity.User;

import java.util.Optional;

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


}
