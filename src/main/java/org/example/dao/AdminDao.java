package org.example.dao;

import jakarta.persistence.EntityManager;
import org.example.Factory;
import org.example.entity.Admin;
import org.example.entity.GENDER;
import org.example.entity.User;

import java.util.List;
import java.util.Optional;

public class AdminDao extends Repository<Admin> {

    public AdminDao(EntityManager entityManager) {super(Admin.class, entityManager);}

    public Optional<Admin> findAdminByEmail(String email){
        List<Admin> list = findBy("email",email);
        if(list.isEmpty())
            return Optional.ofNullable( null );
        else
        return Optional.ofNullable(list.get(0));
    }
    public List<Admin> findAdminsByName(String name){
        return findBy("name",name);
    }
    public List<Admin> findAdminsByGender(GENDER gender){
        return findBy("gender",gender);
    }

}
