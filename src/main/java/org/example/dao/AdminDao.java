package org.example.dao;

import jakarta.persistence.EntityManager;
import org.example.Factory;
import org.example.entity.Admin;
import org.example.entity.GENDER;
import org.example.entity.User;

import java.util.List;

public class AdminDao extends Repository<Admin> {

    public AdminDao(EntityManager entityManager) {super(Admin.class, entityManager);}

    public Admin adminLogin(String email, String password){
        Admin admin = findAdminByEmail(email);
        if(admin != null && admin.getPassword().equals(password)){
            return admin;
        }else {
            return null;
        }

    }
    public Admin findAdminByEmail(String email){
        return findBy("email",email).get(0);
    }
    public List<Admin> findAdminsByName(String name){
        return findBy("name",name);
    }
    public List<Admin> findAdminsByGender(GENDER gender){
        return findBy("gender",gender);
    }

}
