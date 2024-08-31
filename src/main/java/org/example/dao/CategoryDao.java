package org.example.dao;

import org.example.Factory;
import org.example.entity.Category;

public class CategoryDao extends Repository<Category> {

    public CategoryDao() {super(Category.class, Factory.entityManagerFactory.createEntityManager());}
    public Category findByName(String name) {
        return findBy("name",name).get(0);
    }



}