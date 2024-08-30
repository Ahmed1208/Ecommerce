package org.example.dao;

import jakarta.persistence.EntityManager;
import org.example.Factory;
import org.example.entity.Admin;

public class AdminDao extends Repository<Admin> {

    public AdminDao() {super(Admin.class, Factory.entityManagerFactory.createEntityManager());}


}
