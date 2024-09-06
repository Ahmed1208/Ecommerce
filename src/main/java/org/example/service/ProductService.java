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

public class ProductService {
    private ProductDao productDao;
    private CategoryDao categoryDao;
    private EntityManager em;
    public ProductService(EntityManager entityManager)
    {
        em = entityManager;
        this.productDao = new ProductDao(entityManager);
        this.categoryDao= new CategoryDao(entityManager);
    }
    public Product addNewProduct(ProductBean productbean) throws RuntimeException
    {
        ProductMapper productMapper=new ProductMapper(categoryDao,em);
        Product product= productMapper.toEntity(productbean);
        try {
            em.getTransaction().begin();
            productDao.create(product);
            em.getTransaction().commit();
        }catch (Exception e) {
            em.getTransaction().rollback();
            throw new RuntimeException(e);
        }
       return product;
    }

    public List<Category> getSubCategories() throws RuntimeException
    {
        return categoryDao.getSubCategories();

    }

    private boolean checkData(String name, String description,String quantity,String price,String image){
        if (name != null && !name.trim().isEmpty() &&
                description != null && !description.trim().isEmpty() &&
                quantity != null && !quantity.trim().isEmpty() &&
                price != null && !price.trim().isEmpty() &&
                image != null && !image.trim().isEmpty()){
            return true;
        }else {
            return false;
        }
    }
}
