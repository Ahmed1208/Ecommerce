package org.example.service;

import jakarta.persistence.EntityManager;
import org.example.bean.ProductBean;
import org.example.dao.CategoryDao;
import org.example.dao.ProductDao;
import org.example.dao.UserDao;
import org.example.entity.Category;
import org.example.entity.Product;
import org.example.entity.User;
import org.example.mapper.ProductMapper;

import java.util.List;
import java.util.Optional;

public class CategoryService {
    private CategoryDao categoryDao;
    private EntityManager em;
    public CategoryService(EntityManager entityManager)
    {
        em = entityManager;
        this.categoryDao= new CategoryDao(entityManager);
    }


    public List<Category> getParentCategories() throws RuntimeException
    {
        return categoryDao.getParentCategories();
    }

    public Category addNewCategory(Category category) throws RuntimeException
    {
        try {
            em.getTransaction().begin();
            categoryDao.create(category);
            em.getTransaction().commit();
        }catch (Exception e) {
            em.getTransaction().rollback();
            throw new RuntimeException(e);
        }
        return category;
    }


}
