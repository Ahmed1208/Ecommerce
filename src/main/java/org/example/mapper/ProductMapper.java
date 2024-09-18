package org.example.mapper;
import jakarta.persistence.EntityManager;
import org.example.dao.CategoryDao;
import org.example.entity.Product;
import org.example.entity.Category;
import org.example.bean.ProductBean;
import java.util.Optional;


public class ProductMapper {
    private CategoryDao categoryDao;
    private EntityManager em;

    public ProductMapper(CategoryDao categoryDao,EntityManager entityManager) {
        em = entityManager;
        this.categoryDao= new CategoryDao(entityManager);

    }

    // Convert Product entity to ProductBean
    public ProductBean toBean(Product product) {
        if (product == null) {
            return null;
        }
        return new ProductBean(
                product.getId(),
                product.getProductName(),
                product.getDescription(),
                product.getQuantity(),
                product.getPrice(),
                product.getImage(),
                product.getCategory() != null ? product.getCategory().getName() : null
        );
    }

    // Convert ProductBean to Product entity
    public Product toEntity(ProductBean bean) {
        if (bean == null) {
            return null;
        }

        Optional<Category> categoryOptional = categoryDao.findCategoryByName(bean.getCategoryName());
        Category category = categoryOptional.orElse(null);

        return new Product(
                bean.getProductName(),
                bean.getDescription(),
                bean.getQuantity(),
                bean.getPrice(),
                category,
                bean.getImage()
        );
    }
}
