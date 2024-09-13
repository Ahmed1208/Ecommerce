package org.example.service;

import jakarta.persistence.EntityManager;
import org.example.dao.AdminDao;
import org.example.dao.UserDao;
import org.example.entity.Admin;

import java.util.Optional;

public class AdminService {

    private AdminDao adminDao;
    private EntityManager entityManager;

    public AdminService(EntityManager entityManager)
    {
        entityManager = entityManager;
        this.adminDao = new AdminDao(entityManager);
    }


    public Admin checkAdmin(String email,String password)
    {
        Optional<Admin> admin = adminDao.findAdminByEmail(email);
        if(admin.isPresent())
        {
            if(password == admin.get().getPassword())
                return admin.get();
            else
                throw new RuntimeException("Password is wrong");
        }
        else
            throw new RuntimeException("Email not found");
    }


}
