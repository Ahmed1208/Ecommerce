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
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

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
    public Product addNewProduct(Product product) throws RuntimeException
    {
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

    public Product findProductById(int id)
    {
        Optional<Product> product = productDao.findById(id);

        if(product.isPresent())
        {
            return product.get();
        }
        else{
            throw new RuntimeException("Product not found");
        }
    }


    public Map<Integer,List<Product>> findAllProducts(List<String> subCategories, Double minPrice, Double maxPrice, boolean sortByPrice, boolean sortByQuantity, int pageNumber, int pageSize)
    {

        if(subCategories == null)
            return productDao.filterProducts(null, minPrice,  maxPrice,  sortByPrice,  sortByQuantity, pageNumber,  pageSize);
        else
        {
            List<Category> subs = null;
            try {
                    subs = subCategories.stream().map(x -> {
                    return categoryDao.findCategoryByName(x).get();
                }).collect(Collectors.toList());
            }catch (Exception e)
            {
                throw new RuntimeException("SubCategory not found");
            }

            return productDao.filterProducts(subs, minPrice,  maxPrice,  sortByPrice,  sortByQuantity, pageNumber,  pageSize);

        }

    }


    public List<Product> findProductsBySubcategory(int subCategoryId)
    {
        return productDao.findProductsBySubCategory(subCategoryId);
    }

    public List<Product> getProductsByPage(int pageNumber) {
        int pageSize = 9; // Set the number of products per page
        return productDao.getProducts(pageNumber, pageSize);
    }

    public Integer getTotalProductCount() {
        return productDao.getProductCount();
    }
}
